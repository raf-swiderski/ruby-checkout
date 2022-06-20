module Promotions

    def apply_promotions 

        # item promotions
        apply_lavender_heart_promotion 

        recalculate_total # this method sits in checkout.rb

        # basket promotions
        apply_basket_discount(0.90, 6000)

    end 

    # basket promotions

    def apply_basket_discount(discount, threshold)
        # E.g. '10% off if total is over £60' -> basket_discount(0.90, 6000)

        if @total.floor >= threshold
            @total = @total.to_i * discount
        end

    end

    # item promotions

    def apply_lavender_heart_promotion
        if count_item("Lavender heart") >= 2
            drop_price_of_item(001, 8.50)
        end
    end

end
