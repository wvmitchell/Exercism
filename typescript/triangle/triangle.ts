export class Triangle {
  private sides: number[];

  constructor(...sides: number[]) {
    this.sides = sides;
  }

  get isEquilateral(): boolean {
    const { sides, isTriangle } = this;

    const allSidesEqual = sides.every((s) => s === sides[0]);

    return isTriangle && allSidesEqual;
  }

  get isIsosceles(): boolean {
    const { sides, isTriangle } = this;

    let twoSidesEqual = Boolean(
      sides.find((side, index) => {
        const sidesCopy = [...sides];
        sidesCopy.splice(index, 1);
        return sidesCopy.includes(side);
      }),
    );

    return isTriangle && twoSidesEqual;
  }

  get isScalene(): boolean {
    const { sides, isTriangle } = this;

    const allSidesInequal = sides.every((side, index) => {
      const sidesCopy = [...sides];
      sidesCopy.splice(index, 1);
      return !sidesCopy.includes(side);
    });

    return isTriangle && allSidesInequal;
  }

  get isTriangle(): boolean {
    const { sides } = this;
    const [a, b, c] = sides;
    const nonZeroLengths = sides.every((side) => side > 0);
    const satisfiesInequality = sides.every((side, index) => {
      let sidesCopy = [...sides];
      sidesCopy.splice(index, 1);
      return sidesCopy.reduce((s, n) => s + n) >= side;
    });

    return nonZeroLengths && satisfiesInequality;
  }
}
