const codonToProtein: { [key: string]: string } = {
  AUG: 'Methionine',
  UUU: 'Phenylalanine',
  UUC: 'Phenylalanine',
  UUA: 'Leucine',
  UUG: 'Leucine',
  UCU: 'Serine',
  UCC: 'Serine',
  UCA: 'Serine',
  UCG: 'Serine',
  UAU: 'Tyrosine',
  UAC: 'Tyrosine',
  UGU: 'Cysteine',
  UGC: 'Cysteine',
  UGG: 'Tryptophan',
  UAA: 'STOP',
  UAG: 'STOP',
  UGA: 'STOP',
}

export function translate(rna: string): string[] {
  let proteins: string[] = []
  let rnaCopy: string = rna

  while(rnaCopy.length > 0) {
    let codon = rnaCopy.slice(0, 3)
    let protien = codonToProtein[codon]

    if(!protien) {
      throw new Error('Invalid codon')
    } else if(protien === 'STOP') {
      break
    } else {
      proteins = [...proteins, protien]
      rnaCopy = rnaCopy.slice(3)
    }
  }

  return proteins
}
