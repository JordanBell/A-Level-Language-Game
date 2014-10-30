package  {
	
	public class Language extends Object{
		//Basic
		public var name:String;
		
		//Categories - these will be the same for every instance
		public var commonVerbs:Category = new Category("commonVerbs");
		public var commonNouns:Category = new Category("commonNouns");
		public var commonAdjectives:Category = new Category("commonAdjectives");
		public var pronouns:Category = new Category("pronouns");
		public var numbers:Category = new Category("numbers");
		public var colours:Category = new Category("colours");
		public var family:Category = new Category("family");
		public var travel:Category = new Category("travel");
		public var greetingsFarewells:Category = new Category("greetingsFarewells");
		public var activities:Category = new Category("activities");
		public var countries:Category = new Category("countries");
		
		public var allCategories:Array = new Array(commonVerbs, commonNouns, commonAdjectives, numbers, pronouns, colours, family, travel, greetingsFarewells, activities, countries)


		public function Language(langName:String) {
			name = langName
		}
		
		public function getCategoryByName(aName:String):Category{
			//Returns a Category based on its Name property
			var returnCategory:Category;
			for (var i:uint = 0; i < allCategories.length; i++){
				if (allCategories[i].name == aName){
					returnCategory = allCategories[i];
				}
			}
			if (returnCategory != null){
				return(returnCategory);
			}else{
				return(commonVerbs);
			}
		}
	}
	
}
