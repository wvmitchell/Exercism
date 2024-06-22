import assert from "assert";

type NumberSeries = number[];

export class Series {
  numbers: number[];

  constructor(series: string) {
    assert(series.length > 0, "series cannot be empty");
    this.numbers = series.split("").map(Number);
  }

  slices(sliceLength: number): number[][] {
    assert(sliceLength >= 0, "slice length cannot be negative");
    assert(sliceLength !== 0, "slice length cannot be zero");
    assert(
      sliceLength <= this.numbers.length,
      "slice length cannot be greater than series length",
    );

    return this.numbers.reduce((seriesCollection: NumberSeries[], _, i) => {
      if (i + sliceLength <= this.numbers.length) {
        let series = this.numbers.slice(i, i + sliceLength);
        seriesCollection.push(series);
      }
      return seriesCollection;
    }, []);
  }
}
