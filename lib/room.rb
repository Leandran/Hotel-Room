class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

    def full?
        if @occupants.size < @capacity
            false
        else 
            true
        end
    end

    def available_space
        @capacity - @occupants.size
    end

    def add_occupant(person)
        if self.full? 
            return false                        
        else
            @occupants << person
            return true
        end
    end

end
