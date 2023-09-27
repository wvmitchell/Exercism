export function commands(secret: number): string[] {
  const commandList = [
    'wink',
    'double blink', 
    'close your eyes',
    'jump',
    'reverse'
  ]

  const binarySecret = secret
                        .toString(2)
                        .padStart(commandList.length, '0')
                        .split('')
                        .reverse()

  return binarySecret.reduce((list: string[], state, index) => {
    let command = commandList[index]
    let shouldReverse = state === '1' && command === 'reverse'
    let includesCommand = state === '1'

    if(shouldReverse) {
      return list.reverse()
    } else if(includesCommand) {
      return [...list, command]
    } else {
      return list
    }
  }, [])
}
