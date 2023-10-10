export function steps(start: number): number {
  if(start < 1 || start % 1 > 0) {
    throw Error('Only positive integers are allowed')
  }

  let n = start
  let count = 0
  while(n !== 1) {
    n = n % 2 === 0 ? n / 2 : 3 * n + 1
    count++
  }

  return count
}
