class Zoo 
attr_reader :name, :animals
  def initialize(name)
  	@name = name
  	@animals = []
  end

  def add_animal(animal)
  	@animals << animal 
  end

  def animal_names
  	@animals.map{|animal| animal.name}
  end


end