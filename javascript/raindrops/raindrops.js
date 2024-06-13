export const convert = (drops) => {
  let statment = "";

  if (drops % 3 === 0) statment += "Pling";
  if (drops % 5 === 0) statment += "Plang";
  if (drops % 7 === 0) statment += "Plong";

  return statment || drops.toString();
};
