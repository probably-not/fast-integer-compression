import FastIntegerCompression from "fastintcompression";

async function main(_params) {
  const unsignedTester = [10, 100000, 65999, 10, 10, 0, 1, 1, 2000, 0xffffffff];
  const unsignedSize =
    FastIntegerCompression.computeCompressedSizeInBytes(unsignedTester);
  const unsignedCompressed = FastIntegerCompression.compress(unsignedTester);

  console.log("Unsigned size compressed", unsignedSize);
  console.log("Unsigned compressed", unsignedCompressed);

  const signedTester = [10, 100000, 65999, 10, 10, 0, -1, -1, -2000];
  const signedSize =
    FastIntegerCompression.computeCompressedSizeInBytesSigned(signedTester);
  const signedCompressed = FastIntegerCompression.compressSigned(signedTester);

  console.log("Signed size compressed", signedSize);
  console.log("Signed compressed", signedCompressed);
}

const params = {};
main(params)
  .then(() => {
    console.log("Completed checks");
  })
  .catch((reason) => {
    console.error("Failed to complete checks", reason);
  });
