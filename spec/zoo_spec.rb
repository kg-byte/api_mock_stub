require 'pry'
require './lib/zoo'
require './lib/animal'

RSpec.describe Zoo do 
 let!(:zoo) {Zoo.new('Denver Zoo')}

 it 'can add animals' do
 	lucy = Animal.new('Lucy', 'cat') 
 	tino = Animal.new('Tino', 'dog') 
 	tod = Animal.new('Tod', 'fox')
 	dumbo = Animal.new('Dumbo', 'elephant')
 	huey = Animal.new('Huey', 'duck')

 	zoo.add_animal(lucy)
 	zoo.add_animal(tino)
 	zoo.add_animal(tod)
 	zoo.add_animal(dumbo)
 	zoo.add_animal(huey)

 	expect(zoo.animals).to eq([lucy, tino, tod, dumbo, huey])
 	expect(zoo.animal_names).to eq(['Lucy', 'Tino', 'Tod', 'Dumbo', 'Huey'])
 	expect(zoo).to respond_to(:add_animal, :animal_names, :name, :animals)
 	expect(zoo.name).to respond_to(:length, :upcase)
 	expect(zoo.animal_names).to respond_to(:count, :flatten)
 end

#Mocks objects that stand in for real objects
# 
 it 'can add animals' do 
 	lucy = Animal.new('Lucy', 'cat') 
 	tino = Animal.new('Tino', 'dog') 
 	tod = Animal.new('Tod', 'fox')
 	dumbo = Animal.new('Dumbo', 'elephant')
 	huey = Animal.new('Huey', 'duck') 

 	zoo_mock = instance_double(Zoo, name: 'Denver Zoo', animals: [lucy, tino, tod, dumbo, huey])
# if we need to add 10 animals to zoo, zoo_mock saves us ten lines and 10 instances
 	# zoo_mock = double('something') #stub
 	# expect(zoo_mock).to receive(:name).and_return('Denver Zoo') #stub
 	# expect(zoo_mock).to receive(:add_animal).twice.and_return([dog, cat]) #stub
 	# expect(zoo_mock).to receive(:animal_names).twice.and_return(['Lucy', 'Tino']) #stub
 	expect(zoo_mock).to receive(:animal_names).twice.and_return(['Lucy', 'Tino', 'Tod', 'Dumbo', 'Huey']) #stub a mock


 	expect(zoo_mock.name).to respond_to(:length, :upcase)
 	expect(zoo_mock.animals).to respond_to(:count, :flatten)
 	expect(zoo_mock.animal_names).to respond_to(:count, :flatten)
 	expect(zoo_mock.animal_names).to_not respond_to(:to_i)
 	expect(zoo_mock).to_not respond_to(:breed)
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
 	cat = double('anything') #mock object
 	chipmunk = instance_double(Animal, name: 'Chip', breed: 'chipmunk')
 	dog = Animal.new('Tino', 'dog')  #real object can also be stubbed

 	allow(cat).to receive(:name).and_return('Lucy') #stub to mock object	
 	allow(dog).to receive(:name).and_return('Not Tino') #stub to mock/real object

 	zoo.add_animal(cat)
 	zoo.add_animal(dog)
 	zoo.add_animal(chipmunk)

 	expect(zoo.animal_names).to eq(['Lucy', 'Not Tino', 'Chip'])
 end

end
