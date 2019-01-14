#usando env

# Define a new environment
env <- new.env()

# Add an element named perfect
env$perfect <- c(6, 28, 496)

# Add an element named bases
env[["bases"]] <- c("A", "C", "G", "T")  

# Assign lst and env
lst <- list(
  perfect = c(6, 28, 496),
  bases = c("A", "C", "G", "T")
)
env <- list2env(lst)

# Copy lst
lst2 <- lst

# Change lst's bases element
lst$bases <- c("A", "C", "G", "U")

# Test lst and lst2 identical
identical(lst$bases, lst2$bases)

# Copy env
env2 <- env

# Change env's bases element
env$bases <- c("A", "C", "G", "U")

# Test env and env2 identical
identical(env$bases, env2$bases)

# Complete the class definition
microwave_oven_factory <- R6Class(
  "MicrowaveOven",
  private = list(
    shared = {
      # Create a new environment named e
      e <- new.env()
      # Assign safety_warning into e
      e$safety_warning <- "Warning. Do not try to cook metal objects."
      e$power_level_watts <- 800
      # Return e
      e
    }
  ),
  active = list(
    # Add the safety_warning binding
    safety_warning = function(value){
      if(missing(value)) {
        private$shared$safety_warning
      } else {
        private$shared$safety_warning <- value
      }
    },
    power_level_watts = function(value){
      if(missing(value)) {
        private$shared$power_level_watts
      } else {
        private$shared$power_level_watts <- value
      }
    }
  )
)
# Create two microwave ovens
a_microwave_oven <- microwave_oven_factory$new()
another_microwave_oven <- microwave_oven_factory$new()

# Change the safety warning for a_microwave_oven
a_microwave_oven$safety_warning <- "Warning. If the food is too hot you may scald yourself."

# Verify that the warning has change for another_microwave
another_microwave_oven$safety_warning  



# Create a microwave oven
a_microwave_oven <- microwave_oven_factory$new()

# Copy a_microwave_oven using <-
assigned_microwave_oven <- a_microwave_oven 

# Copy a_microwave_oven using clone()
cloned_microwave_oven <- a_microwave_oven$clone()

deep_cloned_microwave_oven <- a_microwave_oven$clone(deep = TRUE)

# Change a_microwave_oven's power level  
a_microwave_oven$power_level_watts <- 400

# Check a_microwave_oven & assigned_microwave_oven same 
identical(a_microwave_oven$power_level_watts, assigned_microwave_oven$power_level_watts)

# Check a_microwave_oven & cloned_microwave_oven different 
identical(a_microwave_oven$power_level_watts, cloned_microwave_oven$power_level_watts)  

identical(a_microwave_oven$power_level_watts, deep_cloned_microwave_oven$power_level_watts)  



# Microwave_factory is pre-defined
microwave_oven_factory


install.packages("RSQLite")

library(RSQLite)

# Complete the class definition
smart_microwave_oven_factory <- R6Class(
  "SmartMicrowaveOven",
  inherit = microwave_oven_factory, # Specify inheritance
  private = list(
    # Add a field to store connection
    conn = NULL
  ),
  public = list(
    initialize = function() {
      # Connect to the database
      private$conn <- dbConnect(SQLite(), "DataSets/cooking-times.sqlite")
    },
    get_cooking_time = function(food) {
      dbGetQuery(
        private$conn,
        sprintf("SELECT time_seconds FROM cooking_times WHERE food = '%s'", food)
      )
    },
    finalize = function() {
      # Print a message
      message("Disconnecting from the cooking times database.")
      # Disconnect from the database
      dbDisconnect(private$conn)
    }
  )
)

# Create a smart microwave object
a_smart_microwave <- smart_microwave_oven_factory$new()

# Call the get_cooking_time() method
a_smart_microwave$get_cooking_time("soup")

# Remove the smart microwave
rm(a_smart_microwave)  

# Force garbage collection
gc()   

