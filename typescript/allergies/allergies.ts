const testedAlergens = [
  'eggs',
  'peanuts',
  'shellfish',
  'strawberries',
  'tomatoes',
  'chocolate',
  'pollen',
  'cats',
]

export class Allergies {
  allergenIndices: string[];

  constructor(allergenIndex: number) {
    this.allergenIndices = allergenIndex
                          .toString(2)
                          .split('')
                          .reverse()
  }

  public list(): string[] {
    return testedAlergens.filter((allergen, i) => {
      return this.allergenIndices[i] === '1'
    })
  }

  public allergicTo(allergen: string): boolean {
    return this.list().includes(allergen)
  }
}
