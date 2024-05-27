export class Gigasecond {
  constructor(private readonly _date: Date) {}

  public date(): Date {
    return new Date(this._date.getTime() + 1e12)
  }
}
