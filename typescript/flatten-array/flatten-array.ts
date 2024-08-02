type NestedArray = (number | NestedArray)[];

export function flatten(input: number | NestedArray): NestedArray {
  if (typeof input === "number") {
    return [input];
  } else if (!input || input.length === 0) {
    return [];
  } else {
    const [first, ...rest] = input;
    return [...flatten(first), ...flatten(rest)];
  }
}
