class Node<T> {
  data: T
  next: Node<T> | null

  constructor(value: T) {
    this.data = value
    this.next = null
  }
}

function isList(obj: any): boolean {
  if(obj?.head || obj?.head === null) {
    return true
  }
  return false
}

export class List<T> implements Iterable<T>{
  public head: Node<T> | null = null
  public tail: Node<T> | null = null

  public [Symbol.iterator](): Iterator<T> {
    let current = this.head
    return {
      next(): IteratorResult<T> {
        if(current) {
          const value = current.data
          current = current.next
          return { value, done: false }
        } else {
          return { value: null, done: true }
        }
      }
    }
  }

  public static create(...values: unknown[]): List<unknown> {
    if(isList(values[0])) {
      return List.createFromLists(...values)
    }

    let list = new List()

    if(values.length) {
      list.head = new Node(values[0])
      list.tail = list.head
      let current = list.head

      let i = 1
      while(values[i]) {
        current.next = new Node(values[i])
        list.tail = current.next
        current = current.next
        i++
      }
    }

    return list
  }

  private static createFromLists(...lists: unknown[]): List<unknown> {
    let list = new List()
    let i = 0
    while(lists[i]) {
      let tempList = lists[i] as List<unknown>
      let temp = List.create(...tempList)
      console.log('temp', temp)
      list = list.append(temp)
      console.log('list', list)
      i++
    }
    return list
  }

  public forEach(callback: (value: unknown) => void): void {
    let current = this.head

    while(current) {
      callback(current.data)
      current = current.next
    }
  }

  public append(other: List<T>): List<T> {
    if(this.tail && other.head) {
      this.tail.next = other.head
      this.tail = other.tail
    } else if(!this.head && other.head) {
      this.head = other.head
      this.tail = other.tail
    }
    return this
  }

  public concat(other: List<T>): List<T> {
    return this.append(other)
  }

  public filter<Y>(callback: (value: Y) => boolean): List<Y> {
    let list = new List<Y>()
    this.forEach(item => {
      if(callback(item as Y)) list.append(List.create(item) as List<Y>)
    })
    return list
  }

  public length(): number {
    let counter = 0
    let current = this.head
    while(current) {
      current = current.next
      counter++
    }
    return counter
  }

  public map<Y>(callback: (value: Y) => Y): List<Y> {
    let list = new List<Y>()
    this.forEach(item => {
      list.append(List.create(callback(item as Y)) as List<Y>)
    })
    return list
  }

  public foldl<Y, X>(callback: (acc: Y, el: X) => Y, inital: Y): Y {
    let result = inital
    this.forEach(item => {
      result = callback(result, item as X)
    })
    return result
  }
  
  public foldr<Y, X>(callback: (acc: Y, el: X) => Y, inital: Y): Y {
    return this.reverse().foldl(callback, inital)
  }

  public reverse(): List<unknown> {
    // Implement this method
    let list = new List()
    this.forEach(item => {
      list = List.create(item).append(list)
    })
    return list
  }
}
