# Ruby Checkout

### Scenario

Our marketing team want to offer promotions as an incentive for our customers to purchase these items.
If you spend over £60, then you get 10% of your purchase
If you buy 2 or more lavender hearts then the price drops to 28.50.
Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.

Our client is an online marketplace, here is a sample of the some of the products available on our site:

| Product Code |  Name  | Price (£) |
|:-----|:--------:|------:|
| **001**   | Lavender heart | 9.25 |
| **002**   |  Personalised cufflinks  |   45.00 |
| **003**   | Kids T-shirt |    19.95 |
 
The interface to our checkout looks like this (shown in Ruby):
```
co = Checkout.new(promotional_rules)
co.scan (item) 
co.scan (item) 
price = co.total
```

------------------

## My Approach

- Created an `Item` and `Checkout` class with appropriate attributes.
- Lead with tests in Rspec for each feature, using the Red, Green, Refactor technique.  
- Made regular commits with git to track progress of code.
- Created extra tests to go with the ones provided, to have a solid code base to build off of. 
- Created a `drop_price_of_item` method, which takes parameters denoting to which item shall have a change of price. This way, the method is reusable. 

### Assumptions

- I assumed the `Lavendar heart` discount would be applied before the `%10` discount.

### Issues

- Trouble with pricing. It was hard recalculating prices using floats such as `9.25`.
    - Solution: I timesed the `Item` price by 100 on input, and then divided by 100 when printing out the price. 
- I didn't pass the `promotional_rules` as an argument but rather I built it into the system, because I wasn't sure how to pass a method as an argument and incorporate this into the business logic.

### Things to improve on 

- Could have been more thorough with my testing when starting out. I was adding features before my code base was solid enough. 





