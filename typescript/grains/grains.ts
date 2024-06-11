export const square = (square_num: number): BigInt => {
  if (square_num < 1 || square_num > 64) {
    throw new Error('square must be between 1 and 64')
  }
  return BigInt(2 ** (square_num - 1))
}

export const total = (): BigInt => {
  return 2n ** 64n - 1n
}
