export function translate(phrase: string): string {
  const words = phrase.split(" ");
  return words.map(translateWord).join(" ");
}

const ruleOneRegex = /^(?:[aeiou]|xr|yt)/;
const ruleTwoRegex = /^[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]+/;
const ruleThreeRegex = /^[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]*qu/;
const ruleFourRegex = /^[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]+(?=y)/;

function translateWord(word: string): string {
  if (word.match(ruleOneRegex)) {
    return word + "ay";
  } else if (word.match(ruleFourRegex)) {
    return moveMatchAndAddEnding(word, ruleFourRegex);
  } else if (word.match(ruleThreeRegex)) {
    return moveMatchAndAddEnding(word, ruleThreeRegex);
  } else if (word.match(ruleTwoRegex)) {
    return moveMatchAndAddEnding(word, ruleTwoRegex);
  }
  return word;
}

function moveMatchAndAddEnding(word: string, rule: RegExp): string {
  let matched = word.match(rule);
  let ending = matched?.at(0) + "ay";
  return word.replace(rule, "") + ending;
}
