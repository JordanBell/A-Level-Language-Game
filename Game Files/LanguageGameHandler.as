package 
{
	import flash.net.SharedObject;

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
		public var Portuguese:Language = new Language("Portuguese");
		public var Turkish:Language = new Language("Turkish");
		public var Finnish:Language = new Language("Finnish");
		public var Dutch:Language = new Language("Dutch");
		public var Japanese:Language = new Language("Japanese");

		public var allLanguages:Array = new Array(English,Spanish,French,Italian,German,Turkish,Finnish,Portuguese,Dutch,Japanese);

		public var wordSetArray:Array = new Array();


		//Word Database
		public function LanguageGameHandler()
		{
			////////////////////////////////////////////////////////////////////ENGLISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", "food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", "tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", "bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", "waiter", "hotel", "English",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", "restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", "turkish", "finnish", "dutch", "japanese");
			English.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", "phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", "stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			English.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			English.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			English.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", "train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", "money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "direction", "address", "coffee", "tourist");
			English.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			English.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", "I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", "thank you", "you're welcome");
			English.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", "relaxing", "sight seeing");
			English.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you (plural)", "it");
			English.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			English.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", "germany", "russia", "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			English.countries.setWordsTo(wordSetArray);

			////////////////////////////////////////////////////////////////////SPANISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			//Nouns
			wordSetArray.push(	"easyList", "perro", "gato", "hombre", "mujer", "hermoso", "joven", "coche", "café", "playa", "casa", "comida", "drink "," me "," niño "," ave "," libro "," mesa "," silla "," teléfono "," tienda "," bed "," día "," tazas "," turista ",
								"mediumList", "animal", "persona", "camarero", "señor", "dinero", "señora", "plan", "barco", "tren", "bus", "rio", "desayuno "," almuerzo "," comida "," carretera "," postre "," desierto "," cuarto de baño "," nombre "," camarero "," hotel "," Inglés ",
								"hardList", "ascensor", "apartamento", "supermercado", "Taxi", "puerto de aire", "Estación de tren", "restaurant", "edificio", "tráfico", "españoles", "alemán" , "italian", "francés", "portugués", "turco", "finlandia", "dutch", "japanese");
			Spanish.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "ayuda", "ir", "hablar", "ver", "get", "correr", "paseo", "escuchar", "leer", "comprar", "vender", "teléfono ",
								"mediumList", "texto", "llevar", "lector", "esperar", "hablar", "nadar", "aprender", "espera", "dar", "siéntate", "de pie",
								"hardList", "pronunciar", "elegir", "saber", "construir", "trabajo", "olor", "viajar", "esperar", "sentir");
			Spanish.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "bueno", "malo", "bonito", "feo", "grande", "pequeño", "feliz", "triste", "cold", "hot",
								"mediumList", "cansado", "alto", "corto", "elegante", "tonto", "enojado", "fuerte", "tranquilo", "rápido", "lento",
								"hardList", "brillante", "oscuridad", "clear", "confuso", "molesto", "grosero", "educado", "caro", "barato");
			Spanish.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Spanish.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "casa", "me", "comprar", "ir", "teléfono", "tienda", "coche", "lector", "paseo", "correr", "ciclo", "tren "," bus "," hablar "," comer "," beber "," hotel ",
								"mediumList", "señor", "señora", "desayuno", "almuerzo", "comida", "carretera", "viajar", "pedir prestado", "Taxi", "dinero", "hola", "barco "," avión "," playa ",
								"hardList", "apartamento", "supermercado", "puerto de aire", "Estación de tren", "restaurant", "edificio", "tráfico", "dirección", "dirección", "café", "turista");
			Spanish.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "padre", "madre", "hermano", "hermana", "hijo", "hija",
								"secondList", "tío", "tía", "abuelo", "abuela", "primo", "sobrino", "sobrina");
			Spanish.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hola", "buenos días", "buenas tardes", "buenas tardes", "buenas noches", "adiós", "No entiendo", "mi nombre es-",
								"secondList", "cuánto es-", "hacer hablar-", "¿dónde está-", "cuánto es-", "perdón", "gracias", "de nada");
			Spanish.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "deporte", "tenis", "baloncesto", "hockey", "golf", "grillo", "pelota", "rugby", "badminton", "calabaza",
								"secondList", "compras", "paseo", "piscina", "leer", "montar a caballo", "música", "tomar el sol", "relax", "turismo");
			Spanish.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "él", "ella", "ellos", "nos", "ellos", "usted", "ustedes", "ella");
			Spanish.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rojo", "naranja", "amarillo", "azul", "morado", "negro", "rojo", "verde", "rosa", "gris", "blanco");
			Spanish.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("América", "Canadá", "inglaterra", "australia", "francia", "España", "México", "brasil", "alemania", "rusia", "Suecia", "china", "japon", "indias", "holanda", "egipto", "italia", "pavo");
			Spanish.countries.setWordsTo(wordSetArray);
			////////////////////////////////////////////////////////////////////FRENCH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", "food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", "tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", "bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", "waiter", "hotel", "English",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", "restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", "turkish", "finnish", "dutch", "japanese");
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", "phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", "stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", "train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", "money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "direction", "address", "coffee", "tourist");
			French.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			French.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", "I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", "thank you", "you're welcome");
			French.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", "relaxing", "sight seeing");
			French.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you (plural)", "it");
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			French.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", "germany", "russia", "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			French.countries.setWordsTo(wordSetArray);
			////////////////////////////////////////////////////////////////////ITALIAN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", "food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", "tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", "bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", "waiter", "hotel", "English",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", "restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", "turkish", "finnish", "dutch", "japanese");
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", "phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", "stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", "train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", "money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "direction", "address", "coffee", "tourist");
			Italian.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			Italian.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", "I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", "thank you", "you're welcome");
			Italian.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", "relaxing", "sight seeing");
			Italian.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you (plural)", "it");
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			Italian.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", "germany", "russia", "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			Italian.countries.setWordsTo(wordSetArray);
			////////////////////////////////////////////////////////////////////GERMAN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", "food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", "tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", "bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", "waiter", "hotel", "English",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", "restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", "turkish", "finnish", "dutch", "japanese");
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", "phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", "stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", "train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", "money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "direction", "address", "coffee", "tourist");
			German.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			German.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", "I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", "thank you", "you're welcome");
			German.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", "relaxing", "sight seeing");
			German.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you (plural)", "it");
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			German.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", "germany", "russia", "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			German.countries.setWordsTo(wordSetArray);
			////////////////////////////////////////////////////////////////////JAPANESE\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", "food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", "tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", "bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", "waiter", "hotel", "English",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", "restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", "turkish", "finnish", "dutch", "japanese");
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", "phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", "stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", "train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", "money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "direction", "address", "coffee", "tourist");
			Japanese.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			Japanese.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", "I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", "thank you", "you're welcome");
			Japanese.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", "relaxing", "sight seeing");
			Japanese.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you (plural)", "it");
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			Japanese.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", "germany", "russia", "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			Japanese.countries.setWordsTo(wordSetArray);
			
			////////////////////////////////////////////////////////////////////FINNISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", "food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", "tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", "bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", "waiter", "hotel", "English",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", "restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", "turkish", "finnish", "dutch", "japanese");
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", "phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", "stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", "train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", "money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "direction", "address", "coffee", "tourist");
			Finnish.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			Finnish.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", "I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", "thank you", "you're welcome");
			Finnish.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", "relaxing", "sight seeing");
			Finnish.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you (plural)", "it");
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			Finnish.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", "germany", "russia", "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			Finnish.countries.setWordsTo(wordSetArray);
			////////////////////////////////////////////////////////////////////TURKISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", "food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", "tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", "bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", "waiter", "hotel", "English",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", "restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", "turkish", "finnish", "dutch", "japanese");
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", "phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", "stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", "train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", "money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "direction", "address", "coffee", "tourist");
			Turkish.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			Turkish.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", "I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", "thank you", "you're welcome");
			Turkish.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", "relaxing", "sight seeing");
			Turkish.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you (plural)", "it");
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			Turkish.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", "germany", "russia", "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			Turkish.countries.setWordsTo(wordSetArray);
			////////////////////////////////////////////////////////////////////DUTCH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", "food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", "tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", "bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", "waiter", "hotel", "English",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", "restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", "turkish", "finnish", "dutch", "japanese");
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", "phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", "stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", "train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", "money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "direction", "address", "coffee", "tourist");
			Dutch.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			Dutch.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", "I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", "thank you", "you're welcome");
			Dutch.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", "relaxing", "sight seeing");
			Dutch.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you (plural)", "it");
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			Dutch.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", "germany", "russia", "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			Dutch.countries.setWordsTo(wordSetArray);
			////////////////////////////////////////////////////////////////////PORTUGUESE\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", "food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", "tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", "bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", "waiter", "hotel", "English",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", "restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", "turkish", "finnish", "dutch", "japanese");
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", "phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", "stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", "train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", "money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", "traffic", "direction", "address", "coffee", "tourist");
			Portuguese.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			Portuguese.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", "I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", "thank you", "you're welcome");
			Portuguese.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", "relaxing", "sight seeing");
			Portuguese.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you (plural)", "it");
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			Portuguese.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", "germany", "russia", "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			Portuguese.countries.setWordsTo(wordSetArray);
		}


		//Processes
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