class BogglesInteractor
    # include Interactor 

    def initialize(boggle)
       @word = boggle.word
       @alphabets_on_boggle = boggle.alphabets_on_boggle 
       @matrix_size = boggle.matrix_size
       matrix_size_constant = @matrix_size.split("x")
       @row_size = matrix_size_constant[0].to_i
       @column_size = matrix_size_constant[1].to_i
       @total = @row_size * @column_size
    end

    def checkWord()

    end

    
    def getListOfWords()

    end

    def generate_Matrix_from_string()
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
        return rows
    end
end