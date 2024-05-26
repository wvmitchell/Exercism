export class Clock {
  readonly DAY_MINUTES = 60 * 24
  readonly HOUR_MINUTES = 60
  _minutes: number

  constructor(hour: number, minute?: number) {
    const rawMinutes = hour * this.HOUR_MINUTES + (minute ?? 0)

    this._minutes = this.normalizeRawMinutes(rawMinutes)
  }

  get hour(): number {
    return Math.floor(this._minutes / this.HOUR_MINUTES)
  }

  get minute(): number {
    return this._minutes % this.HOUR_MINUTES
  }

  public toString(): string {
    const hourString = String(this.hour).padStart(2, '0')
    const minuteString = String(this.minute).padStart(2, '0')

    return `${hourString}:${minuteString}`
  }

  public plus(minutes: number): Clock {
    this._minutes = this.normalizeRawMinutes(this._minutes + minutes)
    return this
  }

  public minus(minutes: number): Clock {
    this._minutes = this.normalizeRawMinutes(this._minutes - minutes)
    return this
  }

  public equals(other: Clock): boolean {
    return this._minutes === other._minutes
  }

  private normalizeRawMinutes(raw: number): number {
    const minutes = raw % this.DAY_MINUTES
    return minutes >= 0 ? minutes : (minutes + this.DAY_MINUTES)
  }
}
