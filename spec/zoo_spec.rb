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

 	expect(zoo.animal_names).to eq(['Lucy', 'Tino', 'Tod', 'Dumbo', 'Huey', 'Lucy2', 'Tino2', 'Tod2', 'Dumbo2', 'Huey2'])
 	#pretend we only care about zoo.animal_names to return the above string for future tests
 	expect(zoo.animal_names.join).to eq("LucyTinoTodDumboHueyLucy2Tino2Tod2Dumbo2Huey2")
 end

# what if there's thousands of animals to add from a csv file? and we only want to return zoo.animal_names for other tests?

#Mocks objects and stubs that stand in for real objects /method return values, we'll practice:

# double: double_mock = double('literally anything or blank')
# instance mock: instance_mock = instance_double(Class, method1: val1, method2: val2)
# stub: allow(:object/:mock).to receive(:method1).and_return(val1) 


  #create and stub a double
xit 'returns animal names' do 
  # zoo_mock = #start double here
  # stub the zoo_mock double with appropriate value here
  
  expect(zoo_mock.animal_names.join).to eq("LucyTinoTodDumboHueyLucy2Tino2Tod2Dumbo2Huey2")
end


    #create a instance_double
 xit 'returns animal names' do 
 	#zoo_mock =  #initialize zoo_mock with appropriate method/response here
 	
 	expect(zoo_mock.animal_names.join).to eq("LucyTinoTodDumboHueyLucy2Tino2Tod2Dumbo2Huey2")
 end

#stub a real object
  xit 'returns animal names' do 
  	#stub real object with appropriate val here
  
    expect(zoo.animal_names.join).to eq("LucyTinoTodDumboHueyLucy2Tino2Tod2Dumbo2Huey2")
  end




# stubs attributes example
 xit 'returns animal names' do 
 	cat = double('anything') #mock object
 	chipmunk = instance_double(Animal, name: 'Chip')
 	dog = Animal.new('Tino', 'dog')  #real object can also be stubbed

 	allow(cat).to receive(:name).and_return('Lucy') #stub name attribute in mock object	
 	allow(dog).to receive(:name).and_return('Not Tino') #stub bane attribute in real object -tino becomes not tino

 	zoo.add_animal(cat)
 	zoo.add_animal(dog)
 	zoo.add_animal(chipmunk) #instance double initialized with name attribue

 	expected = #???? what should be our expected return for zoo.animal_names?
 	expect(zoo.animal_names).to eq(expected)
 end

end
