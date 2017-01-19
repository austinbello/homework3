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

  def + (other)
    if @code == other.code
      @amount += other.amount
    else
      puts "Currency objects must have the same currency code to be added"
    end
  end

  def - (other)
    if @code == other.code
      @amount -= other.amount
    else
      puts "Currency objects must have the same currency code to be added"
    end
  end

  def * (num)
    if num.is_a? Numeric
      @amount *= num
    else
      puts "Must input a Fixnum or Float"
    end
  end

end

a = Currency.new(amount: 34, code: 'USD')
b = Currency.new(amount: 34, code: 'USD')
c = Currency.new(amount: 27, code: 'USD')

puts "Object A: #{a.amount} #{a.code}"
puts "Object B: #{b.amount} #{b.code}"
puts "Object C: #{c.amount} #{c.code}"
puts "Object A equals Object B: #{a == b}"
puts "Object A does not equal to Object C: #{a != c}"
a + b
puts "Adding Object B to Object A = #{a.amount} #{a.code}"
b - c
puts "Subtracting Object C from Object B = #{b.amount} #{b.code}"
c * 2
puts "Multiplying Object C by 2 = #{c.amount} #{c.code}"
