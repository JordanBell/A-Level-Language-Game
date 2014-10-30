package  {
	
	public class LanguageGameHandler {
		
		//Available games
		public var FlashCards:Game = new Game("FlashCards");
		public var Choices:Game = new Game("Choices");
		public var Countries:Game = new Game("Countries");
		public var SentenceFiller:Game = new Game("Sentence Filler");
		public var currentGame:Game = FlashCards;
		
		//Language instantiation
		public var English:Language = new Language("English");
		public var Spanish:Language = new Language("Spanish");
		public var French:Language = new Language("French");
		public var Italian:Language = new Language("Italian");
		public var German:Language = new Language("German");
		public var Russian:Language = new Language("Russian");
		public var Arabic:Language = new Language("Arabic");
		public var Chinese:Language = new Language("Chinese");
		public var Japanese:Language = new Language("Japanese");
		
		public var inputLanguage:Language;
		public var outputLanguage:Language;
		public var inputCategory:String;
		public var inputDifficulty:String;
		
		public var wordSetArray:Array = new Array();
		
		public function LanguageGameHandler() {
			////////////////////////////////////////////////////Language word database\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

			//English nouns
			wordSetArray.push(	"Easy Words:", "dog", "cat", "man", "woman", "girl", "boy", "car", "house", "food", "me", 
								"Medium Words:", "animal", "person", "sir", "madam", "river", "breakfast", "lunch", "dinner", "road", "street", 
								"Hard Words:", "limousine", "elevator", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "sidewalk");
			English.commonNouns.setWordsTo(wordSetArray);
			
			//Spanish nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"Easy Words:", "perro", "gato", "hombre", "mujer", "hermoso", "joven", "carros", "casa", "comida", "me",
								"Medium Words:", "animal", "persona", "señor", "señora", "rio", "desayuno", "almuerzo", "comida", "carretera", "calle",
								"Hard Words:", "limusina", "ascensor", "apartamento", "tienda de abarrotes", "aire del puerto", "estación de tren", "restaurante", "edificio", "tráfico", "vereda");
			Spanish.commonNouns.setWordsTo(wordSetArray);
			
			///////////////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		}
		
		public function langSetter(inLang:String, outLang:String):void{
			if ((inLang == "English") && (outLang == "Spanish")){
				inputLanguage = English;
				outputLanguage = Spanish;
			}else if ((inLang == "Spanish") && (outLang == "English")){
				inputLanguage = Spanish;
				outputLanguage = English;
			}
		}
		
		public function submitAnswer(inputText:String):String{
			trace(currentGame.translateWord(inputLanguage, outputLanguage, inputText));
			return(currentGame.translateWord(inputLanguage, outputLanguage, inputText));
		}

	}
	
}
