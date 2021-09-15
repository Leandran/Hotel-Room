require_relative "room"

class Hotel
    def initialize(name,capacities)
        @name = name
        @rooms = Hash.new{0}

        capacities.each do |room_name,capacity|
            @rooms[room_name] = Room.new(capacity)
        end

    end

    def name 
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if rooms.has_key?(room_name)
            true
        else
            false
        end
    end

    def check_in(person, room)
        if self.room_exists?(room) 
            if @rooms[room].add_occupant(person) 
                puts 'check in successful'
            else
                puts 'sorry, room is full'
            end
        else
            puts 'sorry, room does not exist'
        end
    end

    def has_vacancy?
        if @rooms.values.any? { |room| room.available_space > 0}
            true
        else
            false
        end
    end

    def list_rooms
      @rooms.each do |room_name, room| 
        puts "#{room_name}: #{room.available_space}"
      end                   
    end
  
end
