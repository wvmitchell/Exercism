export function reverse(s: string): string {
  return s.length <= 1 ? s : reverse(s.slice(1)) + s[0]
}
