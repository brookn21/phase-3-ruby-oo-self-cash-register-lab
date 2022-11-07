
class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items =[]
    end

    def add_item(title, price, quantity=0)
        if quantity == 0
        self.total += price
        self.items << title
        else
            self.last_transaction = price * quantity
            @total += last_transaction
            quantity.times do
                self.items << title
            end
        end
    end

    def apply_discount
        if @discount != 0
        discount_amount = @discount.fdiv(100) * self.total
        self.total -= discount_amount.to_i
        return "After the discount, the total comes to $#{self.total}."
        else 
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end

new_register = CashRegister.new(20)

new_register.add_item("macbook", 35,2)

new_register.void_last_transaction

p new_register.total