class Hedgehog 
 attr_accessor :id, :first_name, :age, :color, :favorite_food

 def initialize(input_hash)
  @id = input_hash["id"]
  @first_name = input_hash["first_name"]
  @age = input_hash["age"]
  @color = input_hash["color"]
  @favorite_food = input_hash["favorite_food"]
 end


def self.find(id)
  hedgehog_hash = Unirest.get("http://localhost:3000/api/v1/hedgehogs/#{id}.json").body
  Hedgehog.new(hedgehog_hash)
end

 def self.all
  hedgehogs = []
  hedgehogs_array = Unirest.get("http://localhost:3000/api/v1/hedgehogs.json").body
  hedgehogs_array.each do |hedgehogs_array|
    hedgehogs << Hedgehog.new(hedgehogs_array)
  end
 end

 

end