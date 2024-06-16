export function sum(factors: number[], limit: number): number {
  let multiples: number[] = []

  for(let i = 0; i < limit; i++) {
    if(factors.some(n => i % n === 0)) {
      multiples.push(i)
    }
  }

  return multiples.reduce((acc, num) => acc + num, 0)
}
