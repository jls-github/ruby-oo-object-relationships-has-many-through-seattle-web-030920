class Customer
    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.customer == self}
    end
    
    def waiters
        meals.map {|meal| meal.waiter}
    end

    def new_meal_20_percent(waiter, total)
        tip = total * 0.2
        Meal.new(waiter, self, total, tip)
    end

    def self.oldest_customer
        oldest_age = 0
        oldest_customer = nil
        self.all.each {|customer| customer.age > oldest_age ? (oldest_age = customer.age && oldest_customer = customer) : nil}
        oldest_customer
    end

end