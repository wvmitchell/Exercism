export function decodedResistorValue(colors: Array<string>): string {
  const first_digit = COLORS.indexOf(colors[0])
  const second_digit = COLORS.indexOf(colors[1])
  const number = parseInt(`${first_digit}${second_digit}`)
  const base = 10 ** COLORS.indexOf(colors[2])
  const ohms = number * base
  const modifier = MODIFIERS.find(mod => (ohms >= mod[0]))

  return modifier ? `${ohms / modifier[0]} ${modifier[1]}ohms` : '0 ohms'
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

const MODIFIERS: Array<any> = [
  [1000000000, 'giga'],
  [1000000, 'mega'],
  [1000, 'kilo'],
  [1, '']
]
