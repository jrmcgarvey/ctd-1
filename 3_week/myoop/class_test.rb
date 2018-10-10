require_relative "animals.rb"
require_relative "cats.rb"
require_relative "dogs.rb"
require_relative "named_dogs.rb"


require "test/unit"
 
class TestClassExample < Test::Unit::TestCase
    def test_animals
        a=Animals.new
        r=a.breathe
        assert r==nil
    end 
    
    def test_cats
        c=Cats.new
        r=c.breathe
        assert r==nil
        r=c.talk
        assert r==nil
    end

    def test_dogs 
        c=Dogs.new
        r=c.breathe
        assert r==nil
        r=c.talk
        assert r==nil
    end
    
    def test_named_dogs 
        c=NamedDogs.new("Bowser")
        r=c.breathe
        assert r==nil
        r=c.talk
        assert r==nil
        r=c.tell_name
        assert r==nil
    end
end