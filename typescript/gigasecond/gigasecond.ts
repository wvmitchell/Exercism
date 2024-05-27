export class Gigasecond {
  _date: Date

  constructor(date: Date) {
    this._date = new Date(date.getTime() + 1e12)
  }

  public date(): Date {
    return this._date
  }
}
