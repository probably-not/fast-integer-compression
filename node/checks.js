import FastIntegerCompression from "fastintcompression";

async function main(_params) {
  const unsignedTester = [10, 100000, 65999, 10, 10, 0, 1, 1, 2000, 0xffffffff];
  const unsignedSize =
    FastIntegerCompression.computeCompressedSizeInBytes(unsignedTester);
  const unsignedCompressed = FastIntegerCompression.compress(unsignedTester);
  const unsignedDecompressed =
    FastIntegerCompression.uncompress(unsignedCompressed);
  const unsignedCompressedComputed =
    FastIntegerCompression.computeHowManyIntegers(unsignedCompressed);
  console.log("Unsigned size compressed", unsignedSize);
  console.log("Unsigned compressed", unsignedCompressed);
  console.log("Unsigned decompressed", unsignedDecompressed);
  console.log(
    "Unsigned Encoded",
    Buffer.from(unsignedCompressed).toString("base64")
  );
  console.log(
    "Unsigned compressed computed uncompressed",
    unsignedCompressedComputed
  );

  const signedTester = [10, 100000, 65999, 10, 10, 0, -1, -1, -2000];
  const signedSize =
    FastIntegerCompression.computeCompressedSizeInBytesSigned(signedTester);
  const signedCompressed = FastIntegerCompression.compressSigned(signedTester);
  const signedDecompressed =
    FastIntegerCompression.uncompressSigned(signedCompressed);
  const signedCompressedComputed =
    FastIntegerCompression.computeHowManyIntegers(signedCompressed);

  console.log("Signed size compressed", signedSize);
  console.log("Signed compressed", signedCompressed);
  console.log("Signed decompressed", signedDecompressed);
  console.log(
    "Signed Encoded",
    Buffer.from(signedCompressed).toString("base64")
  );
  console.log(
    "Signed compressed computed uncompressed",
    signedCompressedComputed
  );
}

const params = {};
main(params)
  .then(() => {
    console.log("Completed checks");
  })
  .catch((reason) => {
    console.error("Failed to complete checks", reason);
  });
