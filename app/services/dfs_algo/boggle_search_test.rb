class BoggleSearchTest 
    # < ApplicationService
    # include Interactor 
    require 'matrix'
    #logex.rb  
    require 'logger'  
    require "file_parser"

    $LOG = Logger.new('log_file.log', 'monthly') 
    
    # require 'parallel' says -> Process.fork is not supported by this Ruby
    
    # initialize method is part of the object-creation process in Ruby & it allows you to set the initial values for an object
    # like constructor in JAVA
    $matrix = Matrix.class

    def initialize(boggle)
        
        # boggle_interceptor = BogglesInteractor.new(boggle)
        # $matrix = Matrix[*boggle_interceptor.generate_Matrix_from_string()]
        @initialCoordinate
        # $matrix = boggle
        $matrix = boggle
        @beginWith
        @possibleWords = []
        @fileWords=findMeaningFulWords()
    end


# @matrix = Matrix[ ["a","b","c","d"],
                #    ["e","f","g","h"],
                #    ["i","j","k","l"],
                #    ["m","n","o","p"] ]

# test with 4X4 matrix
    $matrix1 = Matrix[
        ["a","b","c","d"],
        ["e","f","g","h"],
        ["m","n","o","p"]]


    def call
        starting = Process.clock_gettime(Process::CLOCK_MONOTONIC) 
        thread = []
        $matrix.each_with_index do |e, row, col|
            # with thread
            # t = Thread.new{work([row,col],$matrix1[row,col])}
            # thread.push(t)
            work([row,col],$matrix[row,col])
        end
        # thread.each {|t| 
        #     t.join
        # }
        
        
        
        ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        elapsed = ending - starting
        puts elapsed
        return @possibleWords
    end

    # private
    def work(coordinate,value)
        @beginWith = coordinate;
        startT(coordinate,value,[coordinate])

    end

    # private
    def startT(coordinate,value,visitedCoordinates)
        hashList = []
        hash = Hash.new
        hash["possibleWords"] = value
        hash["visitedCoordinate"] = coordinate
        hashList.push(hash)
        coordinateValueParent = checkCoordinateValue(coordinate)
            if coordinateValueParent != nil
                toBeTraversed = []
                getNeighbourOfThisCoordinate(coordinate).each { |n|
                    if visitedCoordinates.none? n
                        toBeTraversed.push(n)               
                    end
                }
                if toBeTraversed != nil
                    traverseNeighbour(toBeTraversed,hash,hashList)
                end
            end
    end

    # private
    def traverseNeighbour(toBeTraversed,hash,hashList)
            toBeTraversed.each { |t| 
                hashList1 = []
                hashList1.push(hash)
                hash1 = Hash.new
                hash1["possibleWords"] = hash["possibleWords"]+$matrix[t[0],t[1]]
                hash1["visitedCoordinate"] = t
                hashList1.push(hash1) 
                value= hash1["possibleWords"]
                
                @possibleWords.push(value) if @fileWords.include? value+"\n"

                vlist= []
                hashList.each { |h|
                    vlist.push(h["visitedCoordinate"])
                    hashList1.push(h)
                }
                coordinateValueParent = checkCoordinateValue(t)
                if coordinateValueParent != nil
                    toBeTraversed1 = []
                    getNeighbourOfThisCoordinate(t).each { |n|
                        if vlist.none? n
                            toBeTraversed1.push(n)               
                        end
                    } 
                    if toBeTraversed1 != nil
                        if toBeTraversed1.size() ==1 && toBeTraversed1[0] == @beginWith
                            # print "end"
                            # puts
                        else
                            traverseNeighbour(toBeTraversed1,hash1,hashList1)
                        end
                    end
                end
            }
    end

    
    def getNeighbourOfThisCoordinate(coordinate)
        coordinateValue = checkCoordinateValue(coordinate)
        if coordinateValue != nil
            return getNeighbours(coordinate)
        end
    end

    # private
    def getNeighbours(coordinate)
        coordinateTopValue = checkCoordinateValue([coordinate[0]-1,coordinate[1]])
        coordinateTopRightValue = checkCoordinateValue([coordinate[0]-1,coordinate[1]+1])
        coordinateRightValue = checkCoordinateValue([coordinate[0],coordinate[1]+1])
        coordinateButtomRightValue = checkCoordinateValue([coordinate[0]+1,coordinate[1]+1])
        coordinateButtomValue = checkCoordinateValue([coordinate[0]+1,coordinate[1]])
        coordinateButtomLeftValue = checkCoordinateValue([coordinate[0]+1,coordinate[1]-1])
        coordinateLeftValue = checkCoordinateValue([coordinate[0],coordinate[1]-1])
        coordinateTopLeftValue = checkCoordinateValue([coordinate[0]-1,coordinate[1]-1])

        return [coordinateTopValue, coordinateTopRightValue, coordinateRightValue,
             coordinateButtomRightValue, coordinateButtomValue, coordinateButtomLeftValue,
            coordinateLeftValue, coordinateTopLeftValue].compact
    end

    # private
    def checkCoordinateValue(coordinate)
        return nil if coordinate == nil || (coordinate[0]<0 || coordinate[1]<0)
        if $matrix != nil
            return coordinate if $matrix[coordinate[0],coordinate[1]]!=nil && (coordinate[0]>=0 || coordinate[1]>=0)    
        else
            return coordinate
        end
        
    end
    

    def findMeaningFulWords()
        fileWords=[]
        File.foreach("resources/dictionary/output.txt") { |line|
            fileWords.push(line)
        }
        return fileWords;
        # @possibleWords.each{|pw|
        #     if @fileWords.include? pw+"\n" 
        #         puts pw
        #     end
        # }
    end
end

# b = BoggleSearchTest.new($matrix1)
# b.call
# b.findMeaningFulWords