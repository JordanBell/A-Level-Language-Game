package  {
	
	public class CategorySmall extends Category
	{
		
		public var hiThere:WordList = new WordList("wordList");

		allLists.push(hiThere);
		
		public function CategorySmall(categoryName:String) {
			super(categoryName);
		}
		
		override public function setWordsTo(allWords:WordList)
		{		
			//Resets all of the arrays, in order for them to be written to
			hiThere.splice(0, hiThere.length);
			hiThere = allWords;
		}
	}
}
