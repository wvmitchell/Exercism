export function find(haystack: number[], needle: number): number | never {
  if (!haystack.length) throw Error('Value not in array')
  const center = Math.floor(haystack.length / 2)

  if(haystack[center] === needle) {
    return center
  } else if(haystack[center] < needle) {
    return find(haystack.slice(center + 1), needle) + center + 1
  } 
  return find(haystack.slice(0, center), needle)
}
