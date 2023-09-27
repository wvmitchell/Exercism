export function isPangram(candidate: string): boolean {
  const downcased = candidate.toLowerCase()
  const letters = Array.from("abcdefghijklmnopqrstuvwxyz") 

  return letters.every(l => downcased.includes(l))
}
