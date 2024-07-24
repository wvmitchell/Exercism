export function proverb(...words: string[]): string {
  return words.reduce((lines, word, idx) => {
    if(words.length - 1 > idx) {
      return lines + standardLine(word, words[idx + 1])
    } 
    return lines + lastLine(words[0])
  }, "")
}

function standardLine(want: string, lost: string): string {
  return `For want of a ${want} the ${lost} was lost.\n`
}

function lastLine(initial: string): string {
  return `And all for the want of a ${initial}.`
}
