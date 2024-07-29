defmodule FastIntegerCompression.Unsigned do
  @moduledoc false

  alias FastIntegerCompression.Utils

  def compress(_lst) do
    []
  end

  def uncompress(_lst) do
    []
  end

  def expected_compressed_size(lst) do
    for v <- lst, reduce: 0 do
      acc -> acc + Utils.bytelog(v)
    end
  end

  def expected_decompressed_size(_lst) do
    0
  end
end
