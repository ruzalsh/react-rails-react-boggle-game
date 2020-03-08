class WordProcesser 
    # < ApplicationService
    require 'matrix'

    # psuedo code
    # initialize empty matrix
    def initialize
        width = 4
        height = 4
        @matrix = Matrix[*Array.new(height){Array.new(width)}]
    end

    # get some valid words
    # arrange alphabets of words in such a way that it fits to boggle matrix
    # return boggle matrix that are arranged to ui
    def call
        characters = "apple".split("")
        @matrix[0,0]=characters.shift if @matrix[0,0] == nil
        neighbours = BoggleSearchTest.new(nil).getNeighbourOfThisCoordinate([0,0])
        checkAndPurgeAndAssign(neighbours,characters)
        
        
        characters = "ball".split("")
        characters.each_with_index{ |c, index|
            start_index = 0
            coordinates = getCoordinateIfExist(c)
            if coordinates.size>0
                coordinate = nil
                if coordinates.size > 1
                    coordinate = coordinates.sample 
                else
                    coordinate =coordinates[0]
                end
                print index
                characters.shift
                print characters
                print coordinate
                puts
                # coordinate = coordinates[index]
                start_index = index
                neighbours = BoggleSearchTest.new(nil).getNeighbourOfThisCoordinate(coordinate)
                
                checkAndPurgeAndAssign(neighbours,characters) if neighbours != nil
                break
            else
                characters.shift
            end
        }
        
        print @matrix
    end

    def getCoordinateIfExist(character)
        index = []
        @matrix.each_with_index do |e, row, col|
            if @matrix[row,col] == character
                index.push([row,col])
            end
        end
        return index
    end

    def checkAndPurgeAndAssign(neighbours,characters)
        coordinate = neighbours.sample
        if characters.size>0
            if @matrix[coordinate[0],coordinate[1]] == nil && (coordinate[0]<4 && coordinate[1]<4) 
            
                @matrix[coordinate[0],coordinate[1]] = characters.shift
                neighbours = BoggleSearchTest.new(nil).getNeighbourOfThisCoordinate([coordinate[0],coordinate[1]])
                checkAndPurgeAndAssign(neighbours,characters)
            else
                neighbours.delete(coordinate)
                checkAndPurgeAndAssign(neighbours,characters)
            end
        end
    end
end

# d = WordProcessor.new
# d.call

