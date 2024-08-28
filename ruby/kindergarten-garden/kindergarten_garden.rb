class Garden
  CHILDREN = %i[
    alice
    bob
    charlie
    david
    eve
    fred
    ginny
    harriet
    ileana
    joseph
    kincaid
    larry
  ].freeze
  PLANTS = {
    "C" => :clover,
    "G" => :grass,
    "R" => :radishes,
    "V" => :violets
  }.freeze

  def initialize(garden_rows)
    @plants = parse_rows(garden_rows)
  end

  def method_missing(method, *args)
    super unless respond_to?(method)

    self
      .class
      .send(:define_method, method) do
        index = CHILDREN.index(method) * 2
        @plants.map { |row| row.slice(index, 2) }.flatten
      end

    send(method)
  end

  def respond_to_missing?(method, include_private = false)
    CHILDREN.include?(method) || super
  end

  private

  def parse_rows(garden_rows)
    garden_rows.split("\n").map { |row| row.split("").map { |c| PLANTS[c] } }
  end
end
