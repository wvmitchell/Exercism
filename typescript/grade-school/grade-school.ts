interface Students {
  [key: number]: string[]
}

export class GradeSchool {
  private _roster: Students = {}

  roster(): Students {
    let rosterCopy: Students = {}
    for(const [grade, students] of Object.entries(this._roster)) {
      rosterCopy[parseInt(grade)] = [...students] 
    }
    return rosterCopy
  }

  add(name: string, grade: number): void {
    this.removeFromGrades(name)
    const studentsForGrade = this._roster[grade] || [] 
    this._roster[grade] = [...studentsForGrade, name].sort()
  }

  grade(gradeLevel: number): string[] {
    return this.roster()[gradeLevel] || [] 
  }

  removeFromGrades(name: string): void {
    for(const grade in this._roster) {
      if(this._roster[grade].includes(name)) {
        this._roster[grade].splice(this._roster[grade].indexOf(name))
      }
    }
  }
}
