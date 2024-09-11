require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../linked_list'

Minitest::Reporters.use!

class DequeTest < Minitest::Test
  def test_push_pop
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    assert_equal 20, deque.pop
    assert_equal 10, deque.pop
  end

  def test_push_nil
    deque = Deque.new
    deque.push(nil)
    assert_nil deque.tail.value
    assert_nil deque.head.value
  end

  def test_push_string
    deque = Deque.new
    deque.push("hello")
    assert_equal "hello", deque.tail.value
    assert_equal "hello", deque.head.value

    deque.push("world")
    assert_equal "world", deque.tail.value
    assert_equal "hello", deque.head.value
  end

  def test_push_array
    deque = Deque.new
    deque.push([1, 2, 3])
    assert_equal [1, 2, 3], deque.tail.value
    assert_equal [1, 2, 3], deque.head.value

    deque.push([4, 5])
    assert_equal [4, 5], deque.tail.value
    assert_equal [1, 2, 3], deque.head.value
  end

  def test_push_hash
    deque = Deque.new
    deque.push({ key: "value" })
    assert_equal({ key: "value" }, deque.tail.value)
    assert_equal({ key: "value" }, deque.head.value)

    deque.push({ another_key: "another_value" })
    assert_equal({ another_key: "another_value" }, deque.tail.value)
    assert_equal({ key: "value" }, deque.head.value)
  end

  def test_push_object
    deque = Deque.new
    obj = Object.new
    deque.push(obj)
    assert_equal obj, deque.tail.value
    assert_equal obj, deque.head.value
  end

  def test_push_shift
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    assert_equal 10, deque.shift
    assert_equal 20, deque.shift
  end

  def test_unshift_shift
    deque = Deque.new
    deque.unshift(10)
    deque.unshift(20)
    assert_equal 20, deque.shift
    assert_equal 10, deque.shift
  end

  def test_unshift_pop
    deque = Deque.new
    deque.unshift(10)
    deque.unshift(20)
    assert_equal 10, deque.pop
    assert_equal 20, deque.pop
  end

  def test_example
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    assert_equal 20, deque.pop
    deque.push(30)
    assert_equal 10, deque.shift
    deque.unshift(40)
    deque.push(50)
    assert_equal 40, deque.shift
    assert_equal 50, deque.pop
    assert_equal 30, deque.shift
  end

  def test_pop_to_empty
    deque = Deque.new
    deque.push(10)
    assert_equal 10, deque.pop
    deque.push(20)
    assert_equal 20, deque.shift
  end

  def test_shift_to_empty
    deque = Deque.new
    deque.unshift(10)
    assert_equal 10, deque.shift
    deque.unshift(20)
    assert_equal 20, deque.pop
  end
end
