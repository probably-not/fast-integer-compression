defmodule FastIntegerCompression.Unsigned.Sizer do
  @moduledoc false

  alias FastIntegerCompression.Utils

  @spec expected_compressed_size(list(non_neg_integer())) :: non_neg_integer()
  def expected_compressed_size(lst) do
    for v <- lst, reduce: 0 do
      acc -> acc + Utils.bytelog(v)
    end
  end
end
