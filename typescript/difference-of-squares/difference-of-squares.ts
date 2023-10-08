export class Squares {
  private count: number

  constructor(count: number) {
    this.count = count
  }

  get sumOfSquares(): number {
    const n = this.count
    return (n * (n + 1) * (2*n + 1)) / 6
  }

  get squareOfSum(): number {
    const n = this.count
    return ((2 + (n - 1)) * (n / 2)) ** 2
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares
  }
}
