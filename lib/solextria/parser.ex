defmodule Solextria.Parser do
  @moduledoc """
  Parser module to parse the xml body
  """

  @doc """
  Parses and returns data fetched from Solectria data logger
  """
  def parse(data) do
    data
    # data_block = Floki.find(data, "data")
    # case data_block |> Enum.count do
    #   0 ->
    #     :error
    #   _ ->
    #     [{_, atts, values} | _rest] = Floki.find(data, "data")
    #
    #     # get attributes
    #     atts = atts |> Enum.map(fn {name, value} ->
    #         case value do
    #             "0x" <> num -> {name, hex_to_int(num)}
    #             _ -> {name, value}
    #         end
    #     end) |> Enum.into(%{})
    #
    #     # create list of registers
    #     registers = values
    #       |> Floki.find("cname")
    #       |> Enum.map(fn {_, _, register} -> register end)
    #       |> List.flatten
    #
    #     # get values for first register name
    #     values = Floki.find(values, "r")
    #       |> Enum.map(fn r ->
    #         Floki.find(r, "c")
    #         |> Enum.map(fn {_, _, value} -> value end)
    #         |> List.flatten
    #       end)
    #       |> List.zip
    #       |> Enum.map(fn x -> Tuple.to_list(x) end)
    #
    #     data = Enum.zip(registers, values) |> Enum.into(%{})
    #     %{attributes: atts, data: data}
    # end
  end

  @doc """
  Converts hex to integer value as string representation
  """
  def hex_to_int(hex) do
    hex |> String.to_integer(16) |> Integer.to_string
  end
end
