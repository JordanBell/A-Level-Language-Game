﻿package 
{

	public class Game extends Object
	{

		//Reference
		public var name:String;
		public var gameFrameName:String;
		public var settingsFrameName:String;

		//User selected
		//WARNING: the difficulty value must be set through the method, or else the corresponding effects won't take place.
		public var chosenGameDifficulty:String;
		public var chosenSubcategory:String;
		public var chosenCategory:String;
		public var chosenFormat:String;

		//Lingual
		public var currentWordlist:Array = new Array();
		public var currentWord:String;

		//Gameplay
		public var useTimer:Boolean;
		public var round:int = -1;
		public var totalRounds:uint;

		//Score
		public var score:Score = new Score();

		//Constructor
		public function Game(gameType:String):void
		{
			//Sets the properties which are based on the type of game.
			name = gameType;
			gameFrameName = "Game_" + gameType;
			settingsFrameName = "Settings_" + gameType;
		}


		//Property editting
		public function settingsTo(lang:Language, cate:String, gameDiff:String, subcat:String, format:String):void
		{
			setGameDifficulty(gameDiff);
			setSubcategory(subcat);
			setCategory(cate);
			setFormat(format);

			//Sets the chosenWordList, depending on difficulty

			setWordlist(lang.getCategoryByName(cate).getRandomWords(subcat));
		}
		public function setCategory(aCategory:String)
		{
			chosenCategory = aCategory;
		}
		public function setFormat(aFormat:String):void
		{
			chosenFormat = aFormat;
		}
		public function setGameDifficulty(diff:String):void
		{
			//Literally, sets the difficulty.
			chosenGameDifficulty = diff.toLowerCase();

			//Hence sets the difficulty-based properties
			switch (chosenGameDifficulty)
			{
				case "easy" :
					//Only on easy difficulty will there we no timer
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
		public function setSubcategory(subcat:String):void
		{
			//Literally, sets the subcategory.
			chosenSubcategory = subcat.toLowerCase();
		}
		public function setWordlist(wordlist:Array):void
		{
			//Sets the word list based on the argument
			currentWordlist = wordlist;

			//Finally, sets the total Rounds and game duration, based on the number of words in the list
			totalRounds = currentWordlist.length;
			score.duration = totalRounds * 2;

			//Resets the currentWord value to that of the first word in the given list
			currentWord = currentWordlist[0];
		}
		public function nextRound():void
		{
			//Increase the round
			round++;
			//And set the current word based on that round number
			currentWord = currentWordlist[round];
		}
		public function resetGameStats():void
		{
			round = -1;
			score.resetScore();
		}


		//Processes
		public function translateWord(word:String, fromLang:Language, toLang:Language, category:String = null, subcategory:String = null):String
		{
			//Resets the word parameter to its lowercase version, allowing a degree of freedom with the input
			word = word.toLowerCase();
			
			var translatedWord:String = "Word not found. Sorry!";
			
			if ((category != null) && (subcategory!=null))
			{
				var fromList:Array = fromLang.getCategoryByName(category).getListByName(subcategory);
				var toList:Array = toLang.getCategoryByName(category).getListByName(subcategory);
				
				//Runs through all of the words in the fromList
				for (var h:uint = 0; h < fromList.length; h++)
				{
					//Goes through each word
					if (fromList[h] == word)
					{
						//When the word has been found in the fromList, its corresponding index is saved in the toList, giving the translated word.
						translatedWord = toList[h];
					}
				}
			}
			else
			{
				//Saves the indexes of the three arrays in which the larget word is found.
				var index1:int = -1;
				var index2:int = -1;
	
				//Runs through all of the arrays looking for the matching category, difficulty and word.
				for (var i:uint = 0; i < fromLang.allCategories.length; i++)
				{
					//Goes through every category
					for (var j:uint = 0; j < fromLang.allCategories[i].everyWord.length; j++)
					{
						//And goes through each word
						if (fromLang.allCategories[i].everyWord[j] == word)
						{
							//When the word has been found, its address is saved in the three previously defined variables
							index1 = i;
							index2 = j;
						}
					}
				}
				
				if ((index1 != -1) && (index2 != -1))
				{
					translatedWord = toLang.allCategories[index1].everyWord[index2];
				}
			}

			//Returns the corresponding word from the list of words in the TO language
			if (translatedWord == "")
			{
				trace("We couldn't find a translation for " + word);
			}
			return (translatedWord);
		}
	}
}