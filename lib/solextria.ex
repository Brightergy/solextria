defmodule Solextria do
  @moduledoc """
  Solextria is an API client to the XML Feed API of Solectria DataLoggers. Solectria dataloggers use Sunspec Alliance standardized data format.

  This XML Feed client gets and parses solectria data given the site id.

  ## Examples

      iex> Solextria.get(148)

      iex> Solextria.get(148, start_ts: 142342332, end_ts: 142344332)

  You can pass following keyword arguments and Solextria should be able to handle it as long as solren supports:

      [
        username: "http_auth_user",
        password: "http_auth_pass",
        base_url: "custom_solren_url",
        start_ts: start_unix_ts,
        end_ts: end_unix_ts,
        uri: "custom_xmlfeed_uri",
        realm: "realm_to_auth_for",
        http_opts: [] # anything you wish to pass to httpoison -> eg: recv_timeout: 15_000
    ]
  """

  require Logger

  @doc """
  Module entry point to be used by external programs
  """
  @spec get(String.t, List.t) :: Tuple.t
  def get(site_id, opts \\ []) do
    username = opts[:username] || nil
    password = opts[:password] || nil
    base_url = opts[:base_url] || nil
    start_ts = opts[:start_ts] || nil
    end_ts = opts[:end_ts] || nil
    uri = opts[:uri] || "/XMLFeed/ss-xmlN.php?show_whl=1&show_faults=1&use_utc=1"
    realm = opts[:realm] || "Solren"
    http_opts = opts[:http_opts] || []

    result = Solextria.Fetcher.get_data(site_id, username, password, uri, realm, base_url, start_ts, end_ts, http_opts)
    Logger.debug inspect result
    case result do
      {:ok, %HTTPoison.Response{status_code: 200, body: {:error, body}}} ->
        {:error, body}
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}
      _ ->
        Logger.info inspect result
        {:error, "An error occurred while fetching data!"}
    end
  end
end
