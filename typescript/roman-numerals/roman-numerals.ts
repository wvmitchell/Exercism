const romanNumerals: { [key: string]: string } = {
  1: 'I',
  4: 'IV',
  5: 'V',
  9: 'IX',
  10: 'X',
  40: 'XL',
  50: 'L',
  90: 'XC',
  100: 'C',
  400: 'CD',
  500: 'D',
  900: 'CM',
  1000: 'M',
}

export const toRoman = (num: number): string => {
  let keys = Object.keys(romanNumerals).reverse()

  return keys.reduce((numeral, n) => {
    let times = Math.floor(num / parseInt(n))
    num = num % parseInt(n)
    return numeral + romanNumerals[n].repeat(times)
  }, '')
}
