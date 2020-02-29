class BogglesController < ApplicationController

    def get_possible_words_from_string
        @boggle = Boggle.new(boggle_params)
        @instance_of_boggle_search_test = BoggleSearchTest.new(@boggle)
        @instance_of_boggle_search_test.findAllPossibleWords()
        render json: {status: 'SUCCESS', message: 'Loaded all posts', data: @boggle}, status: :ok
    end

    private
    def boggle_params
        params.require(:boggle).permit(:word, :alphabets_on_boggle, :matrix_size)
    end
end