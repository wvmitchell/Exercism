export function verse(index: number): string {
  const standardLine = `${index} bottles of beer on the wall, ${index} bottles of beer.\nTake one down and pass it around, ${
    index - 1
  } bottles of beer on the wall.\n`;
  const thirdToLasLine = `2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n`;
  const secondToLastLine = `1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n`;
  const lastLine = `No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n`;

  if (index > 2) {
    return standardLine;
  } else if (index === 2) {
    return thirdToLasLine;
  } else if (index === 1) {
    return secondToLastLine;
  } else {
    return lastLine;
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
