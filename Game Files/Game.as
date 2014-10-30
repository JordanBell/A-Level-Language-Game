package 
{

	/*This class contains everything pertaining to the specific game being played.
	It also uses information from the Language and Category classes to perform translations.*/
	public class Game extends Object
	{

		//Each game will have a name
		public var name:String;
		//User Interface frame name, used by the main timeline to jump to the correct game frame
		public var gameFrameName:String;
		//Settings screen frame name, used by the main timeline to jump to the correct settings frame
		public var settingsFrameName:String;

		//User selected variables set in the settings screen:
		//Game difficulty affects time limit and scoring
		public var chosenGameDifficulty:String;
		//A chosen category contains a varety of words for each language
		public var chosenCategory:String;
		//The subcategory provides a finer list of words
		public var chosenSubcategory:String;
		//Depending on the chosenFormat, the game will respond differently (ie english words will be output, rather than foreign ones)
		public var chosenFormat:String;

		//These lingual variables hold the words used by the game
		public var currentWordlist:Array = new Array  ;
		public var currentWord:String;

		//The following gameplay variables are used for the mechancis of the game
		//The useTimer boolean will determine whether or not the player is restricted by a time limit and/or recieve a time bonus
		public var useTimer:Boolean;
		//The round number starts at -1, because it is initially increased before being used in an array, allowing for it to access the first index (0) or the array
		public var round:int = -1;
		//the totalRounds variable limits how many rounds take place in the game. This changes based on the length of words held in the currentWordList
		public var totalRounds:uint;

		//A score handler is instantiated, as every game will have a score (see the Score class for a description of how it works)
		public var score:Score = new Score  ;

		//Constructor
		public function Game(gameType:String):void
		{
			//Sets the properties which are based on the type of game.
			name = gameType;
			//The frame names follow an expected format, with the only difference being the name of the game
			gameFrameName = "Game_" + gameType;
			settingsFrameName = "Settings_" + gameType;
		}

		//The settingsTo method means that all of the settings can be set from a single method, with multiple parameters
		public function settingsTo(lang:Language,cate:String,gameDiff:String,subcat:String,format:String):void
		{
			//Set all of the variables based on the parameters
			setGameDifficulty(gameDiff);
			setSubcategory(subcat);
			setCategory(cate);
			setFormat(format);

			//The word list is then set, based on all of the related parameters
			setWordlist(lang.getCategoryByName(cate).getRandomWords(subcat));
		}

		//Sets category
		public function setCategory(aCategory:String)
		{
			chosenCategory = aCategory;
		}

		//Sets format
		public function setFormat(aFormat:String):void
		{
			chosenFormat = aFormat;
		}

		//Sets the game difficulty, along with all of the properties it affects
		public function setGameDifficulty(diff:String):void
		{
			//The chosenGameDifficulty parameter is set to lower case to allow for any format discrepancies
			chosenGameDifficulty = diff.toLowerCase();

			//Hence sets the difficulty-based properties
			switch (chosenGameDifficulty)
			{
				case "easy" :
					//Only on easy difficulty will the timer be removed
					useTimer = false;
					score.penaltyOnWrong = false;
					score.difficultyMultiplier = 1;
					break;
				case "medium" :
					useTimer = true;
					score.penaltyOnWrong = false;
					score.difficultyMultiplier = 2;
					break;
				case "hard" :
					//Only hard difficulty adds a penalty for incorrect answers
					useTimer = true;
					score.penaltyOnWrong = true;
					score.difficultyMultiplier = 3;
					break;
				default :
					trace("Error: The difficulty was not recognised in the setGameDifficulty method, under the Game class.");
			}
		}

		//Sets the subcategory
		public function setSubcategory(subcat:String):void
		{
			//The chosenSubcategory parameter is set to lower case to allow for any format discrepancies
			chosenSubcategory = subcat.toLowerCase();
		}

		//Sets the words lists, and all the properties affected by it
		public function setWordlist(wordlist:Array):void
		{
			//Sets the word list based on the parameter
			currentWordlist = wordlist;

			//Finally, sets the total Rounds and game duration, based on the number of words in the list
			totalRounds = currentWordlist.length;
			score.duration = totalRounds * 2;

			//Resets the currentWord value to that of the first word in the given list
			currentWord = currentWordlist[0];
		}
		
		//nextRound changes the properties when a new round starts
		public function nextRound():void
		{
			//Increase the round
			round++;
			
			//And set the current word based on that round number
			currentWord = currentWordlist[round];
		}
		
		//Resets the game stats and score
		public function resetGameStats():void
		{
			round = -1;
			score.resetScore();
		}


		/*The translateWord method receives the parameters for the word,
		the language translating from, the langage translating to,
		and optionally accepts the category and subcategory it can
		be found in in order to be more efficient*/
		public function translateWord(word:String, fromLang:Language, toLang:Language, category:String=null, subcategory:String=null):String
		{
			//Resets the word parameter to its lowercase version, allowing a degree of freedom with the input
			word = word.toLowerCase();

			/*The translatedWord variable will be returned, and has
			a default message claiming that the word is not found
			which will be overwritten if the word is found*/
			var translatedWord:String = "Word not found. Sorry!";

			//The following is the more efficient search algorithm, which is used when the category and subcategory parameters both contain a value
			if ((category != null) && (subcategory != null))
			{
				//The fromList contains the list of words in the fromLang language parameter, in which the search word parameter is found
				var fromList:Array = fromLang.getCategoryByName(category).getListByName(subcategory);
				//The toList contains the list of words in the toLang language parameter, in which the translation should be found
				var toList:Array = toLang.getCategoryByName(category).getListByName(subcategory);

				//Runs through all of the words in the fromList
				for (var h:uint = 0; h < fromList.length; h++)
				{
					//Goes through each word
					if (fromList[h].toLowerCase() == word)
					{
						//When the word has been found in the fromList, its corresponding index is saved in the toList, giving the translated word.
						translatedWord = toList[h];
					}
				}
			}
			else
			{
				//If the category and subcategory of the search word have not been included as a parameter, then we will need to find it ourselves.
				
				//The indexes of the two arrays in which the word is found will be saved. They have default values that will be overwritten if found
				var index1:int = -1;
				var index2:int = -1;

				//Runs through all of the arrays looking for the matching category, difficulty and word.
				for (var i:uint = 0; i < fromLang.allCategories.length; i++)
				{
					//Goes through every category
					for (var j:uint = 0; j < fromLang.allCategories[i].everyWord.length; j++)
					{
						//And goes through every word in those categories
						if (fromLang.allCategories[i].everyWord[j] == word)
						{
							//When the word has been found, a word of the same location in the toLang is returned
							translatedWord = toLang.allCategories[i].everyWord[j];
							return(translatedWord);
						}
					}
				}
			}

			//If no match has been found, the programmer receives a message saying so
			if (translatedWord == "Word not found. Sorry!")
			{
				trace(("We couldn't find a translation for " + word));
			}
			
			//The translation is returned by the method
			return(translatedWord);
		}
	}
}