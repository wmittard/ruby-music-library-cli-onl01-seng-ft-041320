module Concerns::Findable
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self
  end 
  
  def self.all 
    @@all 
  end 
   
   
   def find_by_name(name)
   @@all.detect {|find| find.name == name}
    end 
    
    def find_or_create_by_name(name)
      binding.pry
      self.find_by_name(name) || self.create(name)
    end 
end 

