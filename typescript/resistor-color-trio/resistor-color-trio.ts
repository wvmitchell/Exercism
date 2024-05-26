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

export const decodedResistorValue = ([tens, ones, power]: string[]): string => {
  let ohms = (colorCode(tens) * 10 + colorCode(ones)) * 10 ** colorCode(power)
  let prefix = ''
  if(ohms > 10**9) {
    ohms/= 10**9
    prefix = 'giga'
  } else if(ohms > 10**6) {
    ohms/= 10**6
    prefix = 'mega'
  } else if(ohms > 1000) {
    ohms/= 10**3
    prefix = 'kilo'
  }
  return `${ohms} ${prefix}ohms`
}
