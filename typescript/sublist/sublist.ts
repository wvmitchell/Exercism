export class List<T = any> {
  elements: T[] = [];

  constructor(...elements: T[]) {
    this.elements = elements;
  }

  compare(list: List<T>): string {
    if (this.equals(list)) {
      return "equal";
    } else if (this.sublist(list)) {
      return "sublist";
    } else if (list.sublist(this)) {
      return "superlist";
    }
    return "unequal";
  }

  equals(list: List<T>): boolean {
    return (
      this.elements.length === list.elements.length &&
      equalArrays(this.elements, list.elements)
    );
  }

  sublist(list: List<T>): boolean {
    const len = this.elements.length;
    return list.elements.some((_, index) => {
      const sublistCandidate = list.elements.slice(index, index + len);
      return equalArrays(this.elements, sublistCandidate);
    });
  }
}

function equalArrays<T>(arr1: T[], arr2: T[]): boolean {
  return (
    arr1.length === arr2.length &&
    arr1.every((value, index) => {
      return value === arr2[index];
    })
  );
}
