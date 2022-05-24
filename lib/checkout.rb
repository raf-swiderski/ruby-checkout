require_relative 'item'

class Checkout

    attr_reader :total, :items

    def initialize
        @total = 0
        @items = []
    end

    def total

        if @total == 0 
            return "Total price: £0.00"
        end

        if count_item("Lavender heart") >= 2
            drop_price_of_item(001, 8.50)
        end

        recalculate_total
        
        if @total.to_i >= 6000 #10% discount if over £60.00
            @total = @total.to_i * 0.90
        end

        @total = (@total.ceil.to_f / 100)

        print_message = "Total price: £#{@total}"
        if print_message.split("")[-2] == "."
            print_message += "0"
        end

        return print_message

    end

    def scan(item)
        @total += item.price * 100
        @items << item
    end

    def count_item(name) 
        count = 0
        for item in @items do
            if item.name == name
                count = count + 1
            end
        end
        return count        
    end

    def drop_price_of_item(product_code, new_price)
        @items.map do |item|
            if item.product_code == product_code
                item.price = new_price
            end
        end   
    end

    def recalculate_total
        @total = 0
        for item in @items do
            @total += item.price * 100
        end
        return @total
    end

end

