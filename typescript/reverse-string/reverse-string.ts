export function reverse(text: string): string {
  if (text.length <= 1) {
    return text;
  } else {
    return reverse(text.slice(1)) + text[0];
  }
}
