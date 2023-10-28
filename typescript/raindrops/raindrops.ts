const dropWords: [number, string][] = [
  [3, "Pling"],
  [5, "Plang"],
  [7, "Plong"],
]

export function convert(drops: number): string {
  let statement = ""
  //drops % 3 === 0 && (statement += "Pling")
  //drops % 5 === 0 && (statement += "Plang")
  //drops % 7 === 0 && (statement += "Plong")
  for (let [num, word] of dropWords) {
    if(drops % num === 0) statement += word
  }
  return statement || `${drops}`
}
