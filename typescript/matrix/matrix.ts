export class Matrix {
  _rows: Array<number[]>
  _columns: Array<number[]>

  constructor(raw: string) {
    this._rows = this.rowsFromRaw(raw)
    this._columns = this.transpose(this._rows)
  }

  get rows(): Array<number[]> {
    return this._rows
  }

  get columns(): Array<number[]> {
    return this._columns
  }

  rowsFromRaw(raw: string): Array<number[]> {
    const rawRows = raw.split('\n')
    return rawRows.reduce((rows: Array<number[]>, current) => {
      const row = current.split(' ').map(n => parseInt(n))
      return [...rows, row]
    }, [])
  }

  transpose(matrix: Array<number[]>): Array<number[]> {
    return matrix[0].map((_, i) => {
      return matrix.map((row => row[i]))
    })
  }
}
