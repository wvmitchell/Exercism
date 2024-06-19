export class Anagram {
  test: string;

  constructor(input: string) {
    this.test = input.toLowerCase();
  }

  public matches(...potentials: string[]): string[] {
    return potentials.filter((potential) => {
      potential = potential.toLowerCase();
      let sortedTest = this.test.split("").sort().join("");
      let sortedPotential = potential.split("").sort().join("");

      return this.test !== potential && sortedTest === sortedPotential;
    });
  }
}
