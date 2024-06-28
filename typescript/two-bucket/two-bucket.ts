type Buckets = { one: number; two: number };

type BucketsState = {
  buckets: Buckets;
  moves: number;
} | null;

export class TwoBucket {
  goalState?: BucketsState;
  buckOne: number;
  buckTwo: number;
  starterBuck: string;
  _goalBucket?: string;
  _otherBucket?: number;

  constructor(
    buckOne: number,
    buckTwo: number,
    goal: number,
    starterBuck: string,
  ) {
    this.buckOne = buckOne;
    this.buckTwo = buckTwo;
    this.starterBuck = starterBuck;
    this.goalState = this.findGoalState(buckOne, buckTwo, goal, starterBuck);
    this._goalBucket = this.goalState?.buckets.one === goal ? "one" : "two";
    this._otherBucket =
      this._goalBucket === "one"
        ? this.goalState?.buckets.two
        : this.goalState?.buckets.one;
  }

  moves(): number {
    if (!this.goalState) {
      throw new Error("Goal not reachable");
    }

    return this.goalState.moves;
  }

  get goalBucket(): string {
    return this._goalBucket || "";
  }

  get otherBucket(): number {
    return this._otherBucket || 0;
  }

  private findGoalState(
    buckOne: number,
    buckTwo: number,
    goal: number,
    starterBuck: string,
  ): BucketsState | null {
    const states: BucketsState[] = [];
    const visited: Set<string> = new Set();

    states.push(this.findInitialState(buckOne, buckTwo, starterBuck));

    while (states.length) {
      let state = states.shift();
      let nextStates;

      if (state?.buckets.one === goal || state?.buckets.two === goal) {
        return state;
      }

      if (state) {
        visited.add(this.stringifyBuckets(state.buckets));
        nextStates = this.getNextStates(state);

        for (let next of nextStates) {
          if (next && !visited.has(this.stringifyBuckets(next.buckets))) {
            states.push(next);
          }
        }
      }
    }

    return null;
  }

  private findInitialState(
    buckOne: number,
    buckTwo: number,
    starterBuck: string,
  ): BucketsState {
    if (starterBuck === "one") {
      return { buckets: { one: buckOne, two: 0 }, moves: 1 };
    }
    return { buckets: { one: 0, two: buckTwo }, moves: 1 };
  }

  private getNextStates(state: BucketsState): BucketsState[] {
    let states = [
      this.fillOne(state),
      this.fillTwo(state),
      this.emptyOne(state),
      this.emptyTwo(state),
      this.pourOneIntoTwo(state),
      this.pourTwoIntoOne(state),
    ];

    return this.removeInvalidStates(states);
  }

  private fillOne(state: BucketsState): BucketsState {
    if (state?.buckets.one === this.buckOne) {
      return state;
    }

    return {
      buckets: { one: this.buckOne, two: Number(state?.buckets.two) },
      moves: Number(state?.moves) + 1,
    };
  }

  private fillTwo(state: BucketsState): BucketsState {
    if (state?.buckets.two === this.buckTwo) {
      return state;
    }

    return {
      buckets: { one: Number(state?.buckets.one), two: this.buckTwo },
      moves: Number(state?.moves) + 1,
    };
  }

  private emptyOne(state: BucketsState): BucketsState {
    if (state?.buckets.one === 0) {
      return state;
    }

    return {
      buckets: { one: 0, two: Number(state?.buckets.two) },
      moves: Number(state?.moves) + 1,
    };
  }

  private emptyTwo(state: BucketsState): BucketsState {
    if (state?.buckets.two === 0) {
      return state;
    }

    return {
      buckets: { one: Number(state?.buckets.one), two: 0 },
      moves: Number(state?.moves) + 1,
    };
  }

  private pourOneIntoTwo(state: BucketsState): BucketsState {
    let remainingVolume = this.buckTwo - Number(state?.buckets.two);
    let volumeToPour = Math.min(Number(state?.buckets.one), remainingVolume);

    if (volumeToPour === 0) {
      return state;
    }

    return {
      buckets: {
        one: Number(state?.buckets.one) - volumeToPour,
        two: Number(state?.buckets.two) + volumeToPour,
      },
      moves: Number(state?.moves) + 1,
    };
  }

  private pourTwoIntoOne(state: BucketsState): BucketsState {
    let remainingVolume = this.buckOne - Number(state?.buckets.one);
    let volumeToPour = Math.min(Number(state?.buckets.two), remainingVolume);

    if (volumeToPour === 0) {
      return state;
    }

    return {
      buckets: {
        one: Number(state?.buckets.one) + volumeToPour,
        two: Number(state?.buckets.two) - volumeToPour,
      },
      moves: Number(state?.moves) + 1,
    };
  }

  private stringifyBuckets(buckets: Buckets): string {
    return `${buckets.one},${buckets.two}`;
  }

  private removeInvalidStates(states: BucketsState[]): BucketsState[] {
    return states.filter((state: BucketsState) => {
      if (this.starterBuck === "one") {
        return state?.buckets.one !== 0 || state?.buckets.two !== this.buckTwo;
      } else {
        return state?.buckets.one !== this.buckOne || state?.buckets.two !== 0;
      }
    });
  }
}
