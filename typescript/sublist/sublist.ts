export class List {
  elements: number[];

  constructor(...elements: number[]) {
    this.elements = elements;
  }

  compare(list: List): string {
    if (this.equals(list)) {
      return "equal";
    } else if (this.sublist(list)) {
      return "sublist";
    } else if (list.sublist(this)) {
      return "superlist";
    }
    return "unequal";
  }

  equals(list: List): boolean {
    return (
      this.elements.length === list.elements.length &&
      equalArrays(this.elements, list.elements)
    );
  }

  sublist(list: List): boolean {
    const len = this.elements.length;
    return list.elements.some((_, index) => {
      const sublistCandidate = list.elements.slice(index, index + len);
      return equalArrays(this.elements, sublistCandidate);
    });
  }
}

function equalArrays(arr1: number[], arr2: number[]): boolean {
  return (
    arr1.length === arr2.length &&
    arr1.every((value, index) => {
      return value === arr2[index];
    })
  );
}
