export function isPangram(test: string): boolean {
  const letters = new Set(test.toUpperCase().match(/[A-Z]/g))
  return letters.size === 26
}
