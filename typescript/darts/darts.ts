export function score(x: number, y: number): number {
  const distanceFromCenter = Math.hypot(x, y)
  const innerRing = 1
  const middleRing = 5
  const outerRing = 10

  if(distanceFromCenter > outerRing) {
    return 0
  } else if(distanceFromCenter > middleRing) {
    return 1
  } else if(distanceFromCenter > innerRing) {
    return 5
  } else {
    return 10
  }
}
