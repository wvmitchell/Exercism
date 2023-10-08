type WordCounts = Map<string, number>

export function count(statement: string): WordCounts {
  const wordCounts: WordCounts = new Map<string, number>
  const words = statement.toLowerCase().match(/\b(\w|')+\b/g)

  words?.forEach(word => {
    const currentCount = wordCounts.get(word)
    if(currentCount) {
      wordCounts.set(word, currentCount + 1)
    } else {
      wordCounts.set(word, 1)
    }
  })

  return wordCounts
}
