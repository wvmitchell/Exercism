export function nucleotideCounts(strand: string): { [key: string]: number } {
  if(strand.match(/[^ACGT]/)) {
    throw new Error('Invalid nucleotide in strand')
  }

  let counts: { [key: string]: number } = {
    A: 0,
    C: 0,
    G: 0,
    T: 0
  }

  for(let nucleotide of strand) {
    counts[nucleotide] += 1
  }

  return counts
}
