const days: [string, string][] = [
  ["first", "a Partridge in a Pear Tree"],
  ["second", "two Turtle Doves"],
  ["third", "three French Hens"],
  ["fourth", "four Calling Birds"],
  ["fifth", "five Gold Rings"],
  ["sixth", "six Geese-a-Laying"],
  ["seventh", "seven Swans-a-Swimming"],
  ["eighth", "eight Maids-a-Milking"],
  ["ninth", "nine Ladies Dancing"],
  ["tenth", "ten Lords-a-Leaping"],
  ["eleventh", "eleven Pipers Piping"],
  ["twelfth", "twelve Drummers Drumming"],
];

export function recite(start: number, end: number): string {
  let startIndex = start - 1;
  const endIndex = end - 1;
  let result = "";
  while (startIndex <= endIndex) {
    const day = days[startIndex];
    console.log(day);
    result += `On the ${day[0]} day of Christmas my true love gave to me: `;
    const gifts = days
      .slice(1, startIndex + 1)
      .reverse()
      .map((d) => d[1])
      .join(", ");
    const lastGift = days[0][1];
    result += `${gifts}${startIndex === 0 ? "" : ", and "}${lastGift}.\n`;
    startIndex++;
  }
  return result;
}
