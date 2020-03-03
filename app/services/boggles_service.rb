class BogglesService < ApplicationService
    # include Interactor 
    require 'matrix'
    
    def initialize(boggle)
       @word = boggle.word
       @alphabets_on_boggle = boggle.alphabets_on_boggle 
       @matrix_size = boggle.matrix_size
       matrix_size_constant = @matrix_size.split("x")
       @row_size = matrix_size_constant[0].to_i
       @column_size = matrix_size_constant[1].to_i
       @total = @row_size * @column_size
    end

    def call
        word_in_matrix = get_words_in_matrix_form
        instance_of_boggle_search_test = BoggleSearchTest.new(word_in_matrix)
        instance_of_boggle_search_test.call
    end

    def checkWord()

    end

    
    def getListOfWords()

    end

    def get_words_in_matrix_form
        characters = @alphabets_on_boggle.split("")
        rows=[]
        i = 0
        temp_matrix_row = []
        loop do
            if i <= @total
                if temp_matrix_row.size < @row_size
                    temp_matrix_row.push(characters[i])
                    i +=1
                else
                    rows.push(temp_matrix_row)
                    temp_matrix_row =[]
                    temp_matrix_row.push(characters[i])
                    i +=1
                end
            else
                break
            end
        end
        return Matrix[*rows]
    end
end