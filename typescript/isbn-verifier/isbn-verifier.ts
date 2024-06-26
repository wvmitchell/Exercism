const charValues: { [key: string]: number } = {
  0: 0,
  1: 1,
  2: 2,
  3: 3,
  4: 4,
  5: 5,
  6: 6,
  7: 7,
  8: 8,
  9: 9,
  X: 10,
};

export function isValid(isbn: string): boolean {
  if (!isbn.match(/^[0-9|-]*[0-8|X]$/)) return false;

  let chars = isbn.match(/\d|X/g);
  if (chars?.length !== 10) {
    return false;
  } else {
    let total = 0;

    for (let i = 10; i >= 1; i--) {
      let char = chars[10 - i];
      let value = charValues[char];
      total += i * value;
    }

    return total % 11 === 0;
  }
}
