require_relative 'item'

class Checkout

    attr_reader :total, :items

    def initialize
        @total = 0
        @items = []
    end

    def total
        apply_promotions

        convert_total_to_float

        print_message = generate_print_message(@total) # E.g. "Total price: £54.29"
        return print_message

    end

    def apply_promotions

        # item promotions
        apply_lavender_heart_promotion 

        # update @total 
        recalculate_total

        # basket promotions
        apply_basket_discount(0.90, 6000)

    end 

    def apply_basket_discount(discount, threshold)
        # E.g. '10% off if total is over £60' would be: basket_discount(0.90, 6000)

        if @total.floor >= threshold
            @total = @total.to_i * discount
        end

    end

    def apply_lavender_heart_promotion
        if count_item("Lavender heart") >= 2
            drop_price_of_item(001, 8.50)
        end
    end

    def convert_total_to_float
        @total = (@total.ceil.to_f / 100)
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

end

