interface Roster {
  [key: string]: string[]
}

export class GradeSchool {
  _roster: Roster = {}

  roster(): Roster {
    return JSON.parse(JSON.stringify(this._roster))
  }

  add(name: string, level: number): void {
    this._roster[level] ??= []
    const studentsForLevel = this._roster[level]
    this.remove(name)

    this._roster[level] = [...studentsForLevel, name].sort()
  }

  grade(level: number): string[] {
    return this.roster()[level] ?? []
  }

  private remove(name: string): void {
    for(const level in this._roster) {
      this._roster[level] = this._roster[level].filter(student => {
        return student !== name
      })
    }
  }
}
