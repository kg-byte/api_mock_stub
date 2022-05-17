require 'pry'
require './lib/zoo'
require './lib/animal'

RSpec.describe Zoo do 
 let!(:zoo) {Zoo.new('Denver Zoo')}

 it 'returns animal names' do
 	lucy = Animal.new('Lucy', 'cat') 
 	tino = Animal.new('Tino', 'dog') 
 	tod = Animal.new('Tod', 'fox')
 	dumbo = Animal.new('Dumbo', 'elephant')
 	huey = Animal.new('Huey', 'duck')
 	lucy2 = Animal.new('Lucy2', 'cat') 
 	tino2 = Animal.new('Tino2', 'dog') 
 	tod2 = Animal.new('Tod2', 'fox')
 	dumbo2 = Animal.new('Dumbo2', 'elephant')
 	huey2 = Animal.new('Huey2', 'duck')

 	zoo.add_animal(lucy)
 	zoo.add_animal(tino)
 	zoo.add_animal(tod)
 	zoo.add_animal(dumbo)
 	zoo.add_animal(huey) 	
 	zoo.add_animal(lucy2)
 	zoo.add_animal(tino2)
 	zoo.add_animal(tod2)
 	zoo.add_animal(dumbo2)
 	zoo.add_animal(huey2)

 	expect(zoo.animals).to eq([lucy, tino, tod, dumbo, huey])
 	expect(zoo).to respond_to(:add_animal, :animal_names, :name, :animals)
 	expect(zoo.name).to respond_to(:length, :upcase)
 	expect(zoo.animal_names).to respond_to(:count, :flatten)
 	expect(zoo.animal_names).to eq(['Lucy', 'Tino', 'Tod', 'Dumbo', 'Huey'])
 	
 	#pretend we only care about zoo.animal_names to return the above string for future tests
 	expect(zoo.animal_names.join).to eq("LucyTinoTodDumboHueyLucy2Tino2Tod2Dumbo2Huey2")
 end

# what if there's thousands of animals to add from a csv file? and we only want to return zoo.animal_names for other tests?
#Mocks objects and stubs that stand in for real objects /method return values

  #create and stub a double
it 'returns animal names' do 
  zoo_mock = double()
  allow(zoo_mock).to receive(:animal_names).and_return(['Lucy', 'Tino', 'Tod', 'Dumbo', 'Huey', 'Lucy2', 'Tino2', 'Tod2', 'Dumbo2', 'Huey2'])
  
  expect(zoo_mock.animal_names.join).to eq("LucyTinoTodDumboHueyLucy2Tino2Tod2Dumbo2Huey2")
end


    #create a instance_double
 it 'returns animal names' do 
 	zoo_mock = instance_double(Zoo, name: 'Denver Zoo', animal_names: ['Lucy', 'Tino', 'Tod', 'Dumbo', 'Huey', 'Lucy2', 'Tino2', 'Tod2', 'Dumbo2', 'Huey2'])
 	
 	expect(zoo_mock.animal_names.join).to eq("LucyTinoTodDumboHueyLucy2Tino2Tod2Dumbo2Huey2")
 end

#stub a real object
  it 'returns animal names' do 
  	allow(zoo).to receive(:animal_names).and_return(['Lucy', 'Tino', 'Tod', 'Dumbo', 'Huey', 'Lucy2', 'Tino2', 'Tod2', 'Dumbo2', 'Huey2'])
  
    expect(zoo.animal_names.join).to eq("LucyTinoTodDumboHueyLucy2Tino2Tod2Dumbo2Huey2")
  end




# stubs attributes exxample
 it 'returns animal names' do 
 	cat = double('anything') #mock object
 	chipmunk = instance_double(Animal, name: 'Chip')
 	dog = Animal.new('Tino', 'dog')  #real object can also be stubbed

 	allow(cat).to receive(:name).and_return('Lucy') #stub name attribute in mock object	
 	allow(dog).to receive(:name).and_return('Not Tino') #stub bane attribute in real object -tino becomes not tino

 	zoo.add_animal(cat)
 	zoo.add_animal(dog)
 	zoo.add_animal(chipmunk) #instance double initialized with name attribue

 	expect(zoo.animal_names).to eq(['Lucy', 'Not Tino', 'Chip'])
 end

end
