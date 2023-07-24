export class SimpleCipher {
  key: string
  min: number
  max: number

  constructor(key: string | void) {
    this.key = key || this.randomKey()
    this.min = 'a'.charCodeAt(0)
    this.max = this.min + 25
  }

  encode(message: string): string {
    //let chars = message.split('')
    //return chars.map((char, i) => {
    //  let index = i % this.key.length
    //  let diff = this.key[index].charCodeAt(0) - this.min
    //  let raw = char.charCodeAt(0) + diff
    //  let encodedCode = raw > this.max ? raw - this.max + this.min - 1: raw
    //  return String.fromCharCode(encodedCode)
    //}).join('')
    return message.replace(/[a-z]/g, (match, i) => {
      let index = i % this.key.length
      let diff = this.key[index].charCodeAt(0) - this.min
      return String.fromCharCode(0)
    })
  }

  decode(message: string): string {
    let chars = message.split('')
    return chars.map((char, i) => {
      let index = i % this.key.length
      let diff = this.key[index].charCodeAt(0) - this.min
      let raw = char.charCodeAt(0) - diff
      let decodedCode = raw < this.min ? this.max - (this.min - raw) + 1 : raw
      return String.fromCharCode(decodedCode)
    }).join('')
  }

  randomKey(): string {
    let start = 'a'.charCodeAt(0)
    let chars = [...Array(100)].map(() => {
      let num = Math.floor(Math.random() * 25)
      let code = start + num
      return String.fromCharCode(code)
    })
    return chars.join('')
  }
}
