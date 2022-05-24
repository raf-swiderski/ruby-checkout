class Checkout

    attr_reader :total

    def initialize
        @total = 0
    end

    def total
        if @total == 0 
            return "Total price: £0.00"
        end
    end


end