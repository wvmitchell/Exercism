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

  constructor(allergenIndex: number) {
    this.allergenIndex = allergenIndex
  }

  public list(): string[] {
    return Object.keys(allergens).filter((allergen: string) => this.allergicTo(allergen))
  }

  public allergicTo(allergen: string): boolean {
    return Boolean(this.allergenIndex & allergens[allergen])
  }
}
