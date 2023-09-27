export class DnDCharacter {
  strength: number;
  charisma: number;
  constitution: number;
  wisdom: number;
  intelligence: number;
  hitpoints: number;
  dexterity: number;

  constructor() {
    this.strength = DnDCharacter.generateAbilityScore()
    this.charisma = DnDCharacter.generateAbilityScore()
    this.constitution = DnDCharacter.generateAbilityScore()
    this.wisdom = DnDCharacter.generateAbilityScore()
    this.intelligence = DnDCharacter.generateAbilityScore()
    this.dexterity = DnDCharacter.generateAbilityScore()
    this.hitpoints = 10 + DnDCharacter.getModifierFor(this.constitution)
  }

  public static generateAbilityScore(): number {
    const MIN = 3
    const MAX_ADDITIONAL = 15
    return MIN + Math.floor(Math.random() * MAX_ADDITIONAL)
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor((abilityValue - 10) / 2)
  }
}
