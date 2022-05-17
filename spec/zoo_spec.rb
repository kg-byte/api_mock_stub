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

#Mocks objects that stand in for real objects
# 
 it 'can add animals' do 
 	dog = Animal.new('Tino', 'dog') 
 	cat = Animal.new('Lucy', 'cat') 

 	zoo_mock = instance_double(Zoo, name: 'Denver Zoo', add_animal: [dog, cat], animal_names: ['Lucy', 'Tino'])

 	# zoo_mock = double('something') #stub
 	# expect(zoo_mock).to receive(:name).and_return('Denver Zoo') #stub
 	# expect(zoo_mock).to receive(:add_animal).twice.and_return([dog, cat]) #stub
 	# expect(zoo_mock).to receive(:animal_names).twice.and_return(['Lucy', 'Tino']) #stub

 	expect(zoo_mock.name).to respond_to(:length, :upcase)
 	expect(zoo_mock.add_animal('something')).to respond_to(:count, :flatten)
 	expect(zoo_mock.add_animal('something')[0]).to respond_to(:breed)
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
