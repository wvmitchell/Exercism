const codonToProtein: { [key: string]: string } = {
  AUG: 'Methionine',
  UUU: 'Phenylalanine',
  UUC: 'Phenylalanine',
  UUA: 'Leucine',
  UUG: 'Leucine',
  UCU: 'Serine',
}

export function translate(rna: string): string[] {
  return rna.match(/\w{3}/g)?.map(m => codonToProtein[m]) || []
}
