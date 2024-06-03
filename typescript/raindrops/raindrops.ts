const dropNames: { [key: number]: string } = {
  3: 'Pling',
  5: 'Plang',
  7: 'Plong',
}

export function convert(drops: number): string {
  let statement = ''
  for(let d in dropNames)
    if(drops % parseInt(d) === 0) statement += dropNames[d]
  return statement.length > 0 ? statement : String(drops)
}
