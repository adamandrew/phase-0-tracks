# Virus Predictor

# I worked on this challenge with: Martha Rodgers.
# We spent 1 hour on this challenge.

# EXPLANATION OF require_relative
# it imports the file required using relative path to current directory
#
require_relative 'state_data'

class VirusPredictor

  # setting instance variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end


  # calls predicted_deaths and speed_of_spread methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  
private
  # taking in arguments of population and use it to calculate predicted deaths
  # print out the state and number of death
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # taking in arguments population and state and calculate speed of spread
  # print out the state and speed of spread
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

# loop through the STATE_DATA hash
# set the variable to the state names
# create instance of VirusPredictor for each state
# call virus_effects method on each VirusPredictor instance
STATE_DATA.each do |state,population|
  virus_predictor = VirusPredictor.new(state, population[:population_density], population[:population])
  virus_predictor.virus_effects
end


#=======================================================================
# Reflection Section
=begin
- When the key is not a symbol, we use rocket notation, and when key is a symbol, we use a colon.
- require_relative can import files using relative path, while require can only import file in the absolute path or in $LOAD_PATH.
- You can use .each or .map to iterate through hash.
- Instance variables can be access anywhere inside the class, so there is no need to pass instance variables around inside a class.
- The concept of instance variable was most solidified. 
=end