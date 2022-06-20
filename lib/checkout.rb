require_relative 'item'
require_relative 'promotions'

class Checkout
    
    attr_reader :total, :items
    
    include Promotions

    def initialize
        @total = 0
        @items = []
    end

    def total
        apply_promotions

        convert_total_to_float

        print_message = generate_print_message(@total) # Format: "Total price: £54.29"
        return print_message

    end

    def generate_print_message(total)
        print_message = "Total price: £#{total}"
        
        if @total == 0 
            return "Total price: £0.00"
        elsif print_message.split("")[-2] == "."
            print_message += "0"
        end
        return print_message
    end

    def scan(item)
        @total += item.price * 100 # converting the price to a float
        @items << item
    end

    def delete(item)
        @items.each_with_index do |basket_item, index|
            if basket_item == item
                @items.delete_at(index)
            end
        end
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
                item.set_price(new_price)
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

    def convert_total_to_float
        @total = (@total.ceil.to_f / 100)
    end

end

