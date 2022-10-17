class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
    attr_reader :size
    def initialize(size)
        @size = size
        @grid = Array.new(size){Array.new(size){|ele| ele = []}}

    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, mark)
         @grid[pos[0]][pos[1]] = mark
    end

    def complete_row?(mark)

        #loop through the grid
        @grid.each do |row|
            #if any subarrs have all of the same element, mark, return true
            if row.all?{|ele| ele == mark}
                return true
             end
        end
        false
    end

    def complete_col?(mark)

        transposed = @grid.transpose
         transposed.each do |row|
            #if any subarrs have all of the same element, mark, return true
            if row.all?{|ele| ele == mark}
                return true
             end
        end
        false
    end


    def down_diag(mark)
        @grid.each_with_index do |row, i|
            if @grid[i][i] != mark
                return false
            end
        end
       true
    end


    def up_down(mark)
        #loop through the array with index
        @grid.each_with_index do |row, i|
            if @grid[(@grid.length-1)-i][i] !=mark
                return false
            end
        end
        true
    end


    def complete_diag?(mark)
        up_down(mark) || down_diag(mark)
    end


    def winner?(mark)
        complete_col?(mark) || complete_row?(mark) || complete_diag?(mark)
    end

end

