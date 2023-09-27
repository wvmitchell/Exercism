export function find(haystack: number[], needle: number): number | never {
  let low = 0
  let high = haystack.length - 1
  let middle = Math.floor(haystack.length / 2)

  while(low < high) {
    let pivot = haystack[middle]
    if(pivot === needle) {
      return middle
    } else if(pivot < needle) {
      low = middle + 1
    } else if(pivot > needle) {
      high = middle - 1
    }
    middle = Math.floor((high + low) / 2)
  }

  if(haystack[low] === needle) {
    return low
  }

  throw new Error('Value not in array')
}
