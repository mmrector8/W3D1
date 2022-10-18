class Array

    def my_each(&blck)
        i = 0 
        while i < self.length
            blck.call(self[i])
            i +=1
        end
        self
    end

    def my_select(&blck)
        new_arr = []
        self.my_each do |ele|
            if blck.call(ele)
                new_arr << ele
            end
        end
        new_arr
    end

    def my_reject(&blck)
        new_arr = []
        self.my_each do |ele|
            if blck.call(ele) == false
                new_arr << ele
            end
        end
     new_arr
    end

    def my_any?(&blck)
        self.my_each do |ele|
            return true if blck.call(ele) == true
        end
        false
    end

    def my_all?(&blck)
        self.my_each do |ele|
            return false if blck.call(ele) == false
        end
        true
    end
    
    def my_flatten
        flat =[]
        #base case

        #recursive case
        self.each_with_index do |ele,i|
            if ele.class != Array
                flat << ele
            else
                flat += (ele.my_flatten)
            end
         end
        flat
    end

    def my_zip(*args)
        new_arr = Array.new(self.length) {|ele| ele = []}
        i = 0
        j = 0
        #loop through self
            # loop through args # grab elements at the current self index
                while i <= args.length # 0
                    new_arr[i] << self[i]
                    while j < args.length#0
                        new_arr[i] << args[j][i]
                        j+=1
                    end
                    i+=1
                 j = 0
                end
        new_arr    
    end

    def my_rotate(rotations=1)
        #define a return array
        rotated = Array.new(self.length)
        #loop through array
            self.each_with_index do |ele, i| #self[0] = "a"
            #get current index
                new_idx = (i - rotations) % self.length #0 -1 
                rotated[new_idx] = ele
            end
        rotated
    end


    def my_join(sep = "")
        self.join(sep)
    end

    def my_reverse
        reversed = []
        i = self.length-1
        while i >= 0
            reversed << self[i]
            i -=1
        end
        reversed
    end
end
