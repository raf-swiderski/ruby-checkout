require_relative 'item'

class Checkout

    attr_reader :total

    def initialize
        @total = 0
    end

    def total
        if @total == 0 
            return "Total price: £0.00"
        end
            
        return "Total price: £#{@total}"
    end

    def scan(item)
        @total += item.price
    end



end

