require 'pry'

def my_fancy_method
    inside_method = "We are now inside the method."
    puts inside_method
    pry_coming = "We are about to see how pry works!"

    binding.pry
    frozen = "Pry froze the program before it got to this point!" 
    puts frozen
end

my_fancy_method

binding.pry
