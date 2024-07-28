defmodule FastIntegerCompression.Utils do
  @moduledoc false

  import Bitwise

  @spec bytelog(val :: integer()) :: 1 | 2 | 3 | 4 | 5
  def bytelog(val) when val < 1 <<< 7, do: 1
  def bytelog(val) when val < 1 <<< 14, do: 2
  def bytelog(val) when val < 1 <<< 21, do: 3
  def bytelog(val) when val < 1 <<< 28, do: 4
  def bytelog(_val), do: 5

  @spec zigzag_encode(integer()) :: integer()
  def zigzag_encode(val), do: bxor(val + val, val >>> 31)

  @spec zigzag_decode(integer()) :: integer()
  def zigzag_decode(val), do: bxor(val >>> 1, -band(val, 1))
end
