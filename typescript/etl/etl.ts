type OldLetterScores = { [key: string]: string[] }
type LetterScores = { [key: string]: number }

export function transform(old: OldLetterScores): LetterScores {
  let newScores: LetterScores = {}

  for (let score in old) {
    old[score].forEach(letter => {
      newScores[letter.toLowerCase()] = parseInt(score)
    })
  }

  return newScores
}
