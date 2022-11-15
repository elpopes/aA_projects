require_relative "room"

class Hotel
    attr_reader(:rooms)
    
    def initialize(name, room_hash)
        @name = name
        @rooms = {}
        room_hash.each {|k,v| @rooms[k] = Room.new(v)}
    end

    def name
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end

    def room_exists?(string)
        @rooms.has_key?(string)
    end

    def check_in(person, room_name)
        case room_exists?(room_name)
        when false
            p 'sorry, room does not exist'
        else
            case @rooms[room_name].add_occupant(person)
            when true
                p 'check in successful'
                return true
            else
                p 'sorry, room is full'
                return false
            end
        end
    end

    def has_vacancy?
        @rooms.any? {|k, v| !v.full? }
    end

    def list_rooms
        @rooms.each {|k, v| puts "#{k} has #{v.available_space}" }
    end
    
end
