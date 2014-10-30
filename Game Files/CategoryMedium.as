package  
{
	
	public class CategoryMedium extends Category{
		
		public var firstList:WordList = new WordList("firstList");
		public var secondList:WordList = new WordList("secondList");

		allLists.push(firstList, secondList);

		public function CategoryMedium(categoryName:String) {
			super(categoryName);
		}
		
		override public function setWordsTo(allWords:Array)
		{
			//Resets all of the arrays, in order for them to be written to
			firstList.splice(0, firstList.length);
			secondList.splice(0, secondList.length);
			
			//The chosenList is the array which holds the value of the returned array
			var chosenList:WordList = firstList;

			//The following For statement is necessary, as there is more than one word list.
			for (var i:uint = 0; i < allWords.length; i++)
			{
				//If the word is the name of one of the lists:
				if (allWords[i].name=="firstList" || allWords[i].name=="secondList")
				{
					//Set the chosen list to the list specified in that cell
					chosenList = allWords[i];
				}
				else
				{
					//Add the word to the last specified list
					chosenList.push(allWords[i])
				}
			}
		}
	}
}
