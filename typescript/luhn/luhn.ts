export function valid(digitString: string): boolean {
  if(digitString.match(/[^\d|\s]/g)) return false
  if(digitString.replace(/\s/g, '').length <= 1) return false

  var digits = digitString.match(/\d/g)?.map(val => parseInt(val))
  var modified = digits?.reverse().map((digit, index) => {
    let tmp = index % 2 === 1 ? digit * 2 : digit
    return tmp > 9 ? tmp - 9 : tmp
  })
  var total = modified?.reduce((sum, num) => sum + num)

  return Number(total) % 10 === 0
}
