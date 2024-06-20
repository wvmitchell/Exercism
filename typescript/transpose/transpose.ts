export function transpose(lines: string[]): string[] {
  if (lines.length === 0) return lines;

  let matrix = makeMatrix(lines);
  let transposedMatrix = transposeMatrix(matrix);

  return parseMatrix(transposedMatrix);
}

function makeMatrix(lines: string[]): string[][] {
  let maxLength = [...lines].sort((a, b) => b.length - a.length)[0].length;
  return lines.map((line) => {
    return line.replace(/\s/g, "$").padEnd(maxLength, " ").split("");
  });
}

function transposeMatrix(matrix: string[][]): string[][] {
  let transposed: string[][] = [];

  for (let i = 0; i < matrix[0].length; i++) {
    transposed[i] = [];
    for (let j = 0; j < matrix.length; j++) {
      transposed[i][j] = matrix[j][i];
    }
  }

  return transposed;
}

function parseMatrix(matrix: string[][]): string[] {
  return matrix.map((row) => {
    return row.join("").trimEnd().replace(/\$/g, " ");
  });
}
