export class Rational {
  numerator: number
  denominator: number

  constructor(numerator: number, denominator: number) {
    this.numerator = numerator
    this.denominator = denominator
  }

  add(other: Rational): Rational {
    const newNumerator = (this.numerator *
                         other.denominator) +
                         (other.numerator *
                         this.denominator)
    const newDenominator = this.denominator *
                           other.denominator
    return new Rational(newNumerator, newDenominator).reduce()
  }

  sub(other: Rational): Rational {
    const newNumerator = (this.numerator *
                         other.denominator) -
                         (other.numerator *
                         this.denominator)
    const newDenominator = this.denominator *
                           other.denominator
    return new Rational(newNumerator, newDenominator).reduce()
  }

  mul(other: Rational): Rational {
    const newNumerator = this.numerator * other.numerator
    const newDenominator = this.denominator * other.denominator
    return new Rational(newNumerator, newDenominator).reduce()
  }

  div(number: Rational): Rational {
    const newNumerator = this.numerator * number.denominator
    const newDenominator = number.numerator * this.denominator
    return new Rational(newNumerator, newDenominator).reduce()
  }

  abs(): Rational {
    const newNumerator = Math.abs(this.numerator)
    const newDenominator = Math.abs(this.denominator)
    return new Rational(newNumerator, newDenominator).reduce()
  }

  exprational(exponent: number): Rational {
    const newNumerator = Math.pow(this.numerator, Math.abs(exponent))
    const newDenominator = Math.pow(this.denominator, Math.abs(exponent))
    return exponent >= 0 ? new Rational(newNumerator, newDenominator).reduce() : new Rational(newDenominator, newNumerator).reduce()
  }

  expreal(base: number): number {
    return Math.pow(base, (this.numerator / this.denominator))
  }

  reduce(): Rational {
    const divisor = this.gcd(this.numerator, this.denominator)
    let newNumerator = this.numerator / divisor
    let newDenominator = this.denominator / divisor
    if (newDenominator < 0) {
      newNumerator *= -1
      newDenominator *= -1
    }
    return new Rational(newNumerator, newDenominator)
  }

  private gcd(a: number, b: number): number {
    if (b === 0) {
      return a
    }
    return this.gcd(b, a % b)
  }
}
