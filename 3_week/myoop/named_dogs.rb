require "./animals.rb"
require "./dogs.rb"

class NamedDogs < Dogs
    def initialize(name)
        @name=name
    end
    def tell_name
        puts "The dog's name is " + @name
    end
end