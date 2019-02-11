class Building
  attr_accessor :name, :address, :height, :construction_date, :architect, :id

  def initialize(input_options)
    @id = input_options["id"]
    @name = input_options["name"]
    @address = input_options["address"]
    @height = input_options["height"]
    @construction_date = input_options["construction_date"]
    @architect = input_options["architect"]
  end

  def self.find(input_id)
    response = HTTP.get("http://localhost:3000/api/buildings/#{ input_id }")
    building_hash = response.parse
    Building.new(building_hash)
  end

  def self.all
    response= HTTP.get(
                        "http://localhost:3000/api/buildings"
                      )
    buildings = response.parse
    new_array = []
    buildings.each do |buildings|
      new_array << Building.new(buildings)
    end
    new_array
  end

 def self.create(client_params)
   response = HTTP.post(
                        "http://localhost:3000/api/buildings", 
                        form: client_params
                       )

   building = response.parse
   Building.new(building)
 end

 def update(input_hash)
   response = HTTP.patch(
                         "http://localhost:3000/api/buildings/#{ self.id }",
                         form: input_hash
                         )
                         update_building = response.parse
                         Building.new(update_building)

 end

 def destroy
   response = HTTP.delete(
                           "http://localhost:3000/api/buildings/#{self.id}"
                           )
                            
 end

end
