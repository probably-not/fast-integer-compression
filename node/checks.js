import FastIntegerCompression from "fastintcompression";

async function main(_params) {
  const size = FastIntegerCompression.computeCompressedSizeInBytes([
    10, 100000, 65999, 10, 10, 0, 1, 1, 2000, 0xffffffff,
  ]);

  console.log(size);
}

const params = {};
main(params)
  .then(() => {
    console.log("Completed checks");
  })
  .catch((reason) => {
    console.error("Failed to complete checks", reason);
  });
