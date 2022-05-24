# Ruby Checkout

### Scenario

Our marketing team want to offer promotions as an incentive for our customers to purchase these items.
If you spend over 260, then you get 10% of your purchase
If you buy 2 or more lavender hearts then the price drops to 28.50.
Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.

The interface to our checkout looks like this (shown in Ruby):
```
co = Checkout.new(promotional_rules)
co.scan (item) 
co.scan (item) 
price = co.total
```

