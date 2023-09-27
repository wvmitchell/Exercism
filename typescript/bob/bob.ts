export function hey(message: string): string {
  const isShouting = message.match(/^[^A-Za-z]*[A-Z]+[0-9A-Z|\s|\W]*[?|!]*$/)
  const isQuestion = message.match(/\?\s*$/)
  const isSilent = message.match(/^\s*$/)

  if(isShouting && isQuestion) {
    return "Calm down, I know what I'm doing!"
  } else if(isShouting) {
    return 'Whoa, chill out!'
  } else if(isQuestion) {
    return 'Sure.'
  } else if(isSilent) {
    return 'Fine. Be that way!'
  }
  return 'Whatever.'
}
