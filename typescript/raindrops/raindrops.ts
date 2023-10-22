export function convert(drops: number): string {
  let statement = ""
  drops % 3 === 0 && (statement += "Pling")
  drops % 5 === 0 && (statement += "Plang")
  drops % 7 === 0 && (statement += "Plong")
  statement === "" && (statement = `${drops}`)
  return statement
}
