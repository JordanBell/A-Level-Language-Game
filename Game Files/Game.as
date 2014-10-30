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
		public function settingsTo(lang:Language, cate:String, gameDiff:String, subcat:String):void
		{
			setGameDifficulty(gameDiff);
			setSubcategory(Subcat);
			setCategory(cate);
			
			//Sets the chosenWordList, depending on difficulty
			setWordlist(lang.getCategoryByName(cate).getRandomWords(subcat));
		}
		public function setCategory(aCategory:String)
		{
			chosenCategory = aCategory;
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
					score.duration = totalRounds * 2.5;
					break;
				case "medium" :
					useTimer = true;
					score.penaltyOnWrong = false;
					score.difficultyMultiplier = 2;
					score.duration = totalRounds * 2.5;
					break;
				case "hard" :
					//Only hard difficulty adds a penalty for incorrect answers
					useTimer = true;
					score.penaltyOnWrong = true;
					score.difficultyMultiplier = 3;
					score.duration = totalRounds * 1.5;
					break;
				default :
					trace("Error: The difficulty was not recognised in the setGameDifficulty method, under the Game class.");
			}
		}
		public function setSubcategory(diff:String):void
		{
			//Literally, sets the difficulty.
			chosenSubcategory = diff.toLowerCase();
		}
		public function setWordlist(wordlist:Array):void
		{
			//Sets the word list based on the argument
			currentWordlist = wordlist;

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
		public function translateWord(fromLang:Language, toLang:Language, category:Category, word:String):String
		{
			//Resets the word parameter to its lowercase version, allowing a degree of freedom with the input
			word = word.toLowerCase();

			//Saves the indexes of the three arrays in which the larget word is found.
			var index1:uint = 0;
			var index2:uint = 0;
			var index3:uint = 0;

			//Runs through all of the arrays looking for the matching category, difficulty and word.
			for (var i:uint = 0; i < fromLang.allCategories.length; i++)
			{
				//Goes through every category
				for (var j:uint = 0; j < fromLang.allCategories[i].allDifficulties.length; j++)
				{
					//And goes through each difficulty
					for (var k:uint = 0; k < fromLang.allCategories[i].allDifficulties[j].length; k++)
					{
						//And goes through each word
						if (fromLang.allCategories[i].allDifficulties[j][k] == word)
						{
							//When the word has been found, its address is saved in the three previously defined variables
							index1 = i;
							index2 = j;
							index3 = k;
						}
					}
				}
			}
			
			var translatedWord:String = toLang.allCategories[index1].allDifficulties[index2][index3];

			//Returns the corresponding word from the list of words in the TO language
			if (translatedWord == null){
				trace("We couldn't find a translation for " + word);
			}
			return (translatedWord);
		}
		
		
	}
}