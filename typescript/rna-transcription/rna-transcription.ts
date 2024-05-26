interface T {
  [key: string]: string
}

const Transcriptions: T = {
  C: 'G',
  G: 'C',
  A: 'U',
  T: 'A'
}

export function toRna(dna: string): string {
  return dna.replace(/[A-Z]/g, (match: string): string => {
    if(!Transcriptions[match]) {
      throw('Invalid input DNA.')
    }
    return Transcriptions[match]
  })
}
