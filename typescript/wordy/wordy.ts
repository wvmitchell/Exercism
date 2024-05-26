type Operations = {
  [key: string]: Function
}

const operations: Operations = {
  plus: (x: number, y: number): number => x + y,
  minus: (x: number, y: number): number => x - y,
  multiplied: (x: number, y: number): number => x * y,
  divided: (x: number, y: number): number => x / y
}

const validate_question = (question: string): void => {
  if(question.match(/cubed/)) throw Error('Unknown operation')
  if(!question.match(/What is/)) throw Error('Unknown operation')
}

const validate_stack = (stack: Array<string|number>): void => {
  if(!stack.length) throw Error('Syntax error')
  if(stack.length % 2 === 0) throw Error('Syntax error')
  stack.forEach((elem, index) => {
    if(typeof elem !== 'string' && index % 2 === 1) throw Error('Syntax error')
  })
}

export const answer = (question: string): number => {
  validate_question(question)
  let re = /(-*\d+|plus|minus|multiplied|divided)/g
  let stack = question.match(re)?.map(test => parseInt(test) || test) || []
  validate_stack(stack)

  let result = stack?.shift()
  while(stack?.length) {
    let op = stack?.shift() || 'n/a'
    let num = stack?.shift()
    result = operations[op](result, num)
  }

  return Number(result)
}

