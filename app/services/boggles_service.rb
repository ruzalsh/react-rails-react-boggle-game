class BogglesService < ApplicationService
    

    require "file_parser"

    def initialize(boggle)
        if boggle!=nil
            @boggle = boggle
        @word = @boggle.word 
        end
        
        @fileWords = FileParser.dictionary
    end

    # simply checking words in dictionary
    def is_valid
        if @fileWords.include? @word+"\n" 
            return true  
        end
    end

    #finding all possible words in boggle
    # and validating each words in dictionary while will provide all possible words 
    def is_valid_with_algo
        keyValue = Hash.new
        # possibleWords = BoggleAlgorithm.call(@boggle)
        # keyValue["possibleWords"] = possibleWords
        if possibleWords.include? @word
            keyValue["isValid"] = true
        else
            keyValue["isValid"] = false
        end
        return keyValue
    end

    def get_boggle
        WordProcesser.new().call
    end

    def getPossibleWords
        return BoggleAlgorithm.call(@boggle)
    end
end