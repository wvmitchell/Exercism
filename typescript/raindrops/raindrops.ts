export function convert(drops: number): string {
  let statement = ''
  if(drops % 3 === 0) statement += 'Pling'
  if(drops % 5 === 0) statement += 'Plang'
  if(drops % 7 === 0) statement += 'Plong'
  return statement.length > 0 ? statement : String(drops)
}
