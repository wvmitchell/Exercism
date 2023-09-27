export class Matrix {
  readonly rows: Array<number[]>
  readonly columns: Array<number[]>

  constructor(initial: string) {
    const string_rows = initial.split('\n')

    this.rows = string_rows.map(s_row => {
      return s_row.split(' ').map(n => parseInt(n))
    })

    this.columns = this.rows.map((_, index) => {
      return this.rows.map(row => row[index])
    })
  }
}
