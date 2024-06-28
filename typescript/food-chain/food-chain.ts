const animals = [
  ["fly", "I don't know why she swallowed the fly. Perhaps she'll die."],
  [
    "spider",
    "It wriggled and jiggled and tickled inside her.",
    " that wriggled and jiggled and tickled inside her",
  ],
  ["bird", "How absurd to swallow a bird!"],
  ["cat", "Imagine that, to swallow a cat!"],
  ["dog", "What a hog, to swallow a dog!"],
  ["goat", "Just opened her throat and swallowed a goat!"],
  ["cow", "I don't know how she swallowed a cow!"],
  ["horse", "She's dead, of course!"],
];

export function verse(lines: number): string {
  let [animal, companionLine] = animals[lines - 1];
  let start = `I know an old lady who swallowed a ${animal}.`;
  let end = getEnding(lines);
  let ans = [start, companionLine, ...end].join("\n");
  return ans;
}

export function verses(start: number, end: number): string {
  let ans = [];

  for (let i = start; i <= end; i++) {
    ans.push(verse(i));
  }

  return ans.join("\n");
}

function getEnding(index: number): string[] {
  if (index === 1 || index === 8) {
    return [""];
  }

  let subset = animals.slice(0, index).reverse();
  return subset.map((animal: string[], i): string => {
    let swallowedAnimal = animal;
    let toCatchAnimal = subset[i + 1];
    if (toCatchAnimal) {
      return `She swallowed the ${swallowedAnimal[0]} to catch the ${toCatchAnimal[0]}${toCatchAnimal[2] || ""}.`;
    }
    return `${swallowedAnimal[1]}\n`;
  });
}
