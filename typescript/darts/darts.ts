export function score(x: number, y: number): number {
  const distance =  Math.sqrt(Math.abs(x) ** 2 + Math.abs(y) ** 2)

  if(distance <= 1) {
    return 10
  } else if(distance <= 5) {
    return 5
  } else if(distance <= 10) {
    return 1 
  }
  return 0
}
