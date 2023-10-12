type Protein = 
  'Methionine' | 
  'Phenylalanine' | 
  'Leucine' | 
  'Serine' |
  'Tyrosine' |
  'Cysteine' |
  'Tryptophan' |
  'STOP' |
  'ERROR'

const CODONS = [
  'AUG', 'UUA', 'UUG', 'UUC', 'UUU', 'UCA', 'UCG', 'UCU', 'UCC', 
  'UAC', 'UAU', 'UGU', 'UGC', 'UGG', 'UAA', 'UAG', 'UGA']

export function translate(rna: string): Protein[] {
  const codons = rna.match(/[A-Z]{3}|[A-Z]+$/g) || []
  const proteins = codons.map(codon => parseCodon(codon))
  const stop = proteins.indexOf('STOP')

  if(stop >= 0) proteins.splice(stop)
  if(proteins.includes('ERROR')) throw Error('Invalid codon')

  return proteins
}

function parseCodon(codon: string): Protein {
  switch(codon) {
    case 'AUG':
      return 'Methionine'
    case 'UUA': case 'UUG':
      return 'Leucine'
    case 'UUC': case 'UUU':
      return 'Phenylalanine'
    case 'UCA': case 'UCG': case 'UCU': case 'UCC':
      return 'Serine'
    case 'UAC': case 'UAU':
      return 'Tyrosine'
    case 'UGU': case 'UGC':
      return 'Cysteine'
    case 'UGG':
      return 'Tryptophan'
    case 'UAA': case 'UAG': case 'UGA':
      return 'STOP'
    default:
      return 'ERROR'
  }
}
