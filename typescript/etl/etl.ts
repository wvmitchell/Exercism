type OldLetterValues = {
  [key: string]: string[]
}

type NewLetterValues = {
  [key: string]: number
}

export function transform(old: OldLetterValues): NewLetterValues {
  const entries = Object.entries(old)
  return entries.reduce((newValues: NewLetterValues, info) => {
    const [value, letters] = info
    letters.forEach(letter => {
      newValues[letter.toLowerCase()] = parseInt(value)
    })
    return newValues
  }, {})
}
