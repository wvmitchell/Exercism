export function hey(message: string): string {
  if(isShouting(message)) {
    return isAskingQuestion(message) ?
      'Calm down, I know what I\'m doing!' :
      'Whoa, chill out!'
  }

  if(isSilent(message)) {
    return 'Fine. Be that way!'
  }

  return isAskingQuestion(message) ?
    'Sure.' :
    'Whatever.'
}

function isShouting(message: string): boolean {
  return /^[^A-Za-z]*[A-Z]+(?:[^a-z]*)$/.test(message)
}

function isAskingQuestion(message: string): boolean {
  return /^.+\?\s*$/.test(message)
}

function isSilent(message: string): boolean {
  return /^\s*$/.test(message)
}
