const LETTERS = [...'ABCDEFGHIJKLMNOPQRSTUVWXYZ']
const TOTAL_NUMBER_OF_NAMES = 26 * 26 * 1000

class RobotDB {
  _availableSerialNumbers: string[]

  constructor() {
    this._availableSerialNumbers = this.generateAllSerialNumbers()
  }

  public getSerialNumber(): string {
    const index = Math.floor(Math.random() * this._availableSerialNumbers.length)
    const serial = this._availableSerialNumbers[index]
    const lastSerial = this._availableSerialNumbers.pop()
    if(serial !== lastSerial) {
      this._availableSerialNumbers[index] = lastSerial || ''
    }
    return serial
  }

  private generateAllSerialNumbers(): string[] {
    let serialNumbers: string[]  = []

    LETTERS.forEach(f => {
      LETTERS.forEach(s => {
        for(let i = 0; i < 1000; i++) {
          serialNumbers.push(`${f}${s}${i.toString().padStart(3, '0')}`)
        }
      })
    })

    return serialNumbers
  }
}

const DB = new RobotDB()

export class Robot {
  _name: string

  constructor() {
    this._name = this.createName()
  }

  public get name(): string {
    return this._name
  }

  public resetName(): void {
    this._name = this.createName()
  }

  public static releaseNames(): void {
  }

  private createName(): string {
    return DB.getSerialNumber()
  }
}
