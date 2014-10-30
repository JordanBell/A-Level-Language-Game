package  {
	
	public class CategoryLarge extends Category{

		//There are so many words, they are best listed by difficulty
		public var easyList:Array = new Array();
		public var mediumList:Array = new Array();
		public var hardList:Array = new Array();

		public function CategoryLarge(categoryName:String) {
			super(categoryName);
		}
		
		override public function getListByName(aName:String):Array
		{
			aName = aName.toLowerCase();
			switch (aName)
			{
				case "easyList":
					return(easyList);
					break
				case "mediumList":
					return(mediumList);
					break
				case "hardList":
					return(hardList);
					break
				default:
					return(easyList);
			}
			
			return(returnList);
		}
		
		override public function setWordsTo(allWords:Array):void
		{
			//Resets all of the arrays, in order for them to be written to
			easyList.splice(0, easyList.length);
			mediumList.splice(0, mediumList.length);
			hardList.splice(0, hardList.length);
			
			//The chosenList is the array which holds the value of the returned array
			var chosenList:Array = easyList;

			//The following For statement is necessary, as there is more than one word list.
			for (var i:uint = 0; i < allWords.length; i++)
			{
				//If the word is the name of one of the lists:
				if (allWords[i].toLowerCase()=="easyList" || allWords[i].toLowerCase()=="mediumList" || allWords[i].toLowerCase()=="hardList")
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
