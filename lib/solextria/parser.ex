defmodule Solextria.Parser do
  @moduledoc """
  Parser module to parse the xml body
  """

  @doc """
  Parses and returns data fetched from Solectria data logger
  """
  def parse(data) do
    data_block = Floki.find(data, "sunspecplantextract")
    case length(data_block) do
      0 ->
        :error
      _ ->
        [{_, atts, values} | _rest] = data_block
        atts ++ values
    end
  end
end
