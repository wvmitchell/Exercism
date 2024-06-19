type Frame = number[];

export class Bowling {
  frames: Frame[] = [];

  public roll(pins: number): void {
    if (this.gameOver()) throw new Error("Cannot roll after game is over");

    let isFinalFrame = this.frames.length === 10;
    let currentFrame = this.frames[this.frames.length - 1];
    let isMidFrame =
      this.frames.length > 0 && currentFrame.length < 2 && currentFrame[0] < 10;

    if (isMidFrame || isFinalFrame) {
      currentFrame.push(pins);
    } else {
      this.frames.push([pins]);
    }

    if (this.tooFewPins(pins)) throw new Error("Negative roll is invalid");
    if (this.tooManyPins(pins))
      throw new Error("Pin count exceeds pins on the lane");
    if (this.invalidRoll())
      throw new Error("Pin count exceeds pins on the lane");
  }

  public score(): number {
    if (!this.gameStarted() || !this.gameOver())
      throw new Error("Score cannot be taken until the end of the game");

    return this.frames.reduce((total, frame, i) => {
      return total + this.getFrameTotal(frame, i);
    }, 0);
  }

  private getFrameTotal(frame: Frame, frameIndex: number): number {
    return frame.reduce((frameTotal, roll, j) => {
      let isFinalFrame = frameIndex === 9;
      let isSpare = frame.length === 2 && frame[0] + frame[1] === 10 && j === 1;
      let isStrike = frame.length === 1 && frame[0] === 10;

      if (isSpare && !isFinalFrame) {
        return frameTotal + roll + this.getSpareBonus(frameIndex);
      } else if (isStrike && !isFinalFrame) {
        return frameTotal + roll + this.getStrikeBonus(frameIndex);
      } else {
        return frameTotal + roll;
      }
    }, 0);
  }

  private getSpareBonus(frameIndex: number): number {
    return this.frames[frameIndex + 1][0];
  }

  private getStrikeBonus(frameIndex: number): number {
    let isPenultimateFrame = frameIndex === 8;
    let firstRoll = this.frames[frameIndex + 1][0];
    let secondRoll;

    if (firstRoll === 10 && !isPenultimateFrame) {
      secondRoll = this.frames[frameIndex + 2][0];
    } else {
      secondRoll = this.frames[frameIndex + 1][1];
    }

    return firstRoll + secondRoll;
  }

  /*--- Validation Methods ----*/

  private tooFewPins(pins: number): boolean {
    return pins < 0;
  }

  private tooManyPins(pins: number): boolean {
    return pins > 10;
  }

  private invalidRoll(): boolean {
    let inFinalFrame = this.frames.length === 10;

    return inFinalFrame
      ? this.invalidFinalFrame()
      : this.invalidStandardFrame();
  }

  private invalidStandardFrame(): boolean {
    let lastFrame = this.frames[this.frames.length - 1];
    return lastFrame.reduce((sum, num) => sum + num) > 10;
  }

  private invalidFinalFrame(): boolean {
    let lastFrame = this.frames[this.frames.length - 1];
    let total = lastFrame.reduce((sum, num) => sum + num);

    return total > 30 || (lastFrame[1] < 10 && total > 20);
  }

  private gameStarted(): boolean {
    return this.frames.length > 0;
  }

  private gameOver(): boolean {
    let isFinalFrame = this.frames.length === 10;
    if (!isFinalFrame) return false;

    let frame = this.frames[this.frames.length - 1];
    let hasBonus = frame[0] + frame[1] >= 10;

    return (
      (hasBonus && frame.length === 3) || (!hasBonus && frame.length === 2)
    );
  }
}
