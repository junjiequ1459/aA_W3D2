class Card

    def initialize
        @face_value = ("A".."Z").to_a.sample
        @face_down = true
    end

    def hide
        @face_down = true
    end

    def reveal
        @face_down = false
    end 

    def display
        if @face_down == false
            @face_value
        end
    end


end

