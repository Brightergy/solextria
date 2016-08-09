defmodule Solextria.Utils do
  @moduledoc """
  Misc util functions for Solextria
  """
  def current_time_to_iso8601 do
    :erlang.now
    |> :calendar.now_to_universal_time
    |> erlang_time_to_iso8601
  end
  def erlang_time_to_iso8601({{yr, mth, day}, {hr, mm, ss}}) do
    List.flatten(:io_lib.format("~4..0w-~2..0w-~2..0wT~2..0w:~2..0w:~2..0wZ", [yr, mth, day, hr, mm, ss]))
  end
end
