package  
{
	
	public class CategoryMedium extends Category{
		
		public var firstList:Array = new Array();
		public var secondList:Array = new Array();

		public function CategoryMedium(categoryName:String) {
			super(categoryName);
		}
		
		override public function getListByName(aName:String):Array
		{
			aName = aName.toLowerCase();
			switch (aName)
			{
				case "set1":
					return(firstList);
					break
				case "set2":
					return(secondList);
					break
				default:
					return(firstList);
			}
			
			return(returnList);
		}
		
		override public function setWordsTo(allWords:Array):void
		{
			//Resets all of the arrays, in order for them to be written to
			firstList.splice(0, firstList.length);
			secondList.splice(0, secondList.length);
			
			//The chosenList is the array which holds the value of the returned array
			var chosenList:Array = firstList;

			//The following For statement is necessary, as there is more than one word list.
			for (var i:uint = 0; i < allWords.length; i++)
			{
				//If the word is the name of one of the lists:
				if (allWords[i].toLowerCase()=="firstList" || allWords[i].toLowerCase()=="secondList")
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
