class Node<Type> {
  data: Type
  next: Node<Type> | null
  previous: Node<Type> | null

  constructor(data: Type) {
    this.data = data
    this.next = null
    this.previous = null
  }
}

export class List<Type> {
  public head: Node<Type> | null
  public tail: Node<Type> | null

  constructor() {
    this.head = null
    this.tail = null
  }

  public static create(...values: any[]): List<any> {
    let list = new List()
    let index = 0
    while(values[index]) {
      if(values[index].isList && values[index].isList()) {
        let otherList = values[index]
        list.append(otherList)
      } else {
        list.push(values[index])
      }
      index++
    }
    return list
  }

  isList(): this is List<Type> {
    return this instanceof List<Type>
  }

  public push(value: Type): void {
    let newNode = new Node(value)

    if(this.head && this.tail) {
      let currentTail = this.tail
      currentTail.next = newNode
      newNode.previous = currentTail
      this.tail = newNode
    } else {
      this.head = newNode
      this.tail = newNode
    }
  }

  public unshift(value: Type): void {
    let newNode = new Node(value)

    if(this.head && this.tail) {
      let currentHead = this.head
      currentHead.previous = newNode
      newNode.next = currentHead
      this.head = newNode
    } else {
      this.head = newNode
      this.tail = newNode
    }
  }

  public forEach(callback: (item: any) => void): void {
    let currentNode = this.head
    while(currentNode) {
      callback(currentNode.data)
      currentNode = currentNode.next
    }
  }
  
  public append(other: List<Type>): List<Type> {
    if(!other.head) {
      return this
    }

    if(this.head && this.tail) {
      this.tail.next = other.head
      this.tail = other.tail
    } else {
      this.head = other.head
      this.tail = other.tail
    }
    return this
  }

  public concat(other: List<Type>): List<Type> {
    return this.append(other)
  }

  public filter<type>(callback: (item: type) => boolean): List<Type> {
    let filtered = new List<Type>()
    this.forEach(item => {
      if(callback(item)) {
        filtered.push(item)
      }
    })
    return filtered
  }

  public length(): number {
    let count = 0
    this.forEach(() => {
      count++
    })
    return count
  }

  public map<type>(callback: (item: type) => any): List<any> {
    let mapped = new List<Type>()
    this.forEach(item => mapped.push(callback(item)))
    return mapped
  }

  public foldl<TypeA, TypeB>(
    callback: (acc: TypeB, item: TypeA) => TypeB,
    initial: TypeB
  ): TypeB {
    let final = initial
    this.forEach(item => {
      final = callback(final, item)
    })
    return final
  }

  public foldr<TypeA, TypeB>(
    callback: (acc: TypeB, item: TypeA) => TypeB,
    initial: TypeB
  ): TypeB {
    let final = initial
    this.reverse().forEach(item => {
      final = callback(final, item)
    })
    return final
  }

  public reverse(): List<Type> {
    let reversed = new List<Type>()
    this.forEach(item => {
      reversed.unshift(item)
    })
    return reversed
  }
}
