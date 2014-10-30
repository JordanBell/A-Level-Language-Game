package 
{

	public class CategorySmall extends Category
	{
		public var wordList:Array = new Array();

		public function CategorySmall(categoryName:String)
		{
			super(categoryName);
		}

		override public function getListByName(aName:String):Array
		{
			return (wordList);
		}

		override public function setWordsTo(allWords:Array):void
		{
			//Resets all of the arrays, in order for them to be written to
			wordList.splice(0, wordList.length);
			wordList = allWords;
		}
	}
}