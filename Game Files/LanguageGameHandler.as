package 
{

	public class LanguageGameHandler
	{

		//Available games
		public var FlashCards:Game = new Game("FlashCards");
		public var Choices:Game = new Game("Choices");
		public var Countries:Game = new Game("Countries");
		public var SentenceFiller:Game = new Game("SentenceFiller");
		public var currentGame:Game = FlashCards;

		public var expectedAnswer:String;
		public var inputLanguage:Language;
		public var outputLanguage:Language;

		//Language instantiation
		public var English:Language = new Language("English");
		public var Spanish:Language = new Language("Spanish");
		public var French:Language = new Language("French");
		public var Italian:Language = new Language("Italian");
		public var German:Language = new Language("German");
		public var Russian:Language = new Language("Russian");
		public var Arabic:Language = new Language("Arabic");
		public var Hindi:Language = new Language("Hindi");
		public var Chinese:Language = new Language("Chinese");
		public var Japanese:Language = new Language("Japanese");

		public var allLanguages:Array = new Array(English,Spanish,French,Italian,German,Russian,Arabic,Hindi,Chinese,Japanese);

		public var wordSetArray:Array = new Array();


		public function LanguageGameHandler()
		{
			////////////////////////////////////////////////////Language word database\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

			//English nouns
			wordSetArray.push(	"Easy Words:", "dog", "cat", "man", "woman", "girl", "boy", "car", "house", "food", "me", 
								"Medium Words:", "animal", "person", "sir", "madam", "river", "breakfast", "lunch", "dinner", "road", "street", 
								"Hard Words:", "limousine", "elevator", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "sidewalk");
			English.commonNouns.setWordsTo(wordSetArray);

			//Spanish nouns;
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"Easy Words:", "perro", "gato", "hombre", "mujer", "chica", "chico", "coche", "casa", "comida", "mi",
								"Medium Words:", "animal", "persona", "señor", "señora", "rio", "desayuno", "almuerzo", "cena", "carretera", "calle",
								"Hard Words:", "limusina", "ascensor", "apartamento", "tienda de abarrotes", "aire del puerto", "estación de tren", "restaurante", "edificio", "tráfico", "vereda");
			Spanish.commonNouns.setWordsTo(wordSetArray);
		}

		//Used to set the output language, and the input language.
		public function setLanguage(inLang:Language, outLang:Language):void
		{
			inputLanguage = inLang;
			outputLanguage = outLang;
		}

		public function submitAnswer(gameType:Game, inputText:String):Boolean
		{
			inputText = inputText.toLowerCase();
			
			switch (gameType.name)
			{
				//Each gametype has its own way of submitting answers. I reckon this is a good alternative to using Polymorphism, which frankly I haven't figured out yet.
				case "FlashCards" :
					//The expected answer is the English version of the current word (which is currently in a foreign language, depending on the outputLanguage)
					expectedAnswer = currentGame.translateWord(outputLanguage,inputLanguage,currentGame.currentWord);
					if (inputText == expectedAnswer)
					{
						//If it's correct, increase the count of correct answers
						currentGame.score.numCorrect++;
					}
					else
					{
						//Otherwise, increase the count of incorrect answers
						currentGame.score.numIncorrect++;
					}
					//And finally, go to the next round.
					currentGame.nextRound();
					return (inputText == expectedAnswer);
					break;
				case "Choices" :
					return (true);
					break;
				case "Countries" :
					return (true);
					break;
				case "SentenceFiller" :
					return (true);
					break;
				default :
					trace("ERROR: Game type name not recognised in the method SubmitAnswer under the LanguageGameHandler class.");
					return (true);
			}
		}
	}
}