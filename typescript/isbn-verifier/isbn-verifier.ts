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

  let chars = isbn.match(/\d|X/g) || [];

  if (chars.length !== 10) {
    return false;
  } else {
    let total = chars.reverse().reduce((runningTotal, num, i) => {
      let char = chars[i];
      let value = charValues[char];
      return runningTotal + (i + 1) * value;
    }, 0);

    return total % 11 === 0;
  }
}
