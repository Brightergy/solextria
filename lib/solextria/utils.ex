defmodule Solextria.Utils do
  @moduledoc """
  Misc util functions for Solextria
  """
  @epoch :calendar.datetime_to_gregorian_seconds({{1970, 1, 1}, {0, 0, 0}})

  def build_http_opts(opts), do: Keyword.merge(Application.get_env(:solextria, :http_opts), opts)

  def current_ts, do: :os.system_time(:seconds)

  def normalized_ts(ts), do: div(ts, 60) * 60

  def ts_to_datetime(ts), do: ts |> Kernel.+(@epoch) |> :calendar.gregorian_seconds_to_datetime

  def datetime_to_ts(dt), do: dt |> :calendar.datetime_to_gregorian_seconds |> Kernel.-(@epoch)

  def current_utc_time, do: :erlang.universaltime

  def current_time_to_iso8601 do
    current_utc_time
    |> erlang_time_to_iso8601
  end

  def erlang_time_to_iso8601({{yr, mth, day}, {hr, mm, ss}}) do
    List.flatten(:io_lib.format("~4..0w-~2..0w-~2..0wT~2..0w:~2..0w:~2..0wZ", [yr, mth, day, hr, mm, ss]))
  end

  def ts_to_iso8601(ts) do
    ts
    |> ts_to_datetime
    |> erlang_time_to_iso8601
  end
end
