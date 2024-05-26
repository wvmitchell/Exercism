const SECRET_COMMANDS = [
  'wink',
  'double blink',
  'close your eyes',
  'jump'
]

export function commands(command: number): string[] {
  const rawCommands =  command
                          .toString(2)
                          .padStart(5, '0')
                          .split('')
                          .reverse()
  const actions = rawCommands.slice(0,4)
  const shouldReverse = rawCommands[4] === '1'

  const actionList = SECRET_COMMANDS.filter((_, index) => {
    return actions[index] === '1'
  })

  return shouldReverse ? actionList.reverse() : actionList
}
