package 
{

	public class CategorySmall extends Category
	{
		public var wordList:Array = new Array();

		public var num:uint = 1;

		public function CategorySmall(categoryName:String):void
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
			for (var i:uint; i < allWords.length; i++)
			{
				wordList.push(allWords[i]);
			}
		}
	}
}