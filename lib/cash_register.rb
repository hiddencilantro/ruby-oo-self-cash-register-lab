require 'pry'

class CashRegister
    attr_accessor :total, :discount
    attr_reader :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        @temp_total = @total
        @temp_items = @items
        if quantity > 1
            @total = price * quantity + @total
            counter = 0
            while counter < quantity
                @items << item
                counter += 1
            end
        else
            @total = price + @total
            @items << item
        end
    end

    def apply_discount
        if discount > 0
            @total = @total - @discount * @total / 100
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end
    
    def items
        @items
    end

    def void_last_transaction
        @total = @temp_total
        @items = @temp_items
    end
end
