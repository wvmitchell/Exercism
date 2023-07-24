const PLAIN: string[] = "abcdefghijklmnopqrstuvwxyz".split("")
const CIPHER: string[] = [...PLAIN].reverse() // would prefer .toReversed() here...

export function encode(plainText: string): string {
  const chars = plainText
    .toLowerCase()
    .replace(/\W/g, '')
    .split('')

  const unbrokenCipher = chars.reduce((cipher, char, i): string => {
    let charIndex = PLAIN.indexOf(char)
    let cipherChar = CIPHER[charIndex] || char
    return cipher + cipherChar
  }, "")

  return unbrokenCipher.replace(/\w{5}\B/g, (m) => (m + ' '))
}

export function decode(cipherText: string): string {
  const chars = cipherText.replace(/\s/g, '').split('')
  return chars.reduce((plain, char) => {
    let charIndex = CIPHER.indexOf(char)
    let plainChar = PLAIN[charIndex] || char
    return plain + plainChar
  }, '')
}
