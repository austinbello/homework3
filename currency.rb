class Currency
  attr_reader :amount, :code
  attr_accessor :amount, :code

  def initialize(amount:, code:)
    @amount = amount
    @code = code
  end

  def ==(other)
    @amount == other.amount && @code == other.code
  end

  def !=(other)
    @amount != other.amount || @code != other.code
  end
end

a = Currency.new(amount: 34, code: 'USD')
b = Currency.new(amount: 34, code: 'USD')

puts "Object A: #{a.amount} #{a.code}"
puts "Object B: #{b.amount} #{b.code}"
puts "Object A equals Object B: #{a == b}"
puts "Object A does not equal to Object B: #{a != b}"
