const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

export class Robot {
  private _name: string
  private static _prefixIndex = 0
  private static _integerValue = 0
  private static _integerStart = 0

  readonly PREFIXES = Array.from(letters).map(letter_a => {
    return Array.from(letters).map(letter_b => {
      return `${letter_a}${letter_b}`
    })
  }).flat()

  constructor() {
    this._name = this.makeNewName()
  }

  public get name(): string {
    return this._name
  }

  public resetName(): void {
    let candidateName = this.makeNewName()
    this._name = candidateName
  }

  public static releaseNames(): void {
    Robot._prefixIndex = 0
    Robot._integerValue = 0
    Robot._integerStart = 0
  }

  private makeNewName(): string {
    let prefix = this.PREFIXES[Robot._prefixIndex]
    let number = Robot._integerValue.toString().padStart(3, '0')
    let parts = [prefix, number]
    let candidateName = parts.join('')

    Robot._prefixIndex = (Robot._prefixIndex + 1) % this.PREFIXES.length
    Robot._integerValue += 1

    if(Robot._prefixIndex === 0) {
      Robot._integerStart = (Robot._integerStart + 1) % 1000
      Robot._integerValue = Robot._integerStart
    }

    return candidateName
  }
}
