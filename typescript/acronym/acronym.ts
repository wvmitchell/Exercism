export function parse(phrase: string): string {
  let regexp = /\b\w|(?<=[a-z])[A-Z]/g
  return String(phrase.match(regexp)?.join('')).toUpperCase()
}
