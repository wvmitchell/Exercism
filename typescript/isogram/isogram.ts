export function isIsogram(test: string): boolean {
  let chars = [...test.toLowerCase().replace(/[^a-z]/g, '')]
  const set = new Set<string>(chars)
  return set.size === chars.length
}
