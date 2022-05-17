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

#Mocks 

 it 'can add animals' do 
 	cat = Animal.new('Lucy', 'cat') 
 	dog = Animal.new('Tino', 'dog') 
 	zoo.add_animal(cat)
 	zoo.add_animal(dog)

 	expect(zoo).to respond_to(:add_animal).with(1).argument
 	expect(zoo).to_not respond_to(:add_animal).with(2).arguments
 	expect(zoo.animal_names).to respond_to(:count, :flatten)
 	expect(zoo.animal_names).to_not respond_to(:to_i)
 	expect(zoo).to_not respond_to(:breed)
 	expect(cat).to respond_to(:breed)
 end



 it 'returns animal names' do 
 	cat = Animal.new('Lucy', 'cat') 
 	dog = Animal.new('Tino', 'dog') 

 	zoo.add_animal(cat)
 	zoo.add_animal(dog)

 	expect(zoo.animal_names).to eq(['Lucy', 'Tino'])
 end

#Stubs
 it 'returns animal names' do 
 	cat = double('anything') #mock subject
 	dog = Animal.new('Tino', 'dog')  #real subject

 	allow(cat).to receive(:name).and_return('Lucy')
 	allow(dog).to receive(:name).and_return('Tino')

 	zoo.add_animal(cat)
 	zoo.add_animal(dog)

 	expect(zoo.animal_names).to eq(['Lucy', 'Tino'])
 end

end
