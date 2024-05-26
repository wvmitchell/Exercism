type Key = {
  [key: string]: string
}

const LETTERS = 'abcdefghijklmnopqrstuvwxyz'
const KEY = LETTERS
              .split('')
              .reduce((key: Key, char: string, index: number): Key => {
                key[char] = LETTERS[25 - index]
                return key
              }, {})

export function encode(plainText: string): string {
  const stripped: string[] =  plainText.toLowerCase().match(/\w/g) || []
  return stripped.reduce((cipher, char, index): string => {
                    let shouldAddSpace = (index + 1) % 5 === 0
                    let cipherChar = KEY[char] || char
                    cipher += shouldAddSpace ? 
                                `${cipherChar} ` : 
                                cipherChar
                    return cipher
                  }, '')
                  .trim()
}

export function decode(cipherText: string): string {
  return encode(cipherText).replace(/\s/g, '')
}
