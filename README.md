
# A Boggle Game

This is a [Ruby on Rails](https://rubyonrails.org/) and [React.js](https://reactjs.org/) based implementation of the **Boggle** game.



[Check out the demo on Heroku](https://stormy-temple-09691.herokuapp.com/)



## Built with

- Ruby 2.6.5p114

- Rails 6.0.2.1

- Node : v10.16.3

- npm : 6.9.0 or 1.22.0

- React JS 16.13.0

  

## Quick Start

You need to have bundler installed in your system.

**Step 1:** You can install it by typing:

```bash
$ gem install bundler
```



**Step 2:** Install all the related package.

Open of a terminal window in the root of the project **/react-rails-react-boggle-game** and type :

```bash
$ bundle install
```



**Step 3:** Install the necessary node packages:

```bash
$ yarn install or 
$ npm install
```



**Step 4:** Run the server:

```bash
$ rails s
```

## How it works ?

Boggle is a word game. The game is played using a grid of letters, in which the players attempt to find words in sequences of adjacent letters. 

Basically, The player searches for words that can be constructed from the letters of sequentially adjacent cubes, where "adjacent" cubes are those  horizontally, vertically and diagonally neighboring. Words must be at  least three letters long, may include singular and plural (or other derived forms) separately. The application records all the words that is submitted by the players. After **timer runs out** , the application stops the player from the game play and the game enters the scoring phase. 

## Limitations
Currently this application consists of two api and are **described with limitation** as follows

1.  **HTTP Verb : POST** <br/>
    **api : "localhost:3000/check"**  
    **Payload :**  <br/>
```bash
{
	"word":"apple",
	"alphabets_on_boggle":"abcdefghijklmnop",
	"matrix_size":"4x4"
}
```
This Api Handles simple validation, if input word exist in dictionary file it returns response as:

```bash
    {
      "status": "SUCCESS",
      "message": "valid word",
      "data": {
          "score": 3
      }
  }
  ```

2. **HTTP Verb : POST** <br/>
    **api : "localhost:3000/checkAlgo"**  (This api process good upto 3x3 boggle game. However it is much more slower in case of 4x4 and 5x5 boggle game tested with 4GB RAM) <br/>
    **Payload :** 
```bash
{
	"word":"knife",
	"alphabets_on_boggle":"abcdefghijklmnop",
	"matrix_size":"4x4"
}
```

Handles validation using **DEPTH FIRST SEARCH algorithm**,
   if input word is valid among possible words that are scaned by ALGORITHM then it returns response as:
   ```bash
     {
       "status": "SUCCESS",
      "message": "valid word",
       "data": {
           "possibleWords": [
               "knife"
           ],
           "isValid": true,
           "score": {
               "score": 5
           }
       }
   }
```

3. This third API is on process of development and its main target is to provides **alphabets that are pre-processed and arranged on boggle** and **all possible meaningful words**  so that all validation of user input can be done faster from JavaScript. 

## Credits and References

- [Wikipedia Definition](https://en.wikipedia.org/wiki/Boggle)
- [Boggle-Game](https://wordtwist.puzzlebaron.com/init.php)
- [Depth-first_search Algorithm](https://en.wikipedia.org/wiki/Depth-first_search) 