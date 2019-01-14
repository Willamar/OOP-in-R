# Create get_n_elements
get_n_elements <- function(x, ...){
  UseMethod("get_n_elements")
}


# View get_n_elements
get_n_elements

# Create a data.frame method for get_n_elements
get_n_elements.data.frame <- function(x, ...){
  nrow(x) * ncol(x)
}

# Call the method on the sleep dataset
n_elements_sleep <- get_n_elements(sleep) 

# View the result
n_elements_sleep

get_n_elements(matrix())#Erro

# View pre-defined objects
ls.str()

# Create a default method for get_n_elements
get_n_elements.default <- function(x,...){
  length(unlist(x))
}

# Call the method on the ability.cov dataset
n_elements_ability.cov <- get_n_elements(ability.cov) 

n_elements_ability.cov

get_n_elements(matrix())

# Find methods for print
methods(print)


# View the structure of hair
str(hair)

# What primitive generics are available?
.S3PrimitiveGenerics

# Does length.hairstylist exist?
exists("length.hairstylist")

# What is the length of hair?
length(hair)

kitty <- "Miaow!"

# View the kitty
kitty 

# Assign classes
class(kitty) <- c("cat", "mammal", "character")

# Does kitty inherit from cat/mammal/character vector?
inherits(kitty, "cat")
inherits(kitty, "mammal")
inherits(kitty, "character")

# Is kitty a character vector?
is.character(kitty)

# Does kitty inherit from dog?
inherits(kitty, "dog")


# Inspect your workspace
ls.str()

what_am_i <- function(x, ...){
  UseMethod("what_am_i")
}

# cat method
what_am_i.cat <- function(x, ...)
{
  # Write a message
  message("I'm a cat")
  # Call NextMethod
  NextMethod("what_am_i")
}

# mammal method
what_am_i.mammal <- function(x, ...)
{
  # Write a message
  message("I'm a mammal")
  # Call NextMethod
  NextMethod("what_am_i")
}

# character method
what_am_i.character <- function(x, ...)
{
  # Write a message
  message("I'm a character")
}

# Call what_am_i()
what_am_i(kitty)
