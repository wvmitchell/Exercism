export class Rational {
  numerator: number
  denominator: number

  constructor(numerator: number, denominator: number) {
    this.numerator = numerator
    this.denominator = denominator
  }

  add(other: Rational): Rational {
    const {numerator: a1, denominator: b1} = this
    const {numerator: a2, denominator: b2} = other
    const newNumerator = a1 * b2 + a2 * b1
    const newDenominator = b1 * b2
    return new Rational(newNumerator, newDenominator).reduce()
  }

  sub(other: Rational): Rational {
    const {numerator: a1, denominator: b1} = this
    const {numerator: a2, denominator: b2} = other
    const newNumerator = a1 * b2 - a2 * b1
    const newDenominator = b1 * b2
    return new Rational(newNumerator, newDenominator).reduce()
  }

  mul(other: Rational): Rational {
    const {numerator: a1, denominator: b1} = this
    const {numerator: a2, denominator: b2} = other
    const newNumerator = a1 * a2
    const newDenominator = b1 * b2
    return new Rational(newNumerator, newDenominator).reduce()
  }

  div(other: Rational): Rational {
    const {numerator: a1, denominator: b1} = this
    const {numerator: a2, denominator: b2} = other
    const newNumerator = a1 * b2
    const newDenominator = a2 * b1
    return new Rational(newNumerator, newDenominator).reduce()
  }

  abs(): Rational {
    return new Rational(
      Math.abs(this.numerator), 
      Math.abs(this.denominator)
    ).reduce()
  }

  exprational(num: number): Rational {
    const {numerator: a, denominator: b} = this
    const newNumerator = (num > 0 ? a : b) ** Math.abs(num)
    const newDenominator = (num > 0 ? b : a) ** Math.abs(num)
    return new Rational(newNumerator, newDenominator).reduce()
  }

  expreal(num: number): number {
    return Math.pow(num, this.numerator/this.denominator)
  }

  reduce(): Rational {
    const gcd = this.gcd(this.numerator, this.denominator)
    let newNumerator = this.numerator / gcd
    let newDenominator = this.denominator / gcd
    if(newDenominator < 0) {
      newNumerator *= -1
      newDenominator *= -1
    }
    return new Rational(newNumerator, newDenominator)
  }

  private gcd(a: number, b: number): number {
    if(!b) {
      return a
    } else {
      return this.gcd(b, a % b) 
    }
  }
}

