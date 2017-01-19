require './currency.rb'

class CurrencyConverter
  @@converter_hash = {
    "USD" => {"USD" => 1.0, "EUR" => 0.94072, "GBP" => 0.81255, "JPY" => 115.318},
    "EUR" => {"USD" => 1.06302, "EUR" => 1.0, "GBP" => 0.86360, "JPY" => 122.557},
    "GBP" => {"USD" => 1.23087, "EUR" => 1.15777, "GBP" => 1.0, "JPY" => 141.899},
    "JPY" => {"USD" => 0.00867, "EUR" => 0.00816, "GBP" => 0.00705, "JPY" => 1.0}
  }
  class << self
    attr_accessor :converter_hash

    def get_hash
      @@converter_hash
    end

    def convert(currency_obj, code_to_convert)
      if (self.get_hash.keys.any? { |code_check| currency_obj.code == code_check } && self.get_hash.keys.any? { |code_check| code_to_convert == code_check })
        Currency.new(amount: currency_obj * self.get_hash[currency_obj.code][code_to_convert], code: code_to_convert)
      else
        puts "UnknownCurrencyCodeError"
      end
    end
  end
end
  # def converter_hash
  #   hash = {
  #     :USD => {USD: 1.0, EUR: 0.94072, GBP: 0.81255, JPY: 115.318},
  #     :EUR => {USD: 1.06302, EUR: 1.0, GBP: 0.86360, JPY: 122.557},
  #     :GBP => {USD: 1.23087, EUR: 1.15777, GBP: 1.0, JPY: 141.899},
  #     :JPY => {USD: 0.00867, EUR: 0.00816, GBP: 0.00705, JPY: 1.0}
  #   }
  # end
  #
  # def self.convert(string1, string2)
  #   # converter_hash = {
  #   #   :USD => {USD: 1.0, EUR: 0.94072, GBP: 0.81255, JPY: 115.318},
  #   #   :EUR => {USD: 1.06302, EUR: 1.0, GBP: 0.86360, JPY: 122.557},
  #   #   :GBP => {USD: 1.23087, EUR: 1.15777, GBP: 1.0, JPY: 141.899},
  #   #   :JPY => {USD: 0.00867, EUR: 0.00816, GBP: 0.00705, JPY: 1.0}
  #   # }
  #   self.converter_hash[string1][string2]
#   end
# end

# puts CurrencyConverter.get_hash
x = CurrencyConverter.convert(Currency.new(amount: 200, code: "USD"), "GBP")
puts "200 USD is equal to #{x.amount} #{x.code}"

y = CurrencyConverter.convert(Currency.new(amount: 1, code: "USD"), "USD") == Currency.new(amount: 1, code: "USD")
puts "Is 1 USD converted to USD equal to 1 USD? #{y}"
