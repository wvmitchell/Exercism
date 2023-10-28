export function compute(left: string, right: string): number {
  if(left.length === right.length) {
    return [...left].filter((n, i) => n !== right[i]).length
  }
  throw Error("DNA strands must be of equal length.")
}
