microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    power_rating_watts = 800,
    door_is_open = FALSE
  ),
  public = list(
    cook = function(time_seconds) {
      Sys.sleep(time_seconds)
      print("Your food is cooked!")
    },
    open_door = function() {
      private$door_is_open = TRUE
    },
    close_door = function() {
      private$door_is_open = FALSE
    }
  ),
  active = list(
    power_level_watts = function(value){
      if(missing(value)){
        private$..power_level_watts
      }else{
        assert_is_a_number(value)
        assert_all_are_in_closed_range(value, lower = 0, upper = private$..power_rating_watts)
        private$..power_level_watts <- value
      }
    }
  )
)



# Explore the microwave oven class
microwave_oven_factory

# Define a fancy microwave class inheriting from microwave oven
fancy_microwave_oven_factory <- R6Class(
  "FancyMicrowaveOven",
  inherit = microwave_oven_factory
)

a_fancy_microwave <- fancy_microwave_oven_factory$new()


inherits(a_microwave_oven, "FancyMicrowaveOven")
inherits(a_fancy_microwave, "MicrowaveOven")
inherits(a_microwave_oven, "R6")
inherits(a_fancy_microwave, "R6") 



# Explore microwave oven classes
microwave_oven_factory
fancy_microwave_oven_factory

# Instantiate both types of microwave
a_microwave_oven <- microwave_oven_factory$new()
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Get power rating for each microwave
microwave_power_rating <- a_microwave_oven$power_rating_watts
fancy_microwave_power_rating <- a_fancy_microwave$power_rating_watts

# Verify that these are the same
identical(microwave_power_rating, fancy_microwave_power_rating)

# Cook with each microwave
a_microwave_oven$cook(1)



# Explore microwave oven class
microwave_oven_factory

# Extend the class definition
fancy_microwave_oven_factory <- R6Class(
  "FancyMicrowaveOven",
  inherit = microwave_oven_factory,
  # Add a public list with a cook baked potato method
  public = list(
    cook_baked_potato = function(){
      self$cook(3) #self$ tem acesso ao metodos publicos da heranç
    }
  )
  
)

# Instantiate a fancy microwave
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Call the cook_baked_potato() method
a_fancy_microwave$cook_baked_potato()



#Sobreescrevedo um metodo
#super$ tem acesso aos metodos do pai na herança

# Explore microwave oven class
microwave_oven_factory

# Update the class definition
fancy_microwave_oven_factory <- R6Class(
  "FancyMicrowaveOven",
  inherit = microwave_oven_factory,
  # Add a public list with a cook method
  public = list(
    cook = function(time_seconds){
      super$cook(time_seconds)
      message("Enjoy your dinner!")
    }
  )  
  
)

# Instantiate a fancy microwave
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Call the cook() method
a_fancy_microwave$cook(1)
# Expose the parent functionality
fancy_microwave_oven_factory <- R6Class(
  "FancyMicrowaveOven",
  inherit = microwave_oven_factory,
  public = list(
    cook_baked_potato = function() {
      self$cook(3)
    },
    cook = function(time_seconds) {
      super$cook(time_seconds)
      message("Enjoy your dinner!")
    }
  ),
  # Add an active element with a super_ binding
  active = list(
    super_ = function() super
  )
  
)

# Instantiate a fancy microwave
a_fancy_microwave <- fancy_microwave_oven_factory$new()

# Call the super_ binding
a_fancy_microwave$super_


ascii_pizza_slice <- "   __\n // \"\"--.._\n||  (_)  _ \"-._\n||    _ (_)    '-.\n||   (_)   __..-'\n \\\\__..--\"\""



# Explore other microwaves
microwave_oven_factory
fancy_microwave_oven_factory

# Define a high-end microwave oven class
high_end_microwave_oven_factory <- R6Class(
  "HighEndMicrowaveOven",
  inherit = fancy_microwave_oven_factory,
  public = list(
    cook = function(time_seconds){
      super$super_$cook(time_seconds) #acessando o metodo cook do microwave_oven
      message(ascii_pizza_slice)
    }
  )
)




# Instantiate a high-end microwave oven
a_high_end_microwave <- high_end_microwave_oven_factory$new()

# Use it to cook for one second
a_high_end_microwave$cook(1)
