require "./animals.rb"
require "./dogs.rb"
require "./cats.rb"
require "./named_dogs.rb"

cat1=Cats.new
dog1=Dogs.new

cat1.breathe
cat1.talk

dog1.breathe
dog1.talk

dog2=NamedDogs.new("Bowser")
dog2.breathe
dog2.talk
dog2.tell_name