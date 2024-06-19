import assert from "assert";

type Frame = number[];

export class Bowling {
  frames: Frame[] = [];

  public roll(pins: number): void {
    assert(!this.gameOver(), "Cannot roll after game is over");
    assert(!this.tooFewPins(pins), "Negative roll is invalid");
    assert(!this.tooManyPins(pins), "Pin count exceeds pins on the lane");

    let isFinalFrame = this.frames.length === 10;
    let currentFrame = this.frames[this.frames.length - 1];
    let isMidFrame =
      this.frames.length > 0 && currentFrame.length < 2 && currentFrame[0] < 10;

    if (isMidFrame || isFinalFrame) {
      currentFrame.push(pins);
    } else {
      this.frames.push([pins]);
    }

    assert(!this.invalidRoll(), "Pin count exceeds pins on the lane");
  }

  public score(): number {
    assert(this.gameOver(), "Score cannot be taken until the end of the game");

    return this.frames.reduce((total, frame, i) => {
      return total + this.getFrameTotal(frame, i);
    }, 0);
  }

  private getFrameTotal(frame: Frame, frameIndex: number): number {
    return frame.reduce((frameTotal, roll, j) => {
      let isSpare = frame[0] + frame[1] === 10 && j === 1 && frameIndex < 9;
      let isStrike = frame.length === 1 && frame[0] === 10 && frameIndex < 9;

      if (isSpare) {
        return frameTotal + roll + this.getSpareBonus(frameIndex);
      } else if (isStrike) {
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
    let total = lastFrame.reduce((sum, num) => sum + num);

    return total > 10;
  }

  private invalidFinalFrame(): boolean {
    let lastFrame = this.frames[this.frames.length - 1];
    let total = lastFrame.reduce((sum, num) => sum + num);

    return total > 30 || (lastFrame[1] < 10 && total > 20);
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
