export function valid(digitString: string): boolean {
  if(digitString.match(/[^\d|\s]/g)) return false
  if(digitString.replace(/\s/g, '').length <= 1) return false

  var digitStrings = digitString.match(/\d/g)?.reverse()
  var total = digitStrings?.map(Number)
                           .map(toLuhn)
                           .reduce(sum)

  return Number(total) % 10 === 0
}

function toLuhn(digit: number, index: number): number {
    let tmp = index % 2 === 1 ? digit * 2 : digit
    return tmp > 9 ? tmp - 9 : tmp
}

function sum(num1: number, num2: number): number {
  return num1 + num2
}
