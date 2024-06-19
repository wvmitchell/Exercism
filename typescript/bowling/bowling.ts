type Frame = number[];
export class Bowling {
  frames: Frame[] = [];

  public roll(pins: number): void {
    let isFinalFrame = this.frames.length === 10;
    let isMidFrame =
      this.frames.length > 0 &&
      this.frames[this.frames.length - 1].length < 2 &&
      this.frames[this.frames.length - 1][0] < 10;

    if (isMidFrame || isFinalFrame) {
      this.frames[this.frames.length - 1].push(pins);
    } else {
      this.frames.push([pins]);
    }
  }

  public score(): number {
    return this.frames.reduce((total, frame, i) => {
      return total + this.getFrameTotal(frame, i);
    }, 0);
  }

  private getFrameTotal(frame: Frame, frameIndex: number): number {
    return frame.reduce((frameTotal, roll, j) => {
      let isFinalFrame = frameIndex === 9;
      let isSpare = frame.length === 2 && frame[0] + frame[1] === 10 && j === 1;
      let isStrike = frame.length === 1 && frame[0] === 10;

      if (isFinalFrame) {
        return frameTotal + roll;
      } else if (isSpare) {
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
}
