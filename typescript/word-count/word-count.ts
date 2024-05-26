export function count(words: string): Map<string, number>{
  const wordMap =  new Map()
  words.toLowerCase().match(/\b(\w|')+\b/g)?.forEach(word => {
    wordMap.set(word, (wordMap.get(word) || 0) + 1)
  })
  return wordMap
}
