class Node<TElement> {
  _data: TElement
  _next: Node<TElement> | null

  constructor(element: TElement) {
    this._data = element
    this._next = null
  }
}

export class LinkedList<TElement> {
  _head: Node<TElement> | null = null

  public push(element: TElement): void {
    const node = new Node(element)

    if(!this._head) {
      this._head = node
    } else {
      let current = this._head
      while(current._next) {
        current = current._next
      }
      current._next = node
    }
  }

  public pop(): TElement | null {
    let current = this._head

    if(current?._next) {
      let next = current._next
      while(next._next) {
        current = next
        next = next._next
      }
      current._next = null
      return next._data
    } else if(current) {
      this._head = null
      return current._data
    } else {
      return null
    }
  }

  public shift(): TElement | null {
    const current = this._head

    if(current) {
      this._head = current._next
      return current._data
    } else {
      return null
    }
  }

  public unshift(element: TElement): void {
    const node = new Node(element)
    const current = this._head

    this._head = node
    node._next = current
  }

  public delete(element: TElement): void {
    let current = this._head
    let next = current?._next
    
    if(current?._data === element) {
      this._head = current._next
      return
    }

    while(current && next) {
      if(next._data === element) {
        current._next = next._next
      }
      current = next
      next = next._next
    }
  }

  public count(): number {
    let current = this._head
    let count = current ? 1 : 0
    while(current?._next) {
      current = current._next
      count++
    }
    return count
  }
}

