export function nucleotideCounts(strand: string): { [key: string]: number } {
  if(strand.match(/[^ACGT]/)) {
    throw new Error('Invalid nucleotide in strand')
  }

  return {
    A: strand.match(/A/g)?.length || 0,
    C: strand.match(/C/g)?.length || 0,
    G: strand.match(/G/g)?.length || 0,
    T: strand.match(/T/g)?.length || 0,
  }
}
