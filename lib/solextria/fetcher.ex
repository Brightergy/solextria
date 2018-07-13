defmodule Solextria.Fetcher do
  @moduledoc """
  Module that performs data fetching from solectria
  """

  use HTTPoison.Base
  import Solextria.Utils
  require Logger

  @ua "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:49.0) Gecko/20100101 Firefox/49.0"

  @doc """
  Decode the xml response body
  """
  @spec process_response_body(binary) :: term
  def process_response_body(body) do
    body
    |> Solextria.Parser.parse()
  end

  def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: body

  def process_response(%HTTPoison.Response{status_code: status_code, body: body}),
    do: {status_code, body}

  @doc """
  Gets solectria data from solectria cloud
  """
  def get_data(site_id, username, password, uri, realm, base_url, start_ts, end_ts, http_opts) do
    auth_header =
      if username != nil && password != nil,
        do: HTTPDigex.create_digest(username, password, uri, realm),
        else: nil

    base_url = if base_url |> is_nil, do: "http://solrenview.com", else: base_url
    url = build_url("#{base_url}#{uri}", site_id, start_ts, end_ts)
    Logger.debug("The solectria URL is #{url}")
    get(url, [{"Authorization", auth_header}, {"User-Agent", @ua}], build_http_opts(http_opts))
  end

  def build_url(url, site_id, start_ts, end_ts) do
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

  defp add_ts(url, start_ts, end_ts) when is_integer(start_ts) and is_integer(end_ts) do
    _add_ts(url, start_ts, end_ts)
  end

  defp add_ts(url, start_ts, end_ts) when is_nil(start_ts) and is_nil(end_ts) do
    end_ts =
      current_ts
      |> normalized_ts

    start_ts = end_ts - 60
    _add_ts(url, start_ts, end_ts)
  end

  defp add_ts(url, start_ts, end_ts) when is_nil(start_ts) do
    start_ts = end_ts - 60
    _add_ts(url, start_ts, end_ts)
  end

  defp add_ts(url, start_ts, end_ts) when is_nil(end_ts) do
    end_ts = start_ts + 60
    _add_ts(url, start_ts, end_ts)
  end

  defp add_ts(url, start_ts, end_ts), do: "#{url}&ts_start=#{start_ts}&ts_end=#{end_ts}"

  defp _add_ts(url, start_ts, end_ts) do
    end_time =
      end_ts
      |> ts_to_iso8601

    start_time =
      start_ts
      |> ts_to_iso8601

    "#{url}&ts_start=#{start_time}&ts_end=#{end_time}"
  end
end
