type Classification = 'perfect' | 'abundant' | 'deficient'

export function classify(candidate: number): Classification {
  if (candidate <= 0) {
    throw new Error('Classification is only possible for natural numbers.')
  }

  let properDivisors = []
  for (let i = 1; i < candidate; i++) {
    if (candidate % i === 0) {
      properDivisors.push(i)
    }
  }
  const aliquotSum = properDivisors.reduce((acc, cur) => acc + cur, 0)

  if (aliquotSum < candidate) return 'deficient'
  if (aliquotSum > candidate) return 'abundant'
  return 'perfect'
}
