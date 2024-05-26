const LETTERS = 'abcdefghijklmnopqrstuvwxyz'.split('');
const BASE_CHAR_CODE = 97

export class SimpleCipher {
  key: string

  constructor(key?: string) {
    this.key = key ?? this.randomKey()
  }

  encode(plaintext: string): string {
    return this.code(plaintext, this.encodeChar)
  }

  decode(ciphertext: string): string {
    return this.code(ciphertext, this.decodeChar)
  }

  code(text: string, method: Function): string {
    return text
      .split('')
      .map((char, i) => {
        const shift = this.key.charCodeAt(i % this.key.length) - BASE_CHAR_CODE
        return method(char, shift)
      }).join('')
  }

  private encodeChar(char: string, shift: number): string {
      const code = (char.charCodeAt(0) + shift - BASE_CHAR_CODE) % 26 +
          BASE_CHAR_CODE
      return String.fromCharCode(code)
  }

  private decodeChar(char: string, shift: number): string {
      let code = char.charCodeAt(0) - shift
      code = code < BASE_CHAR_CODE ? code + 26 : code
      return String.fromCharCode(code)
  }

  private randomKey(): string {
    let key = ''
    for(let i = 0; i < 100; i++) {
      key += LETTERS[Math.floor(Math.random() * 26)]
    }
    return key
  }
}
