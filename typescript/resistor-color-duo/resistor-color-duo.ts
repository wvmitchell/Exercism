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

const colorCode = (color: string): number => COLORS.indexOf(color)

export const decodedValue = ([tens, ones]: string[]): number => {
  return colorCode(tens) * 10 + colorCode(ones)
}
