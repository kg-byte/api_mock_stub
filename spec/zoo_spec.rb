require 'pry'
require './lib/zoo'
require './lib/animal'

RSpec.describe Zoo do 
 let!(:zoo) {Zoo.new('Denver Zoo')}

 it 'can add animals' do
 	cat = Animal.new('Lucy', 'cat') 
 	dog = Animal.new('Tino', 'dog') 
 	zoo.add_animal(cat)
 	zoo.add_animal(dog)

 	expect(zoo.animals).to eq([cat, dog])
 end


 it 'returns animal names' do 
 	cat = Animal.new('Lucy', 'cat') 
 	dog = Animal.new('Tino', 'dog') 

 	zoo.add_animal(cat)
 	zoo.add_animal(dog)

 	expect(zoo.animal_names).to eq(['Lucy', 'Tino'])
 end



end