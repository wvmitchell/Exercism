export class Triangle {
  sides: number[]
  sidesSet: Set<number>

  constructor(...sides: number[]) {
    this.sides = sides.sort()
    this.sidesSet = new Set(sides)
  }

  get isEquilateral(): boolean {
    return this.valid && this.sidesSet.size === 1
  }

  get isIsosceles(): boolean {
    return this.valid && this.sidesSet.size <= 2
  }

  get isScalene(): boolean {
    return this.valid && this.sidesSet.size === 3
  }

  private get valid(): boolean {
    return this.nonZeroSides && 
           this.satisifiesTriangleInequality
  }

  private get nonZeroSides(): boolean {
    return this.sides.every(s => s > 0)
  }

  private get satisifiesTriangleInequality(): boolean {
    const [a, b, c] = this.sides
    return a + b >= c
  }
}
