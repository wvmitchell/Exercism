export const reverseString = (input) => {
  if (input.length <= 1) {
    return input;
  } else {
    let lastChar = input[input.length - 1];
    let rest = input.slice(0, input.length - 1);
    return lastChar + reverseString(rest);
  }
};
