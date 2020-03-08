module FileParser

    def FileParser.dictionary
        fileWords=[]
        File.foreach("resources/dictionary/output.txt") { |line|
            fileWords.push(line)
        }
        return fileWords;
    end
end