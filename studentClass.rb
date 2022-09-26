require_relative 'personClass'

class Student < Person
    attr_accessor :classroom
  
    def intialize(classroom)
      @classroom = classroom
    end
  
    def play_hooky
      return "¯\(ツ)/¯"
    end
  end