type LetterCounts = { [key: string]: number };

export class Anagram {
  test: string;

  constructor(input: string) {
    this.test = input.toLowerCase();
  }

  public matches(...potentials: string[]): string[] {
    return potentials.filter((potential) => {
      potential = potential.toLowerCase();

      return (
        this.test !== potential &&
        this.test.length === potential.length &&
        this.lettersMatch(this.test, potential)
      );
    });
  }

  private countLetters(input: string): LetterCounts {
    let counts: { [key: string]: number } = {};
    for (let char of input) {
      let count: number | undefined = counts[char];
      count ? counts[char]++ : (counts[char] = 1);
    }

    return counts;
  }

  private lettersMatch(str1: string, str2: string): boolean {
    let counts1 = this.countLetters(str1);
    let counts2 = this.countLetters(str2);

    return Object.keys(counts1).every((key) => {
      return counts1[key] === counts2[key];
    });
  }
}
