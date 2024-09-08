import FastIntegerCompression.Bench.Util

ten_k_signed = gen_signed(10_000)
ten_k_unsigned = gen_unsigned(10_000)

Benchee.run(
  %{
    "10K_Unsigned_Compression" => fn ->
      FastIntegerCompression.Unsigned.compress(ten_k_unsigned)
    end
  },
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown, file: "bench/results/10K_Unsigned_Compression.md"}
  ]
)

Benchee.run(
  %{
    "10K_Signed_Compression" => fn ->
      FastIntegerCompression.Signed.compress(ten_k_signed)
    end
  },
  formatters: [
    Benchee.Formatters.Console,
    {Benchee.Formatters.Markdown, file: "bench/results/10K_Signed_Compression.md"}
  ]
)
