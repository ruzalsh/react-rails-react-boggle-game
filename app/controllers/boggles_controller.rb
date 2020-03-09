class BogglesController < ActionController::API

    def get_possible_words_from_string
        @boggle = Boggle.new(boggle_params)
        matrix_from_word = BogglesService.call(@boggle)
        
        render json: {status: 'SUCCESS', message: 'Loaded all posts', data: @boggle}, status: :ok
    end

    def validate_word_simple
        boggle = Boggle.new(boggle_params)
        bogglesService = BogglesService.new(boggle)
        
        if bogglesService.is_valid
            score = Score.new()
            score.score =boggle.word.length
            render json: {status: 'SUCCESS',message: 'valid word', data: score} and return  
        end
        render json: {status: 'FAILED',message: 'invalid word', data: ""}
    end

    def validate_word_dfs_algo
        boggle = Boggle.new(boggle_params)
        bogglesService = BogglesService.new(boggle)
        
        if bogglesService.is_valid_with_algo
            score = Score.new()
            score.score =boggle.word.length
            render json: {status: 'SUCCESS',message: 'valid word', data: score} and return  
        end
        render json: {status: 'FAILED',message: 'invalid word', data: ""}
    end

    def get_boggle
        bogglesService = BogglesService.new(nil).get_boggle
        
        render json: {status: 'FAILED',message: 'invalid word', data: ""}
    end

    private
    def boggle_params
        params.require(:boggle).permit(:word, :alphabets_on_boggle, :matrix_size)
    end


end