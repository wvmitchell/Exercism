export function sum(factors: number[], limit: number): number {
  let multiples: number[] = []

  for(let i = 0; i < limit; i++) {
    if(factors.some(factor => i % factor === 0)) multiples.push(i)
  }

  return multiples.reduce((total, num) => total + num, 0)
}
