interface NucPair {
  [key: string]: string
}

const NucMap: NucPair = {
  C: 'G',
  G: 'C',
  A: 'U',
  T: 'A'
}

export function toRna(dna_str: string): string {
  if(/[^CGAT]/.test(dna_str)) {
    throw new Error('Invalid input DNA.')
  }
  return dna_str.replace(/[CGAT]/g, match => NucMap[match])
}
