const allergens: { [key: string]: number } = {
  eggs: 1,
  peanuts: 2,
  shellfish: 4,
  strawberries: 8,
  tomatoes: 16,
  chocolate: 32,
  pollen: 64,
  cats: 128
}

export class Allergies {
  allergenIndex: number
  _list: string[]

  constructor(allergenIndex: number) {
    this.allergenIndex = allergenIndex
    this._list = Object.keys(allergens).filter((allergen: string) => this.allergicTo(allergen))
  }

  public list(): string[] {
    return this._list
  }

  public allergicTo(allergen: string): boolean {
    return Boolean(this.allergenIndex & allergens[allergen])
  }
}
