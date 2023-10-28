type Nucleotide = 'A' | 'C' | 'G' | 'T'
type NucleotideCounts = {
  [key in Nucleotide]: number
}

export function nucleotideCounts(strand: string): NucleotideCounts {
  if(strand.search(/[^ACGT]/g) !== -1) {
    throw Error('Invalid nucleotide in strand')
  }

  return [...strand].reduce((counts, n) => {
    counts[n as Nucleotide] += 1
    return counts
  }, { A: 0, C: 0, G: 0, T: 0 })
}
