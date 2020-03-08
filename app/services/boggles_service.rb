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
        BogglesAlgorithm.call(@boggle)
    end

    def get_boggle
        puts "aaa"
        WordProcesser.new().call
    end
end