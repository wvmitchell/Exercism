export class Clock {
  private _totalMinutes: number
  readonly DAY_MINUTES: number = 24 * 60

  constructor(hour: number, minute?: number) {
    this._totalMinutes = hour * 60 + (minute || 0)
  }

  public toString(): string {
    let normalizedMins = this.normalizeMins(this._totalMinutes)
    let hours = Math.floor(normalizedMins / 60) % 24
    let minutes = normalizedMins % 60
    let hourStr = hours.toString().padStart(2, '0')
    let minuteStr = minutes.toString().padStart(2, '0')
    return `${hourStr}:${minuteStr}`
  }

  public plus(minutes: number): Clock {
    this._totalMinutes += minutes
    return this
  }

  public minus(minutes: number): Clock {
    this._totalMinutes -= minutes
    return this
  }

  public equals(other: Clock): boolean {
    return this.toString() === other.toString()
  }

  private normalizeMins(minutes: number): number {
    if(minutes < 0) {
      return (minutes % this.DAY_MINUTES) + this.DAY_MINUTES
    }
    return minutes % this.DAY_MINUTES
  }
}
