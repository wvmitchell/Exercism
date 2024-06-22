import assert from "assert";

export const largestProduct = (series: string, span: number): number => {
  assert(series.length >= span, "Span must be smaller than string length");
  assert(series.match(/^\d*$/), "Digits input must only contain digits");
  assert(span > 0, "Span must not be negative");

  let left = 0;
  let right = span;
  let maxProduct = 0;

  let nums = series.split("").map(Number);

  while (right <= nums.length) {
    let product = nums.slice(left, right).reduce((acc, num) => acc * num);
    maxProduct = product > maxProduct ? product : maxProduct;
    left++;
    right++;
  }

  return maxProduct;
};
