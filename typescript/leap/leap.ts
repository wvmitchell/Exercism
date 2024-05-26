export function isLeap(year: number): boolean {
  if(year % 100 === 0 && year % 400) {
    return false
  } else {
    return year % 4 === 0
  }
}
