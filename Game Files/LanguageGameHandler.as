﻿package 
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
			English.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", "cheap");
			English.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
								"mediumList", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", "one hundred", 
								"hardList", "two hundred", "three hundred", "four hundred", "five hundred", "six hundred", "seven hundred", "eight hundred", "nine hundred", "one thousand", "ten thousand", "one hundred thousand", "one million");
			English.numbers.setWordsTo(wordSetArray);
			
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
			English.pronouns.setWordsTo(wordSetArray);
			
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
			wordSetArray.push(	"easyList", "perro", "gato", "hombre", "mujer", "hermoso", "joven", "coche", "café", "playa", "casa", "comida", "drink", "me", "niño", "ave", "libro", "mesa", "silla", "teléfono", "tienda", "cama", "día", "tazas", "turista",
								"mediumList", "animal", "persona", "camarero", "señor", "dinero", "señora", "plan", "barco", "tren", "autobús", "rio", "desayuno", "almuerzo", "cena", "carretera", "postre", "desierto","cuarto de baño","nombre","camarero","hotel","Inglés",
								"hardList", "ascensor", "apartamento", "supermercado", "Taxi", "puerto de aire", "Estación de tren", "restaurant", "edificio", "tráfico", "españoles", "alemán" , "italian", "francés", "portugués", "turco", "finlandia", "dutch", "japanese");
			Spanish.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "ayuda", "ir", "hablar", "ver", "get", "correr", "paseo", "escuchar", "leer", "comprar", "vender", "teléfono",
								"mediumList", "texto", "llevar", "lector", "esperar", "hablar", "nadar", "aprender", "espera", "dar", "siéntate", "de pie",
								"hardList", "pronunciar", "elegir", "saber", "construir", "trabajo", "olor", "viajar", "esperar", "sentir");
			Spanish.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "bueno", "malo", "bonito", "feo", "grande", "pequeño", "feliz", "triste", "cold", "hot",
								"mediumList", "cansado", "alto", "corto", "elegante", "tonto", "enojado", "fuerte", "tranquilo", "rápido", "lento",
								"hardList", "brillante", "oscuridad", "clear", "confuso", "molesto", "grosero", "educado", "caro", "barato");
			Spanish.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "cero", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve", "diez", 
							  	"mediumList", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa", "uno cien", 
							  	"hardList", "doscientos", "trescientos", "cuatrocientos", "quinientos", "seiscientos", "setecientos", "ochocientos", "novecientos", "mil", "diez mil", "ciento mil", "un millón");
			Spanish.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "casa", "me", "comprar", "ir", "teléfono", "tienda", "coche", "lector", "paseo", "correr", "ciclo", "tren", "autobús", "hablar", "comer", "beber", "hotel",
								"mediumList", "señor", "señora", "desayuno", "almuerzo", "cena", "carretera", "viajar", "pedir prestado", "taxi", "dinero", "hola", "barco", "avión", "playa",
								"hardList", "apartamento", "supermercado", "puerto de aire", "estación de tren", "restaurant", "edificio", "tráfico", "dirección", "dirección", "café", "turista");
			Spanish.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "padre", "madre", "hermano", "hermana", "hijo", "hija",
								"secondList", "tío", "tía", "abuelo", "abuela", "primo", "sobrino", "sobrina");
			Spanish.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hola", "buenos días", "buenas tardes", "buenas tardes", "buenas noches", "adiós", "no entiendo", "mi nombre es-",
								"secondList", "cuánto es-", "hacer hablar-", "¿dónde está-", "cuánto es-", "perdón", "gracias", "de nada");
			Spanish.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "deporte", "tenis", "baloncesto", "hockey", "golf", "grillo", "pelota", "rugby", "bádminton", "calabaza",
								"secondList", "compras", "paseo", "piscina", "leer", "montar a caballo", "música", "tomar el sol", "relajarse", "turismo");
			Spanish.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("yo", "él", "ella", "ellos", "nos", "ellos", "usted", "ustedes", "ella");
			Spanish.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rojo", "naranja", "amarillo", "azul", "morado", "negro", "rojo", "verde", "rosa", "gris", "blanco");
			Spanish.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("américa", "canadá", "inglaterra", "australia", "francia", "españa", "méxico", "brasil", "alemania", "rusia", "suecia", "china", "japon", "indias", "holanda", "egipto", "italia", "pavo");
			Spanish.countries.setWordsTo(wordSetArray);
			
			
			
			/*////////////////////////////////////////////////////////////////////FRENCH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.push(	"easyList", "chien", "chat", "homme", "femme", "fille", "enfant", "voiture", "chaud", "plage", "maison", "cuisine", "boisson "," moi "," enfant "," oiseau "," livre "," table "," chaise "," portable "," magasin "," lit "," jour "," vert "," touriste ",
								"mediumList", "animal", "personne", "serveur", "monsieur", "argent", "madame", "avion", "bateau", "train", "bus", "fleuve", "petit-déjeuner "," repas "," cuisine "," route "," dessert "," désert "," salle de bain "," nom "," serveur "," hôtel "," anglais ",
								"hardList", "ascenseur", "appartement", "épicerie", "taxi", "port d'air", "gare", "restaurant", "ciel", "trafic", "espagnol", "allemand" , "italie", "français", "portugais", "turque", "finlandais", "hollandais", "japonais");
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "aider", "go", "talk", "voir", "get", "courir", "marcher", "entendre", "lire", "acheter", "vendre", "téléphone",
								"mediumList", "texte", "prendre", "disque", "attendre", "parler", "nager", "apprendre", "sommeil", "donner", "assis", "debout",
								"hardList", "prononcer", "choisir", "savoir", "construire", "travail", "odeur", "voyage", "attendre", "sentir");
								
								
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "bon", "mauvais", "joli", "laid", "grand", "petit", "heureux", "triste", "froid", "chaud",
								"mediumList", "fatigué", "grand", "court", "portrait", "muet", "en colère", "loud", "calme", "rapide", "lent",
								"hardList", "lumineux", "noir", "clair", "confus", "ennuyeux", "rude", "poli", "cher", "pas cher");
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "maison", "moi", "acheter", "go", "portable", "magasin", "voiture", "voiture", "marche", "courir", "cycle", "train "," bus "," parler "," manger "," boisson "," hôtel ",
								"mediumList", "monsieur", "madame", "petit", "repas", "cuisine", "route", "voyage", "emprunter", "taxi", "argent", "bonjour", "bateau "," plan "," plage ",
								"hardList", "appartement", "épicerie", "port d'air", "gare", "restaurant", "ciel", "trafic", "direction", "adresse", "chaud", "touriste");
			French.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "père", "mère", "frère", "sœur", "fils", "fille",
								"secondList", "oncle", "tante", "grand-père", "grand-mère", "cousin", "neveu", "nièce");
			French.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "bonjour", "bonjour", "bon après-midi", "bonsoir", "bonne nuit", "au revoir", "je ne comprends pas", "mon nom est-",
								"secondList", "combien est-", "parlez-vous-", "où est-", "combien est-", "excusez-moi", "merci", "vous êtes les bienvenus");
			French.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"FIRSTLIST", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", "badminton", "courge",
								"secondList", "achats", "marche", "baignade", "lecture", "cheval", "musique", "bain de soleil", "relaxant", "voir de vue");
			French.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("Je", "il", "elle", "ils", "nous", "ils", "vous", "vous", "it");
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rouge", "orange", "rouge", "bleu", "jaune", "noir", "blanc", "vert", "rose", "gris", "brun");
			French.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america"​​, "canada", "angleterre", "australie", "France", "espagne", "mexique", "bresil", "allemagne", "russie", "suède", "chine", "japon "," inde "," hollandaise "," egypte "," italie "," turquie ");
			French.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////////////////////////////////ITALIAN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.push(	"EasyList", "cane", "gatto", "uomo", "donna", "ragazza", "ragazzo", "auto", "caffè", "spiaggia", "casa", "alimento", "bere "," me "," bambino "," bianco "," libro "," tavolo "," sedia "," telefono "," negozio "," letto "," giornata "," tazza "," turista ",
								"mediumList", "animale", "persona", "cameriere", "signore", "denaro", "signora", "piano", "barca", "treno", "autobus", "fiume", "colazione "," pranzo "," cena "," strada "," dessert "," desertico "," bagno "," nome "," cameriere "," albergo "," inglese ",
								"hardList", "ascensore", "appartamento", "negozio", "taxi", "aria porto", "stazione ferroviaria" "ristorante", "costruzione", "traffico", "spagnolo", "tedesco" , "italiano", "francese", "portuguese", "turco", "finlandese", "dutch", "giapponese");
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "aiuto", "andare", "parlare", "vedere", "get", "correre", "camminare", "ascoltare", "leggere", "acquistare", "vendere", "telefono ",
								"mediumList", "testo", "prendere", "guida", "aspettare", "parlare", "nuotare", "imparare", "sonno", "dare", "sedersi", "stare in piedi",
								"hardList", "pronunciare", "scegliere", "conoscere", "costruire", "lavoro", "odore", "viaggio", "aspettare", "sentire");
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "buono", "cattivo", "ragazza", "brutto", "grande", "piccolo", "felice", "triste", "freddo", "caldo",
								"mediumList", "stanco", "alto", "breve", "intelligente", "stupido", "arrabbiato", "forte", "tranquillo", "veloce", "lento",
								"hardList", "brillante", "scuro", "chiaro", "confuso", "fastidioso", "rude", "gentile", "costoso", "economico");
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "casa", "me", "compro", "andare", "telefono", "negozio", "auto", "auto", "camminata", "correre", "ciclo", "treno "," autobus "," parlare "," mangiare "," bere "," hotel ",
								"mediumList", "signore", "signora", "colazione", "pranzo", "cena", "strada", "viaggio", "prendere in prestito", "taxi", "denaro", "ciao", "barca "," piano "," spiaggia ",
								"hardList", "appartamento", "negozio", "aria porto", "stazione", "ristorante", "costruzione", "traffico", "direzione", "indirizzo", "caffè", "turista");
			Italian.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "padre", "madre", "fratello", "sorella", "son", "figlia",
								"secondList", "zio", "zia", "nonno", "nonna", "cugino", "nipote", "nipote");
			Italian.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "ciao", "buongiorno", "buon pomeriggio", "buonasera", "buona notte", "arrivederci", "non capisco", "il mio nome è-",
								"secondList", "quanto è-", "fai-Speak", "dove è-", "quanto è-", "mi scusi", "grazie", "sei il benvenuto");
			Italian.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "pallacanestro", "hockey", "golf", "grillo", "baseball", "rugby", "volano", "spremuta",
								"secondList", "shopping", "camminare", "nuotare", "lettura", "cavallo", "musica", "prendere il sole", "rilassante", "giri turistici");
			Italian.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "lui", "lei", "loro", "noi", "loro", "tu", "voi", "it");
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rosso", "giallo", "verde", "blu", "viola", "nero", "bianco", "verde", "rosa", "grigio", "marrone");
			Italian.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "Canada", "inghilterra", "australia", "francia", "spagna", "messico", "brasile", "germania", "russia", "svezia", "cina", "giappone "," india "," olanda "," egitto "," Italia "," tacchino ");
			Italian.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////////////////////////////////GERMAN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.push(	"EasyList", "dog", "cat", "mann", "Frau", "frau", "boy", "auto", "coffee", "beach", "haus", "essen", "trinken "," mir "," kind "," Vogel "," buch "," tisch "," Stuhl "," phone "," shop "," bett "," Tag "," tee "," tourist ",
								"mediumList", "animal", "person", "Kellner", "Sir", "geld", "Madame", "plane", "boot", "trainieren", "bus", "river", "Frühstück "," lunch "," essen "," Straße "," essen "," Wüste "," bathroom "," name "," Kellner "," hotel "," Englisch ",
								"hardList", "elevator", "apartment", "Supermarkt", "taxi", "Luft-Port", "train station", "restaurant", "entwerfen", "Verkehr", "spanisch", "Deutsch" , "italienisch", "französisch", "portugiesisch", "türkisch", "finnisch", "holland", "japanisch");
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "hilfe", "gehen", "talk", "sehen", "get", "laufen", "laufen", "hören", "lesen", "kaufen", "verkaufen", "phone "
								"mediumList", "text", "nehmen", "fahren", "warten", "sprechen", "schwimmen", "lernen", "schlafen", "geben", "sitzen", "stehen",
								"hardList", "sprechen", "entscheiden", "wissen", "bauen", "Arbeit", "Geruch", "reisen", "warten", "fühlen");
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "gut", "schlecht", "schön", "hässlich", "big", "klein", "glücklich", "traurig", "kalt", "hot",
								"mediumList", "müde", "hoch", "kurz", "pfiffig", "dumm", "aufgebracht", "laut", "ruhig", "schnell", "langsam",
								"hardList", "hell", "dunkel", "klar", "verwirrt", "ärgerlich", "rude", "höflich", "teuer", "billig");
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "haus", "mir", "kaufen", "gehen", "phone", "shop", "auto", "fahren", "gehen", "laufen", "cycle", "train "," bus "," sprechen "," essen "," trinken "," hotel ",
								"mediumList", "Sir", "Madame", "Frühstück", "Mittagessen", "Abendessen", "reisen", "reisen", "borgen", "taxi", "geld", "hallo", "boot "," plane "," beach ",
								"hardList", "apartment", "Supermarkt", "Luft-Port", "train station", "restaurant", "entwerfen", "Verkehr", "Richtung", "Adresse", "coffee", "tourist");
			German.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "Vater", "Mutter", "Bruder", "sister", "sohn", "Tochter",
								"secondList", "Onkel", "Tante", "Großvater", "Großmutter", "Cousin", "Neffe", "Nichte");
			German.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "Hallo", "Guten Morgen", "Guten Tag", "Guten Abend", "Gute Nacht", "Auf Wiedersehen", "Ich verstehe nicht", "mein Name ist-",
								"secondList", "wie viel-", "Do You Speak-", "wo ist-", "wie viel ist-", "excuse me", "danke", "Du bist willkommen");
			German.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "ball", "tennis", "basketball", "hockey", "golf", "Cricket", "baseball", "Rugby", "badminton", "squash",
								"secondList", "shopping", "Fuß", "schwimmen", "Lesen", "reiten", "musik", "sonnen", "entspannt", "sight seeing");
			German.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "er", "sie", "sie", "uns", "sie", "du", "Sie (Plural)", "es");
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rot", "orange", "gelb", "blau", "lila", "black", "white", "green", "pink", "grau", "braun");
			German.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("amerika", "canada", "england", "australien", "frankreich", "Spanien", "mexico", "brasilien", "Deutschland", "russisch", "schweden", "china", "japan "," indien "," holland "," Ägypten "," italien "," turkey ");
			German.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////////////////////////////////JAPANESE\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			
			//Nouns
			wordSetArray.push(	"EasyList", "inu", "neko", "dansei", "josei", "on'nanoko", "otokonoko" , "-sha", " kōhī", "bīchi", "jūtaku", "shokuhin", "inryō ", "watashi", "kodomo", "tori" , "hon" , "tēburu" , "isu" , "denwa" , "shoppu", "beddo", "-bi" , "cha","kankō" , 
							  	"MediumList" , "dōbutsu" , "hito" , "u~eitā" , "sā" , "okane" , "madamu", "hikōki" , "bōto" , "densha" , "basu" , "kawa", "chōshoku ","chūshoku","yūshoku","dōro","dezāto","sabaku","yokushitsu","namae","ueitā","hoteru" , "eigo" , 
							  	"HardList", "erebētā", "manshon","shokuryōhin-ten","takushī","eāpōto","-eki","resutoran","tatemono","torafikku","supeingo","doitsugo","itaria-go","furansugo","porutogaru-go","nihongo" , "oranda", "finrando", "toruko");
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "uru" , "kau" , "geitaidenwa o yomu" , "kiku", "aruku", "jikkō", "shutoku", "miru" , "tōku", "iku" , "herupu",
							  	"MediumList" , "tekisuto" , "tatsu", "suwaru", "ataeru", "manabu", "oyogu", "hanasu", "suimin", "matsu", "doraibu o toru", 
							 	"HardList", " kōchiku" , " shitte iru" , " sentaku" , " shigoto", " kaori" , " ryokō", " taiki" o" hatsuon" , " kanjiru");
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList" , " yoi" , " warui" , " atsui", " samui", " kanashī", " ureshī", " ko" , " dai" , " minikui" , " kirei" , 
							  	"MediumList", " osoi" , " hayai" , " shizuka", " sōzōshī", " ikari" , " dumb" wa, " sumāto" , " shōto" , " senotakai", " tsukareta" 
							  	"HardList" , " yasui" , " kōka", " reigi tadashī", " shitsurei", " urusai", " konran" , " kuria" , " kurai" , " akarui");
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	" EasyList" , "-ka" , " watashi" wa, " iku" , " denwa" , " shoppu" , "-sha", " doraibu", " sanpo", " jikkō", " saikuru", " ressha o" kau" " , " Basu" , " hanasu" , " taberu" , " nomu" , " hoteru" , 
							  	" MediumList", " sensei", " madamu", " chōshoku" , " chūshoku", " yūshoku", " dōro" , " ryokō" , " kariru", " takushī" , " okane" , " kon'nichiwa" , " bōto "," Hikōki"," bīchi" , 
								" HardList", " manshon", " shokuryōhin-ten", " eāpōto", "-eki", " resutoran", " tatemono", " torafikku", " hōkō", " adoresu", " kōhī", " kankōkyaku");
			Japanese.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	" FirstList" , " chichi" , " haha" , " otōto", " imōto" , " musuko" , " musume" , 
							  	" SecondList", " oji" " oba", " sofu" " sobo", " itoko", " oi" " mei");
			Japanese.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	" FirstList", " kon'nichiwa", " ohayō", " kon'nichiwa", " konbanwa", " oyasumi" wa, " sayonara" , " watashinonamaeha - ", " watashi wa rikai shite inai" , 
							  	" SecondList", " - wa dono kurai", " hanasu - anata wa nan" " doko ni aru - ", " ikuradesu ka - ", " dōitashimashite", " arigatō" , " sumimasen");
			Japanese.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	" FirstList", " sakkā", " tenisu", " basukettobōru", " hokkē", " gorufu", " kuriketto", " yakyū", " ragubī", " badominton", " sukasshu" , 
							  	" SecondList", " kaimono", " u~ōkingu", " suiei", " dokusho", " shiryoku ga mite", " rirakkusu", " nikkōyoku", " ongaku" " jōba");
			Japanese.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(" Watashi" , " kare" , " kanojo", " karera", " watashitachi" wa, " karera", " anata" , " anatatachi" , " sore");
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(" Aka" , " orenji" , " ki" , " buraun" , " gurē" , " pinku" , " midori" , " shiro" , " kuro" , " murasaki" , " ao");
			Japanese.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(" Amerika", " Kanada", " Igirisu", " ōsutoraria", " Furansu", " Supein", " Mekishiko", " Burajiru", " Doitsu", " Roshia", " suu~ēden", " Chūgoku", " Nihon "," Indo"," Oranda"," Ejiputo"," Itaria"," shichimenchō");
			Japanese.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////////////////////////////////FINNISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.push(	"easyList", "koira", "kissa", "mies", "nainen", "tyttö", "poika", "auto", "kahvi", "beach", "talo", "ruoka", "juoma "," me "," lapsi "," lintu "," kirja "," taulukko "," tuoli "," puhelin "," kauppa "," sänky "," päivä "," tee "," turisti ",
								"mediumList", "eläin", "henkilö", "tarjoilija", "herra", "rahaa", "rouva", "taso", "vene", "juna", "bus", "river", "breakfast "," lounas "," illallinen "," tie "," jälkiruoka "," Desert "," kylpyhuone "," name "," tarjoilija "," hotelli "," Englanti ",
								"hardList", "hissi", "apartment", "ruokakauppaan", "taksi", "air port", "juna-asema", "ravintola", "rakennus", "liikenne", "espanja", "german" "Italian", "ranskalainen", "Portugali", "turkki", "suomalainen", "dutch", "japanilainen");
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "Talk", "nähdä", "saada", "ajaa", "kävellä", "kuulla", "lukea", "osta", "myy", "puhelin "
								"mediumList", "text", "ottaa", "ajaa", "odottaa", "puhuvat", "uida", "oppia", "uni", "anna", "istu", "seiso",
								"hardList", "ääntää", "valita", "tietää", "rakentaa", "työ", "haistaa", "matka", "odottaa", "tuntuu");
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "hyvä", "huono", "pretty", "ruma", "iso", "pieni", "onnellinen", "surullinen", "kylmää", "kuuma",
								"mediumList", "väsynyt", "pitkä", "lyhyt", "älykäs", "tyhmä", "vihainen", "voimakas", "hiljaa", "nopea", "hidas",
								"hardList", "kirkas", "pimeä", "kirkas", "sekava", "ärsyttävä", "rude", "kohtelias", "kallis", "halpa");
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "talo", "me", "osta", "go", "puhelin", "kauppa", "auto", "ajaa", "kävellä", "ajaa", "kierto", "juna "," bus "," puhuvat "," syö "," juoda "," hotel "
								"mediumList", "herra", "rouva", "breakfast", "lounas", "illallinen", "tie", "matka", "lainata", "taksi", "rahaa", "hello", "veneen "," taso "," beach "
								"hardList", "apartment", "ruokakauppaan", "air port", "juna-asema", "ravintola", "rakennus", "liikenne", "suunta", "osoite", "kahvi", "turisti");
			Finnish.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "isä", "äiti", "veli", "sisko", "poika", "tytär",
								"secondList", "setä", "täti", "isoisä", "isoäiti", "serkku", "veljenpoika", "veljentytär");
			Finnish.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "hyvää huomenta", "Hyvää iltapäivää", "hyvää iltaa", "hyvää yötä", "näkemiin", "En ymmärrä", "nimeni on-",
								"secondList", "kuinka paljon on-", "Do you speak-", "missä on-", "kuinka paljon on-", "anteeksi", "kiitos", "olet tervetullut");
			Finnish.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "jalkapallo", "tennis", "Basketball", "hockey", "golf", "Cricket", "baseball", "rugby", "sulkapallo", "squash"
								"secondList", "shopping", "kävely", "uinti", "lukeminen", "ratsastus", "Musiikki", "aurinkoa", "rentoutuminen", "auttava");
			Finnish.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("Minä", "hän", "hän", "he", "meitä", "he", "sinä", "sinun", "se");
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("punainen", "oranssi", "keltainen", "sininen", "Purple", "musta", "valkoinen", "vihreä", "pink", "harmaa", "ruskea");
			Finnish.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("America", "Kanada", "englanti", "Australia", "RANSKA", "Espanja", "Meksiko", "Brasilia", "Saksa", "Venäjä", "Ruotsi", "Kiina", "Japan "," Intia "," Hollanti "," Egypti "," Italia "," kalkkuna ");
			Finnish.countries.setWordsTo(wordSetArray);
			
			
			////////////////////////////////////////////////////////////////////TURKISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			//Nouns
			wordSetArray.push(	"easyList", "köpek", "kedi", "adam", "kadın", "kız", "çocuk", "araba", "kahve", "plaj", "ev", "yiyecek", "içki "," bana "," çocuk "," kuş "," kitap "," masa "," sandalye "," telefon "," alışveriş "," yatak "," gün "," çay "," turist ",
								"mediumList", "hayvan", "insan", "garson", "efendim", "para", "hanımefendi", "uçak", "tekne", "tren", "Otobüs", "nehir", "kahvaltı "," yemek "," yemek "," yol "," tatlı "," çöl "," banyo "," isim "," garson "," otel "," İngilizce ",
								"hardList", "asansör", "daire", "bakkal", "taksi", "hava limanı", "tren istasyonu", "restoran", "Bina", "trafik", "ispanyolca", "almanca" , "İtalyan", "Fransız", "portekizce", "Japon", "hollanda", "Fin", "türk");
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "satmak", "satın alma", "telefon", "okumak", "duymak", "yürüyüş", "koşmak", "almak", "görmek", " konuşma "," gitmek "," yardım ", "
								"mediumList", "metin", "ayakta", "oturmak", "vermek", "öğrenme", "yüzmek", "konuşma", "uyku", "beklemek", "sürücü" "almak"
								"hardList", "inşa", "bilmek", "tercih", "iş", "koku", "seyahat etmek", "beklemek" "telaffuz", "hissediyorum");
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "iyi", "kötü", "sıcak", "soğuk", "sad", "mutlu", "küçük", "büyük", "çirkin", "sevimli",
								"mediumList", "yavaş", "hızlı", "sakin", "yüksek sesle", "öfkeli", "aptal", "akıllı", "kısa", "uzun boylu", "yorgun"
								"hardList", "ucuz", "pahalı", "nazik", "kaba", "can sıkıcı", "karışık", "clear", "koyu", "parlak");
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "ev", "bana", "gitmek", "telefon", "alışveriş", "araba", "sürücü", "yürüyüş", "run", "döngü", "tren" satın ""," otobüs "," konuşma "," yemek "," içki "," otel ",
								"mediumList", "efendim", "hanımefendi", "kahvaltı", "yemek", "yemek", "yol", "seyahat etmek", "ödünç", "taksi", "para", "merhaba", "tekne "," uçak "," plaj ",
								"hardList", "daire", "bakkal", "hava limanı", "tren istasyonu", "restoran", "Bina", "trafik", "yön", "adres", "kahve", "turist");
			Turkish.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "baba", "anne", "kardeş", "kız kardeş", "oğlum", "kızım",
								"secondList", "amca", "teyze", "dede", "büyükanne", "kuzen", "yeğen", "niece");
			Turkish.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "merhaba", "günaydın", "iyi günler", "iyi akşamlar", "iyi geceler", "güle güle", "benim adım-", "Anlamıyorum"
								"secondList", "-ne kadar", "konuşma-sen yaparsın" "nerede-", "ne kadar-", "Bir şey değil", "teşekkür ederim", "affedersiniz");
			Turkish.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "futbol", "tenis", "basket", "hokey", "golf", "kriket", "beyzbol", "rugby", "badminton", "kabak",
								"secondList", "alışveriş", "yürüyüş", "yüzme", "okuma", "görme görme", "rahatlatıcı", "güneşlenmek", "müzik", "binicilik");
			Turkish.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("Ben", "o", "o", "onlar", "bize", "onlar", "sen", "siz)", "o");
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("kırmızı", "turuncu", "sarı", "kahverengi", "gri", "pembe", "yeşil", "beyaz", "siyah", "mor", "mavi");
			Turkish.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "kanada", "england", "Avustralya", "fransa", "İspanya", "meksika", "brezilya", "almanya", "Rusya", "isveç", "Çin", "Japonya "," Hindistan "," holland "," Mısır "," İtalya "," turkey ");
			Turkish.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////////////////////////////////DUTCH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.push(	"easyList", "köpek", "kedi", "adam", "kadın", "kız", "çocuk", "araba", "kahve", "plaj", "ev", "yiyecek", "içki "," bana "," çocuk "," kuş "," kitap "," masa "," sandalye "," telefon "," alışveriş "," yatak "," gün "," çay "," turist ",
								"mediumList", "hayvan", "insan", "garson", "efendim", "para", "hanımefendi", "uçak", "tekne", "tren", "Otobüs", "nehir", "kahvaltı "," yemek "," yemek "," yol "," tatlı "," çöl "," banyo "," isim "," garson "," otel "," İngilizce ",
								"hardList", "asansör", "daire", "bakkal", "taksi", "hava limanı", "tren istasyonu", "restoran", "Bina", "trafik", "ispanyolca", "almanca" , "İtalyan", "Fransız", "portekizce", "Japon", "hollanda", "Fin", "türk");
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "," satmak "," satın alma ", telefon" okumak "," duymak "," yürüyüş "," run "," almak "," görmek "," konuşma "," gitmek "," yardım ", "
								"mediumList", "metin", "ayakta", "oturmak", "vermek", "öğrenme", "yüzmek", "konuşma", "uyku", "beklemek", "sürücü" "almak"
								"hardList", "inşa", "bilmek", "tercih", "iş", "koku", "seyahat etmek", "beklemek" "telaffuz", "hissediyorum");
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "iyi", "kötü", "sıcak", "soğuk", "sad", "mutlu", "küçük", "büyük", "çirkin", "sevimli",
								"mediumList", "yavaş", "hızlı", "sakin", "yüksek sesle", "öfkeli", "aptal", "akıllı", "kısa", "uzun boylu", "yorgun"
								"hardList", "ucuz", "pahalı", "nazik", "kaba", "can sıkıcı", "karışık", "clear", "koyu", "parlak");
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "ev", "bana", "gitmek", "telefon", "alışveriş", "araba", "sürücü", "yürüyüş", "run", "döngü", "tren" satın ""," otobüs "," konuşma "," yemek "," içki "," otel ",
								"mediumList", "efendim", "hanımefendi", "kahvaltı", "yemek", "yemek", "yol", "seyahat etmek", "ödünç", "taksi", "para", "merhaba", "tekne "," uçak "," plaj ",
								"hardList", "daire", "bakkal", "hava limanı", "tren istasyonu", "restoran", "Bina", "trafik", "yön", "adres", "kahve", "turist");
			Dutch.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "baba", "anne", "kardeş", "kız kardeş", "oğlum", "kızım",
								"secondList", "amca", "teyze", "dede", "büyükanne", "kuzen", "yeğen", "niece");
			Dutch.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "merhaba", "günaydın", "iyi günler", "iyi akşamlar", "iyi geceler", "güle güle", "benim adım-", "Anlamıyorum"
								"secondList", "-ne kadar", "konuşma-sen yaparsın" "nerede-", "ne kadar-", "Bir şey değil", "teşekkür ederim", "affedersiniz");
			Dutch.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "futbol", "tenis", "basket", "hokey", "golf", "kriket", "beyzbol", "rugby", "badminton", "kabak",
								"secondList", "alışveriş", "yürüyüş", "yüzme", "okuma", "görme görme", "rahatlatıcı", "güneşlenmek", "müzik", "binicilik");
			Dutch.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("Ben", "o", "o", "onlar", "bize", "onlar", "sen", "siz (çoğul)", "o");
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("kırmızı", "turuncu", "sarı", "kahverengi", "gri", "pembe", "yeşil", "beyaz", "siyah", "mor", "mavi");
			Dutch.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "kanada", "england", "Avustralya", "fransa", "İspanya", "meksika", "brezilya", "almanya", "Rusya", "isveç", "Çin", "Japonya "," Hindistan "," holland "," Mısır "," İtalya "," turkey ");
			Dutch.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////////////////////////////////PORTUGUESE\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			

			//Nouns
			wordSetArray.push(	"EasyList", "cachorro", "gato", "homem", "mulher", "menina", "menino", "carro", "café", "praia", "casa", "alimento", "bebida "," me "," criança "," pássaro "," livro "," mesa "," cadeira "," telefone "," loja "," cama "," dia "," chá "," turista ",
								"mediumList", "animal", "pessoa", "garçom", "senhor", "dinheiro", "senhora", "plano", "barco", "trem", "ônibus", "rio", "Café da manhã "," lunch "," jantar "," road "," doce "," deserto "," banheiro "," nome "," garçom "," hotel "," Inglês ",
								"hardList", "Elevador", "apartamento", "mercearia", "táxi", "porto de ar", "estação de trem", "restaurant", "casa", "Traffic", "espanhol", "german" , "italiano", "french", "português", "turco", "finlandês", "holandês", "japonês");
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "help", "ir", "falar", "ver", "começar", "correr", "andar", "ouvir", "ler", "comprar", "vender", "telefone "
								"mediumList", "text", "tome", "unidade", "esperar", "falar", "nadar", "aprender", "sleep", "dar", "sentar", "ficar",
								"hardList", "pronunciar", "escolha", "conhecer", "construir", "trabalho", "cheiro", "viajar", "esperar", "sentir");
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "bom", "ruim", "bonito", "feio", "grande", "pequeno", "feliz", "triste", "frio", "quente",
								"mediumList", "cansado", "alto", "curto", "inteligente", "burro", "irritado", "alto", "calma", "fast", "lento",
								"hardList", "brilhante", "negro", "claro", "confuso", "chato", "rude", "educado", "caro", "barato");
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
								"mediumList", 10, 20, 30, 40, 50, 60, 70, 80, 90,
								"hardList", 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 10000, 100000, 1000000);
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "casa", "me", "comprar", "ir", "telefone", "shop", "carro", "unidade", "caminhada", "executar", "ciclo", "trem "," ônibus "," falar "," comer "," beber "," hotel ",
								"mediumList", "senhor", "senhora", "Café da manhã", "almoço", "jantar", "road", "viajar", "emprestar", "táxi", "dinheiro", "Olá", "barco "," plano "," praia ",
								"hardList", "apartamento", "mercearia", "porto de ar", "estação de trem", "restaurant", "casa", "Traffic", "direção", "Endereço", "café", "turista");
			Portuguese.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "pai", "mãe", "irmão", "irmã", "filho", "filha",
								"secondList", "tio", "tia", "avô", "avó", "primo", "sobrinho", "sobrinha");
			Portuguese.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "Olá", "bom dia", "boa tarde", "boa tarde", "boa noite", "adeus", "Eu não entendo", "meu nome é",
								"secondList", "quanto é", "Do You Speak", "onde está", "quanto é", "com licença", "obrigado", "você é bem-vindo");
			Portuguese.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "futebol", "tênis", "basquete", "hockey", "golf", "grilo", "baseball", "rugby", "badminton", "squash",
								"secondList", "shopping", "caminhando", "natação", "leitura", "cavalo", "música", "bronzear", "relaxamento", "passeios");
			Portuguese.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("Eu", "ele", "ela", "eles", "nós", "eles", "você", "você (plural)", "ele");
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("vermelho", "laranja", "amarelo", "azul", "purple", "negro", "branco", "verde", "cor de rosa", "cinza", "marrom");
			Portuguese.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("América", "canada", "Inglaterra", "Austrália", "França", "espanha", "México", "Brasil", "Alemanha", "russia", "Suécia", "china", "japan "," Índia "," Holland "," Egito "," Itália "," peru ");
			Portuguese.countries.setWordsTo(wordSetArray);*/
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