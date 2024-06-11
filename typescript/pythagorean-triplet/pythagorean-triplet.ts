type Options = {
  minFactor?: number
  maxFactor?: number
  sum: number
}

class Triplet {
  sides: [number, number, number]

  constructor(...sides: [number, number, number]) {
    this.sides = sides
  }

  toArray(): [number, number, number] {
    return this.sides
  }

  isPythagorean(): boolean {
    let [a, b, c] = this.sides
    return a < b && b < c && a * a + b * b === c * c
  }

  maxFactor(): number {
    return Math.max(...this.sides)
  }
}

export function triplets({ sum, minFactor, maxFactor }: Options): Triplet[] {
  let start = minFactor || 1
  let end = Math.floor(sum / 3)
  let accumplateTriplets: Triplet[] = []

  for(var i = start; i < end; i++) {
    let a = i
    let b = Math.floor((sum * sum - 2 * sum * a) / (2 * sum - 2 * a))
    let c = sum - a - b
    let candidate = new Triplet(a, b, c)

    if (candidate.isPythagorean() && (!maxFactor || candidate.maxFactor() <= maxFactor)) {
      accumplateTriplets.push(candidate)
    }
  }

  return accumplateTriplets
}
