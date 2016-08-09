defmodule Solextria do
  @moduledoc """
  Gets and parses solectria data given the site id
  """

  @doc """
  Module entry point to be used by external programs
  """
  @spec solextria_parser(String.t, List.t) :: Tuple.t
  def solextria_parser(site_id, opts \\ []) do
    username = opts[:username] || nil
    password = opts[:password] || nil
    base_url = opts[:base_url] || nil
    start_ts = opts[:start_ts] || nil
    end_ts = opts[:end_ts] || nil
    uri = opts[:uri] || "/XMLFeed/ss-xmlN.php?show_whl=1&show_faults=1"
    realm = opts[:realm] || "Solren"

    result = Solextria.Fetcher.get_data(site_id, username, password, uri, realm, base_url, start_ts, end_ts)
    case result do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      _ ->
        {:error, "An error occurred while fetching data!"}
    end
  end
end
