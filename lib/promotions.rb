module Promotions

    def check_if_promotion_should_be_applied(promotion)
        if @promotional_rules.include?(promotion) 
            return true
        end
        return false
    end

    def apply_promotions

        # item promotions
        check_if_promotion_should_be_applied(:lavender_heart_promo) ? apply_lavender_heart_promotion : null

        recalculate_total # this method sits in checkout.rb

        # basket promotions
        check_if_promotion_should_be_applied(:ten_percent_basket_discount) ? apply_basket_discount(0.90, 6000) : null

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
        check_if_promotion_should_be_applied(:lavender_heart_promo)
        
        
        if count_item("Lavender heart") >= 2
            drop_price_of_item(001, 8.50)
        end


    end

end
