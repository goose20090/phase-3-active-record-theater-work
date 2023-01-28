class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map{|audition| audition.actor}
    end

    def locations
        self.auditions.map{|audition| audition.location}
    end

    def lead
        self.auditions.each do |audition|
            return audition if audition.hired == true
        end
        return "no actor has been hired for this role" 
    end

    def understudy
        count = 0
        self.auditions.each do |audition|
            if audition.hired == true
                count+= 1
            end
            return audition if count == 2
        end
        "no actor has been hired for understudy for this role"
    end
end