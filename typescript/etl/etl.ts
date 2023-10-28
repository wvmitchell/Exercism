type OldLetterValues = {
  [key: string]: string[];
};

type NewLetterValues = {
  [key: string]: number;
};

export function transform(old: OldLetterValues): NewLetterValues {
  const newValues: NewLetterValues = {}

  for(const [value, letters] of Object.entries(old)) {
    for(const letter of letters) {
      newValues[letter.toLowerCase()] = parseInt(value)
    }
  }

  return newValues
}
