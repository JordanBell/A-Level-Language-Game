package  {
	
	public class Game extends Object{
			//Properties
		//Reference
		public const setFrameRate:uint = 24;
		
		public var name:String;
		public var gameFrameName:String;
		public var settingsFrameName:String;
		
		//User selected
			//WARNING: the difficulty value must be set through the method, or else the corresponding effects won't take place.
		public var chosenDifficulty:String;
		public var chosenLanguage:Language;
		public var chosenCategory:String;
		public var chosenFormat:String;
		
		//Lingual
		public var currentWordlist:Array = new Array();
		public var currentWord:String;
		
		//Gameplay
		public var useTimer:Boolean;
		public var duration:uint;
		public var round:int = -1;
		public var totalRounds:uint;
		
		//Score
		public var scoreHandler:Score = new Score();
		
		
			//Methods
		
		public function settingsTo(lang:Language, cate:String, diff:String):void{
			setLanguage(lang);
			setDifficulty(diff);
			setCategory(cate);
			setWordlist(lang.getCategoryByName(cate).getWordsPerDifficulty(diff));
		}
		
		public function Game(gameType:String):void{
			//Sets the properties which are based on the type of game.
			name = gameType;
			gameFrameName = "Game_" + gameType;
			settingsFrameName = "Settings_" + gameType;
		}
		
		public function setLanguage(aLanguage:Language){
			chosenLanguage = aLanguage;
		}
		
		public function setCategory(aCategory:String){
			chosenCategory = aCategory;
		}
		
		public function setDifficulty(diff:String):void{
			//Literally, sets the difficulty.
			chosenDifficulty = diff;
			
			//Sets difficulty-based properties
			switch (chosenDifficulty.toLowerCase()){
				case "easy":
					//Only on easy difficulty will there we no timer
					totalRounds = 10;
					useTimer = false;
					scoreHandler.penaltyOnWrong = false;
					scoreHandler.difficultyMultiplier = 0.8;
					break;
				case "medium":
					totalRounds = 15;
					useTimer = true;
					scoreHandler.penaltyOnWrong = false;
					scoreHandler.difficultyMultiplier = 1.0;
					duration = 150;
					break;
				case "hard":
					//Only hard difficulty adds a penalty for incorrect answers
					totalRounds = 20;
					useTimer = true;
					scoreHandler.penaltyOnWrong = true;
					scoreHandler.difficultyMultiplier = 1.2;
					duration = 200;
					break;
				default:
					trace("Error: The difficulty was not recognised in the setDifficulty method, under the Game class.");
					chosenDifficulty = "ERROR_DifficultyName";
			}
		}
		
		public function setWordlist(wordlist:Array):void{
			//Sets the word list
			currentWordlist = wordlist;
			
			//Resets the currentWord value to that of the fist word in the given list
			currentWord = currentWordlist[0];
		}
		
		public function nextRound():void{
			//The condition checks to see if the languag, category and difficulty has been set. This is to be required in order for a game (round) to start.
			if ((chosenLanguage != null) && (chosenCategory != null) && (chosenDifficulty != null)){
				round++;
				currentWord = currentWordlist[round];
			}else{
				trace("ERROR: Required settings, (Language, Category and Difficulty) have not all been set!");
			}
		}
		
		public function translateWord(fromLang:Language, toLang:Language, word:String):String{
			//Starts off by finding the category, difficulty and word in which the word is locate in the FROM language
			
			word = word.toLowerCase();
			
			var index1:uint = 0;
			var index2:uint = 0;
			var index3:uint = 0;
			
			
			for (var i:uint = 0; i < fromLang.allCategories.length; i++){
				//Goes through every category
				for (var j:uint = 0; j < fromLang.allCategories[i].allDifficulties.length; j++){
					//And goes through each difficulty
					for (var k:uint = 0; k < fromLang.allCategories[i].allDifficulties[j].length; k++){
						//And goes through each word
						if (fromLang.allCategories[i].allDifficulties[j][k] == word){
							//When the word has been found, its address is saved in the three previously defined variables
							index1 = i;
							index2 = j;
							index3 = k;
						}else{
							//Do nothing, continue searching
						}
					}
				}
			}
			
			//Returns the corresponding word from the list of words in the TO language
			return(toLang.allCategories[index1].allDifficulties[index2][index3]);
		}
	}
}
