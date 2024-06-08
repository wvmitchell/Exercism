export class ComplexNumber {
  _real: number
  _imaginary: number
  _i: number = Math.sqrt(-1)

  constructor(real: number, imaginary: number) {
    this._real = real
    this._imaginary = imaginary
  }

  public get real(): number {
    return this._real
  }

  public get imag(): number {
    return this._imaginary
  }

  public add(other: ComplexNumber): ComplexNumber {
    let [a, b, c, d] = [this.real, this.imag, other.real, other.imag]
    return new ComplexNumber(a + c, b + d)
  }

  public sub(other: ComplexNumber): ComplexNumber {
    let [a, b, c, d] = [this.real, this.imag, other.real, other.imag]
    return new ComplexNumber(a - c, b - d)
  }

  public div(other: ComplexNumber): ComplexNumber {
    let [a, b, c, d] = [this.real, this.imag, other.real, other.imag]
    return new ComplexNumber((a * c + b * d) / (c * c + d * d), (b * c - a * d) / (c * c + d * d))
  }

  public mul(other: ComplexNumber): ComplexNumber {
    let [a, b, c, d] = [this.real, this.imag, other.real, other.imag]
    return new ComplexNumber(a * c - b * d, a * d + b * c)
  }

  public get abs(): number {
    let [a, b] = [this.real, this.imag]
    return Math.sqrt(a * a + b * b)
  }

  public get conj(): ComplexNumber {
    let b = this.imag === 0 ? 0 : -this.imag
    return new ComplexNumber(this.real, b)
  }

  public get exp(): ComplexNumber {
    let [a, b] = [this.real, this.imag]
    return new ComplexNumber(Math.exp(a) * Math.cos(b), Math.exp(a) * Math.sin(b))
  }
}
