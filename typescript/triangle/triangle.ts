export class Triangle {
  private sides: number[]
  private uniq: Set<number>

  constructor(...sides: number[]) {
    this.sides = sides.sort();
    this.uniq = new Set(this.sides)
  }

  get isEquilateral(): boolean {
    const { uniq, isTriangle } = this;
    const allSidesEqual = uniq.size === 1

    return isTriangle && allSidesEqual;
  }

  get isIsosceles(): boolean {
    const { uniq, isTriangle, isEquilateral } = this;
    let twoSidesEqual = uniq.size === 2

    return isEquilateral || (isTriangle && twoSidesEqual);
  }

  get isScalene(): boolean {
    const { uniq, isTriangle } = this;
    const allSidesInequal = uniq.size === 3

    return isTriangle && allSidesInequal;
  }

  get isTriangle(): boolean {
    const [a, b, c] = this.sides
    const nonZeroLengths = a > 0
    const satisfiesInequality = a + b >= c

    return nonZeroLengths && satisfiesInequality;
  }
}
