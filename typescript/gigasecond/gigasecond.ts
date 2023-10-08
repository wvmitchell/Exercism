export class Gigasecond {
  private gigaseconds: number

  public constructor(date: Date) {
    this.gigaseconds = date.valueOf() + 10**12
  }

  public date(): Date {
    return new Date(this.gigaseconds)
  }
}
