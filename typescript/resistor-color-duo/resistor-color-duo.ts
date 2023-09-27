export function decodedValue(colors: Array<string>): number {
  const numberString = `${COLORS.indexOf(colors[0])}${COLORS.indexOf(colors[1])}`
  return parseInt(numberString)
}

const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
]
