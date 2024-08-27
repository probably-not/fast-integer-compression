defmodule FastIntegerCompression.Bench.Util do
  def gen_unsigned(count), do: gen(count, 0..2_000_000_000//1)
  def gen_signed(count), do: gen(count, -2_000_000_000..2_000_000_000//1)

  defp gen(count, range) do
    Stream.repeatedly(fn -> Enum.random(range) end) |> Enum.take(count)
  end
end
