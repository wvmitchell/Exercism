const nums_less_than_twenty = [
  "zero",
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
  "ten",
  "eleven",
  "twelve",
  "thirteen",
  "fourteen",
  "fifteen",
  "sixteen",
  "seventeen",
  "eighteen",
  "nineteen",
];

const tens_words: { [key: number]: string } = {
  2: "twenty",
  3: "thirty",
  4: "forty",
  5: "fifty",
  6: "sixty",
  7: "seventy",
  8: "eighty",
  9: "ninety",
};

export function sayInEnglish(num: number): string {
  if (num < 0 || num >= 1000000000000) {
    throw new Error("Number must be between 0 and 999,999,999,999.");
  }

  let result = "";
  const billions = Math.floor(num / 1000000000) % 1000;
  const millions = Math.floor(num / 1000000) % 1000;
  const thousands = Math.floor(num / 1000) % 1000;
  const hundreds = Math.floor(num / 100) % 10;
  const tens = Math.floor(num / 10) % 10;
  const units = num % 10;

  if (billions > 0) {
    result += `${sayInEnglish(billions)} billion `;
  }

  if (millions > 0) {
    result += `${sayInEnglish(millions)} million `;
  }

  if (thousands > 0) {
    result += `${sayInEnglish(thousands)} thousand `;
  }

  if (hundreds > 0) {
    result += `${nums_less_than_twenty[hundreds]} hundred `;
  }

  if (tens > 1) {
    if (units === 0) {
      result += tens_words[tens];
    } else {
      result += `${tens_words[tens]}-${nums_less_than_twenty[units]} `;
    }
  } else if (tens > 0) {
    result += nums_less_than_twenty[tens * 10 + units];
  } else if (units > 0) {
    result += nums_less_than_twenty[units];
  }

  if (result === "") {
    result = nums_less_than_twenty[num];
  }

  return result.trim();
}
