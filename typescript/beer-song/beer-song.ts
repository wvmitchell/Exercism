export function verse(index: number): string {
  const [current, next] = [index, index - 1];
  const itemLabel = current === 1 ? "it" : "one";

  const standardLine = `${bottleDescription(current)} of beer on the wall, ${bottleDescription(current)} of beer.\nTake ${itemLabel} down and pass it around, ${bottleDescription(next)} of beer on the wall.\n`;
  const lastLine = `No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n`;

  if (index >= 1) {
    return standardLine;
  } else {
    return lastLine;
  }
}

export function bottleDescription(index: number): string {
  if (index === 1) {
    return "1 bottle";
  } else if (index === 0) {
    return "no more bottles";
  } else {
    return `${index} bottles`;
  }
}

export function sing(
  initialBottlesCount?: number,
  takeDownCount?: number,
): string {
  let result = "";

  for (let i = initialBottlesCount || 99; i > (takeDownCount || 0); i--) {
    result += verse(i);
    result += "\n";
  }

  result += verse(takeDownCount || 0);

  return result;
}
