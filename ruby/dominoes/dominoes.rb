require "pry"

module Dominoes
  def self.chain?(dominoes)
    node_edge_counts =
      dominoes.each_with_object(Hash.new(0)) do |(a, b), h|
        h[a] += 1
        h[b] += 1
      end
    node_edge_counts.values.all?(&:even?) && connected?(dominoes)
  end

  def self.connected?(dominoes, from_node = nil)
    if dominoes.empty?
      true
    elsif from_node.nil?
      domino = dominoes.shift
      from_node = domino.first
      connected?(dominoes, from_node)
    else
      domino_index =
        double_edge_index(from_node, dominoes) ||
        single_edge_index(from_node, dominoes)
      if domino_index
        next_node = dominoes[domino_index].find { |n| n != from_node }
        dominoes.delete_at(domino_index)
        connected?(dominoes, next_node)
      else
        false
      end
    end
  end

  def self.double_edge_index(node, dominoes)
    dominoes.find_index { |a, b| (a == node && b == node) }
  end

  def self.single_edge_index(node, dominoes)
    dominoes.find_index { |a, b| (a == node || b == node) }
  end
end
