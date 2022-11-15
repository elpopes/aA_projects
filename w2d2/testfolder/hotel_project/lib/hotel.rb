require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each {|k,v| @rooms[k] = Room.new(v)}
    end

    def name 
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end

    def room_exists?(string)
        return @rooms[string] ? true : false 
    end

    def check_in(person, room_name)
        if !room_exists?(room_name)
            puts 'sorry, room does not exist'
            return false
        end
        if @rooms[room_name].add_occupant(person)
            puts 'check in successful'
        else
            puts 'sorry, room is full'
        end
    end

    def has_vacancy?
        if @rooms.all? {|key, v| v.full? }
            return false
        else
            return true
        end
    end

    def list_rooms
        @rooms.each do |k, v|
            puts k + " has " + v.available_space.to_s
        end
    end
    
end
require 'byebug'

def diagonals(arr)
    row_length = arr[0].length
    firstL = arr[0][0]
    firstR = arr[0][row_length - 1]
    p, s = 0, 0
    
    (0...row_length).each do |i|
      p += 1 if arr[i][i] == firstL
      debugger
      s += 1 if arr[i][row_length - 1 - i] == firstR
    end
  
    return p == 3 || s == 3
  end
  
  twoD = [
    [:p, :o, :w],
    [:o, :p, :o],
    [:p, :o, :o]
  ]
  
  puts diagonals(twoD)
  