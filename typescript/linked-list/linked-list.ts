class Node<TElement> {
  data: TElement;
  next: Node<TElement> | null
  previous: Node<TElement> | null

  constructor(data: TElement) {
    this.data = data
    this.next = null
    this.previous = null
  }
}

export class LinkedList<TElement> {
  private head: Node<TElement> | null
  private tail: Node<TElement> | null

  constructor() {
    this.head = null
    this.tail = null
  }

  public push(element: TElement): void {
    let newNode = new Node(element)
    let currentTail = this.tail

    if(!currentTail) {
      this.head = newNode
      this.tail = newNode
    } else {
      newNode.previous = currentTail
      currentTail.next = newNode
      this.tail = newNode
    }
  }

  public pop(): TElement | null {
    let tail = this.tail
    if(tail) {
      let previous = tail.previous
      if(previous) {
        previous.next = null
        this.tail = previous
      } else {
        this.head = null
        this.tail = null
      }
      return tail.data
    } else {
      return null
    }
  }

  public shift(): TElement | null {
    let head = this.head
    if(head) {
      let next = head.next
      if(next) {
        next.previous = null
        this.head = next
      } else {
        this.head = null
        this.tail = null
      }
      return head.data
    } else {
      return null
    }
  }

  public unshift(element: TElement): void {
    let newNode = new Node(element)
    let currentHead = this.head

    if(!currentHead) {
      this.head = newNode
      this.tail = newNode
    } else {
      newNode.next = currentHead
      currentHead.previous = newNode
      this.head = newNode
    }
  }

  public delete(element: TElement): void {
    let currentNode = this.head
    while(currentNode) {
      let foundElement = currentNode.data === element
      let previous = currentNode.previous
      let next = currentNode.next

      if(foundElement) {
        if(!previous) {
          this.shift()
        } else if(!next) {
          this.pop()
        } else {
          previous.next = next
          next.previous = previous
        }
        break
      }
      currentNode = currentNode.next
    }
  }

  public count(): number {
    let counter = 0
    let currentNode = this.head
    while(currentNode) {
      currentNode = currentNode.next
      counter++
    }
    return counter
  }
}
