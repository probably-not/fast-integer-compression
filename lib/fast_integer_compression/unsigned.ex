defmodule FastIntegerCompression.Unsigned do
  @moduledoc false

  alias __MODULE__
  alias FastIntegerCompression.Utils

  defdelegate compress(lst), to: Unsigned.Compressor

  def uncompress(_lst) do
    []
  end

  def expected_compressed_size(lst) do
    for v <- lst, reduce: 0 do
      acc -> acc + Utils.bytelog(v)
    end
  end
end
