package  {
	
	public class Category{

		public var name:String;
		
		//Word lists based on difficulty - these will change depending on the language
		public var easyList:Array = new Array();
		public var mediumList:Array = new Array();
		public var hardList:Array = new Array();
		
		public var allDifficulties:Array = new Array(easyList, mediumList, hardList);
		
		//The ghostlist variable acts as an editable copy of the array of a given difficulty
		public var ghostArray:Array = new Array();

		public function Category(categoryName:String) {
			name = categoryName;
		}
		
		public function getDifficultyListByName(aName:String):Array{
			//Returns a word list based on its string value
			switch (aName){
			case "easyList":
				return(easyList);
				break;
			case "mediumList":
				return(mediumList);
				break;
			case "hardList":
				return(hardList);
				break;
			default:
				return(easyList);
			}
		}
		
		public function setWordsTo(allWords:Array){
			easyList.splice(0, easyList.length);
			mediumList.splice(0, mediumList.length);
			hardList.splice(0, hardList.length);
			var chosenList:String = "easyList";
			
			for (var i:uint = 0; i < allWords.length; i++){
				//The first switch statement checks to see if the current word is a Difficulty Designator, which sets the difficulty to which succeeding words will be assigned.
				switch (allWords[i].toLowerCase()){
				case "easy words:":
					chosenList = "easyList";
					break;
				case "medium words:":
					chosenList = "mediumList";
					break;
				case "hard words:":
					chosenList = "hardList";
					break;
				default:
					//The default case is triggered normal words, and adds them to the designated list, depending on the value
					switch (chosenList){
					case "easyList":
						easyList.push(allWords[i]);
						break;
					case "mediumList":
						mediumList.push(allWords[i]);
						break;
					case "hardList":
						hardList.push(allWords[i]);
						break;
					default:
						trace("ERROR: Something weird has happened in the setWordsTo method, under the Category class.");
					}
				}
			}
		}
		
		public function getWordsPerDifficulty(diff:String):Array{
			switch (diff.toLowerCase()){
				case "easy":
					return (easyList);
					break;
				case "medium":
					return (mediumList);
					break;
				case "hard":
					return (hardList);
					break;
				default:
					trace("ERROR: The difficulty was not recognised in the getWordsPerDifficulty method, under the Category class.");
					return (ghostArray);
			}
		}
		
		public function getRandomWords(quantity:int, difficulty:String):Array{
			var outputList:Array = new Array();
			var ghostList:Array = new Array();
			
			var cell:Number;
			
			//The ghostlist variable acts as an editable copy of the array of a given difficulty
			ghostList = getWordsPerDifficulty(difficulty);
			
			//Loops, moving a word from the ghostList into the outputList in each repetition.
			for (var i:int = 0; (outputList.length == quantity || ghostList.length == 0); i++){
				cell = Math.random() * ghostList.length;
				cell = Math.floor(cell);
				outputList.push(ghostList[cell]);
				ghostList.splice(cell, 1);
			}
			
			//Now the outputList is fully compiled, and can be returned
			return(outputList);
		}

	}
	
}
