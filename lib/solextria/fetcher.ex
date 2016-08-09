defmodule Solextria.Fetcher do
  use HTTPoison.Base

  @moduledoc """
  Module that performs data fetching from solectria
  """

  @doc """
  Decode the xml response body
  """
  @spec process_response_body(binary) :: term
  def process_response_body(body) do
    body
    |> Solextria.Parser.parse
  end

  def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: body
  def process_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, body }

  @doc """
  Gets solectria data from solectria cloud
  """
  def get_data(site_id, username, password, uri, realm, base_url, start_ts, end_ts) do
    auth_header = nil
    if username != nil && password != nil do
      auth_header = HTTPDigex.create_digest(username, password, uri, realm)
    end
    base_url = if base_url |> is_nil, do: "http://solrenview.com", else: base_url
    url = build_url(base_url, site_id, start_ts, end_ts)
    get(url, [{"Authorization", auth_header}])
  end

  defp build_url(url, site_id, start_ts, end_ts) do
    url
    |> add_site_id(site_id)
    |> add_ts(start_ts, end_ts)
  end

  defp add_site_id(url, site_id) do
    if String.contains?(url, ".php?") do
      "#{url}&site_id=#{site_id}"
    else
      "#{url}?site_id=#{site_id}"
    end
  end

  defp add_ts(url, start_ts, end_ts) when is_nil(start_ts) and is_nil(end_ts) do
  end
end
