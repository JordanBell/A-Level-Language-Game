package 
{

	public class Language extends Object
	{
		//Basics
		public var name:String;

		//Word categories
		public var commonVerbs:CategoryLarge = new CategoryLarge("commonVerbs");
		public var commonNouns:CategoryLarge = new CategoryLarge("commonNouns");
		public var commonAdjectives:CategoryLarge = new CategoryLarge("commonAdjectives");
		public var numbers:CategoryLarge = new CategoryLarge("numbers");
		public var travel:CategoryLarge = new CategoryLarge("travel");

		public var family:CategoryMedium = new CategoryMedium("family");
		public var phrases:CategoryMedium = new CategoryMedium("phrases");
		public var activities:CategoryMedium = new CategoryMedium("activities");

		public var pronouns:CategorySmall = new CategorySmall("pronouns");
		public var colours:CategorySmall = new CategorySmall("colours");
		public var countries:CategorySmall = new CategorySmall("countries");

		public var allCategories:Array = new Array(commonNouns,commonVerbs,commonAdjectives,numbers,travel,family,phrases,activities,pronouns,colours,countries);


		public function Language(langName:String)
		{
			name = langName;
		}

		public function getCategoryByName(aName:String):Category
		{
			//Returns a Category based on a corresponding string value
			var returnCategory:Category;
			//Searches every category in the language
			for (var i:uint = 0; i < allCategories.length; i++)
			{
				//Saves the category whose name matches the argument
				if (allCategories[i].name == aName)
				{
					returnCategory = allCategories[i];
				}
			}

			//If a category was found, it is returned
			if (returnCategory != null)
			{
				return (returnCategory);
			}
			else
			{
				//Otherwise, an error message goes up and a placeholder category is returned.
				trace("No category was found from the name: " + aName);
				return (commonVerbs);
			}
		}
	}
}