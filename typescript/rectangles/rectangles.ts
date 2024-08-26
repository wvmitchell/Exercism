export function count(diagram: string[]): number {
  const cornerMatrix = diagram.map((row) => {
    return row.split("");
  });
  return countRectangles(cornerMatrix);
}

function countRectangles(cornerMatrix: string[][]): number {
  let result = 0;
  for (let y = 0; y < cornerMatrix.length - 1; y++) {
    for (let x = 0; x < cornerMatrix[y].length - 1; x++) {
      if (cornerMatrix[y][x] === "+") {
        result += countRectanglesFromCorner(cornerMatrix, x, y);
      }
    }
  }
  return result;
}

function countRectanglesFromCorner(
  cornerMatrix: string[][],
  x: number,
  y: number,
): number {
  let result = 0;
  for (let y2 = y + 1; y2 < cornerMatrix.length; y2++) {
    for (let x2 = x + 1; x2 < cornerMatrix[y2].length; x2++) {
      if (completeRectangle(cornerMatrix, x, y, x2, y2)) {
        result += 1;
      }
    }
  }
  return result;
}

function completeRectangle(
  cornerMatrix: string[][],
  x1: number,
  y1: number,
  x2: number,
  y2: number,
): boolean {
  return (
    cornerMatrix[y1][x1] === "+" &&
    cornerMatrix[y1][x2] === "+" &&
    cornerMatrix[y2][x1] === "+" &&
    cornerMatrix[y2][x2] === "+" &&
    cornerMatrix[y1]
      .slice(x1 + 1, x2)
      .every((cell) => cell === "-" || cell === "+") &&
    cornerMatrix[y2]
      .slice(x1 + 1, x2)
      .every((cell) => cell === "-" || cell === "+") &&
    cornerMatrix
      .slice(y1 + 1, y2)
      .every(
        (row) =>
          (row[x1] === "|" || row[x1] === "+") &&
          (row[x2] === "|" || row[x2] === "+"),
      )
  );
}
