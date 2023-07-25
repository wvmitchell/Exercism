type Operator = 'plus' | 'minus' | 'multiplied' | 'divided'

function isOperator(operator: Operator): operator is Operator {
  return ['plus', 
          'minus', 
          'multiplied', 
          'divided'].includes(operator as Operator)
}

function isOperand(operand: number): operand is number {
  return typeof (operand as number) === "number"
}

const perform = (operator: Operator, a: number, b: number): number => {
  switch(operator) {
    case 'plus':
      return a + b
    case 'minus':
      return a - b
    case 'multiplied':
      return a * b
    case 'divided':
      return a / b
    default:
      return 0
  }
}

const validate = (operations: any[]): void => {
  const allTermsValid = operations.every(term => {
    return isOperand(term) || isOperator(term) || term === 'What is'
  })
  const termsOrderValid = operations.every((term, i) => {
    return i % 2 === 0 ? (isOperator(term) || term === 'What is') : isOperand(term)
  })
  const noTerms = operations.length === 1 || operations.length === 0
  const termsLengthValid = operations.length % 2 === 0

  if(!termsOrderValid && termsLengthValid) {
    throw Error('Syntax error')
  }

  if(allTermsValid && !termsLengthValid) {
    throw Error('Syntax error')
  }

  if(!allTermsValid || noTerms) {
    throw Error('Unknown operation')
  }

  if(!termsLengthValid) {
    throw Error('Unknown operation')
  }
}

const solve = (operations: any[]): number => {
  if(operations.length === 1) {
    return operations[0]
  } else {
    let [a, operator, b, ...rest] = operations
    return solve([perform(operator, a, b), ...rest])
  }
}

export const answer = (question: string): number => {
  const regexp = /(-?\d+)|(What is)|(plus)|(minus)|(multiplied)|(divided)|(cubed)/g
  const matches = [...question.matchAll(regexp)]
  const parsed = matches.map(m => (parseInt(m[0]) || m[0]))
  validate(parsed)
  return solve(parsed.slice(1))
}
