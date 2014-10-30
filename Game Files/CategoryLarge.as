package 
{

	public class CategoryLarge extends Category
	{

		//There are so many words, they are best listed by difficulty
		public var easyList:Array = new Array();
		public var mediumList:Array = new Array();
		public var hardList:Array = new Array();

		public var num:uint = 3;

		public function CategoryLarge(categoryName:String):void
		{
			super(categoryName);
		}

		override public function getListByName(aName:String):Array
		{
			aName = aName.toLowerCase();
			switch (aName)
			{
				case "easylist" :
					return (easyList);
					break;
				case "mediumlist" :
					return (mediumList);
					break;
				case "hardlist" :
					return (hardList);
					break;
				case "allwords" :
					return (everyWord);
					break;
				default :
					return (easyList);
			}
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
				if (allWords[i].toLowerCase() == "easylist" || allWords[i].toLowerCase() == "mediumlist" || allWords[i].toLowerCase() == "hardlist")
				{
					//Set the chosen list to the list specified in that cell
					chosenList = getListByName(allWords[i]);
				}
				else
				{
					//Add the word to the last specified list
					chosenList.push(allWords[i]);
					everyWord.push(allWords[i]);
				}
			}
		}
	}
}