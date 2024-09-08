export class List {
  elements: number[];

  constructor(...elements: number[]) {
    this.elements = elements
  }

  compare(list: List): string {
    return "equal";
  }
}
