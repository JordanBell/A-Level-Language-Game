stop();

import flash.events.*;
import flash.display.*;
import flash.net.SharedObject;
import flash.utils.*;
import flash.ui.Keyboard;

//The translation popup menu is added, invisible by default
var transScreen:TranslationMenu = new TranslationMenu();
transScreen.x = 0;
transScreen.y = 0;
frameTrans.visible = false;

var pauseScreen:PauseMenu = new PauseMenu();
pauseScreen.x = 0;
pauseScreen.y = 0;

//A LanguageGameHandler is instantiated
var myGame:LanguageGameHandler = new LanguageGameHandler();

//A variable holds the language chosen by the user
var chosenLanguage:Language;

//Used for the settings menu & combo boxes
var largeCat:Boolean = false;
var mediumCat:Boolean = false;
var smallCat:Boolean = false;

//The timerPaused boolean determines whether or not to add a new timer once the game is resumed
var timerPaused:Boolean = false;

var correctAnswer:Boolean;

//gameTimer is used for the time limit of the games
var gameTimer;

//timerOn will tell the game whether or not to display a timer and affects all timer-based functions
var timerOn:Boolean = false;

//Initializing the saved data
var savedData:SharedObject = SharedObject.getLocal("languageGameData");
savedData.data.expTotal;
if (savedData.data.expTotal == null)
{
	savedData.data.expTotal = 0;
}

addEventListener(Event.ENTER_FRAME, setListeners);
addEventListener(Event.ENTER_FRAME, checkCategory);

//The setListeners function dynamically adds event listeners depending on whether or not the button's presense on the stage is non-null
function setListeners(e:Event)
{
	switch (currentFrame)
	{
		case 1:
			//Language Selection frame
			btnTrans.addEventListener(MouseEvent.CLICK, translation);
				
			btnSpanish.addEventListener(MouseEvent.CLICK, setSpanish);
			btnItalian.addEventListener(MouseEvent.CLICK, setItalian);
			btnGerman.addEventListener(MouseEvent.CLICK, setGerman);
			btnJapanese.addEventListener(MouseEvent.CLICK, setJapanese);
			btnPortuguese.addEventListener(MouseEvent.CLICK, setPortuguese);
			btnTurkish.addEventListener(MouseEvent.CLICK, setTurkish);
			btnFrench.addEventListener(MouseEvent.CLICK, setFrench);
			btnFinnish.addEventListener(MouseEvent.CLICK, setFinnish);
			btnDutch.addEventListener(MouseEvent.CLICK, setDutch);
			
			break;
		case 2:
			//Game Selection Frame
			btnTrans.addEventListener(MouseEvent.CLICK, translation);
			btnPrev.addEventListener(MouseEvent.CLICK, previousMenu1);
			btnFlashCards.addEventListener(MouseEvent.CLICK, setFlashCards);
			
			//The following three eventListeners have been commented out until the gametypes have been developed
			//btnChoices.addEventListener(MouseEvent.CLICK, setChoices);
			//btnCountries.addEventListener(MouseEvent.CLICK, setCountries);
			//btnSentenceFiller.addEventListener(MouseEvent.CLICK, setSentenceFiller);
			
			break;
		case 3:
			//Settings Screen
			settingsScreenListeners();
			
			break;
		case 4:
			//Settings Screen
			settingsScreenListeners();
			
			break;
		case 5:
			//Settings Screen
			settingsScreenListeners();
			
			break;
		case 6:
			//Settings Screen
			settingsScreenListeners();
			
			break;
		case 7:
			//Game Screen
			btnPause.addEventListener(MouseEvent.CLICK, pauseGame);
			
			break;
		case 8:
			//Game Screen
			btnPause.addEventListener(MouseEvent.CLICK, pauseGame);
			
			break;
		case 9:
			//Game Screen
			btnPause.addEventListener(MouseEvent.CLICK, pauseGame);
			
			break;
		case 10:
			//Game Screen
			btnPause.addEventListener(MouseEvent.CLICK, pauseGame);
			
			break;
		case 11:
			//Score Screen
			btnTrans.addEventListener(MouseEvent.CLICK, translation);
			btnReplay.addEventListener(MouseEvent.CLICK, replayGame);
			btnNewGame.addEventListener(MouseEvent.CLICK, newGame);
			
			break;
		default:
			trace("WHAT FRAME ARE YOU EVEN ON?");
	}
	
	//Sets the event listeners for the settings screen
	function settingsScreenListeners():void
	{
		btnTrans.addEventListener(MouseEvent.CLICK, translation);
		btnPrev.addEventListener(MouseEvent.CLICK, previousMenu2);
		btnPlay.addEventListener(MouseEvent.CLICK, playGame);
	}
}

//////////////Menu Navigation\\\\\\\\\\\\\\\\\\\

//The frameTransition function adds the frameTrans movieClip, which blots out the screen and changes the frame 
function frameTransition(frameLocation):void
{
	//Starts the frame transition
	frameTrans.visible = true;
	//Goes to second frame, as the first frame will stop the animation with the stop() code, and plays it
	frameTrans.gotoAndPlay(2);

	//Adds an event listener to allow for frame specific code.
	stage.addEventListener(Event.ENTER_FRAME, checkForFrames);
	function checkForFrames(e:Event)
	{
		//Once the transition has reached the point where it has blotted out the screen, the frame changes to the frameLocation argument
		if (frameTrans.currentFrame == 12)
		{
			gotoAndStop(frameLocation);
		}
		if (frameTrans.currentFrame == 24)
		{
			//The transition has ended, so it is removed from view
			frameTrans.visible = false;
			stage.removeEventListener(Event.ENTER_FRAME, checkForFrames);
		}
	}
}

//This previous menu brings up the previous frame
function previousMenu1(e:Event):void
{
	frameTransition(currentFrame - 1);
}

//PreviousMenu2 brings up the game selection menu, and is used in the settings menus.
function previousMenu2(e:Event):void
{
	frameTransition("Selection_Games");
	stage.removeEventListener(Event.ENTER_FRAME, checkCategory);
}

/////////TRANSLATION///////////

//The translation function adds the translation screen and all of its functionality
function translation(e:Event = null):void
{
	//The menu is added to the screen
	addChild(transScreen);
	transScreen.x = 0;
	transScreen.y = 0;

	//Adds a list of every single english word in the database
	transScreen.allWordDisplay.text = myGame.englishWordReturn().toString();
	
	//Button event listeners are added for the translation screen
	transScreen.btnReturn.addEventListener(MouseEvent.CLICK, closeTrans);
	transScreen.btnTranslate.addEventListener(MouseEvent.CLICK, startTrans);
	
	function startTrans(e:Event):void
	{
		//Error checking for empty boxes
		if ((transScreen.comboFrom.text != "") && (transScreen.comboTo.text != ""))
		{
			var from:String = transScreen.comboFrom.text.toLowerCase();
			var to:String = transScreen.comboTo.text.toLowerCase();
			var input:String = transScreen.translationInput.text.toLowerCase();
			
			//Use the chosen settings to return the translated word to the output text box
			transScreen.translationOutput.text = translate(from, to, input);
		}
		
		//Returns a translation for the translationOutput
		function translate(from:String, to:String, input:String):String
		{
			return(myGame.currentGame.translateWord(input, myGame.getLangByName(from), myGame.getLangByName(to)));
		}
	}
	
	//Closes the translation screen
	function closeTrans(e:Event):void
	{
		removeChild(transScreen);
		transScreen.btnReturn.removeEventListener(MouseEvent.CLICK, closeTrans);
		transScreen.btnTranslate.removeEventListener(MouseEvent.CLICK, startTrans);
	}
}

////////GAME SELECTION MENU\\\\\\\\\\

function setFlashCards(e:Event){
	myGame.currentGame = myGame.FlashCards;
	frameTransition(myGame.currentGame.settingsFrameName);
}

//The following three functions have been commented out until the gametypes have been developed
/*function setChoices(e:Event){
	myGame.currentGame = myGame.Choices;
	frameTransition(myGame.currentGame.settingsFrameName);
}

function setCountries(e:Event){
	myGame.currentGame = myGame.Countries;
	frameTransition(myGame.currentGame.settingsFrameName);
}

function setSentenceFiller(e:Event){
	myGame.currentGame = myGame.SentenceFiller;
	frameTransition(myGame.currentGame.settingsFrameName);
}*/

//The checkingCategory function dynamically enables the correct kind of subcategory combobox
function checkCategory(e:Event)
{
	if (comboCategory != null)
	{
		//This function sets the subCategory UI based on the value of the category combobox
		if (comboCategory.text != "")
		{
			//The type of subcategory revealed is dependant on which category has been chosen
			largeCat = ((comboCategory.text == "Common Nouns") || (comboCategory.text == "Common Verbs") || (comboCategory.text == "Common Adjectives") || (comboCategory.text == "Numbers") || (comboCategory.text == "Travel"));
			mediumCat = ((comboCategory.text == "Family") || (comboCategory.text == "Phrases") || (comboCategory.text == "Activities"));
			smallCat = ((comboCategory.text == "Pronouns") || (comboCategory.text == "Colours") || (comboCategory.text == "Countries"));
			
			comboSubcategoryLarge.enabled = largeCat;
			comboSubcategoryLarge.visible = largeCat;
			
			comboSubcategoryMedium.enabled = mediumCat;
			comboSubcategoryMedium.visible = mediumCat;
			
			comboSubcategorySmall.enabled = smallCat;
			comboSubcategorySmall.visible = smallCat;
		}
		else
		{
			//All subcategories are disabled if no category has been enabled
			largeCat = false;
			mediumCat = false;
			smallCat = false;
			comboSubcategoryLarge.enabled = false;
			comboSubcategoryMedium.enabled = false;
			comboSubcategorySmall.enabled = false;
			
			//Only the default, large subcategory combobox is visible
			comboSubcategoryLarge.visible = true;
			comboSubcategoryMedium.visible = false;
			comboSubcategorySmall.visible = false;
		}
	}
}

/////////EVENT FUNCTIONS//////////

function setSpanish(event:MouseEvent):void
{
	chosenLanguage = myGame.Spanish;
	endLanguageSelection();
	
}
function setItalian(event:MouseEvent):void
{
	chosenLanguage = myGame.Italian;
	endLanguageSelection();
}
function setFrench(event:MouseEvent):void
{
	chosenLanguage = myGame.French;
	endLanguageSelection();
}
function setGerman(event:MouseEvent):void
{
	chosenLanguage = myGame.German;
	endLanguageSelection();
}
function setJapanese(event:MouseEvent):void
{
	chosenLanguage = myGame.Japanese;
	endLanguageSelection();
}
function setPortuguese(event:MouseEvent):void
{
	chosenLanguage = myGame.Portuguese;
	endLanguageSelection();
}
function setFinnish(event:MouseEvent):void
{
	chosenLanguage = myGame.Finnish;
	endLanguageSelection();
}
function setTurkish(event:MouseEvent):void
{
	chosenLanguage = myGame.Turkish;
	endLanguageSelection();
}
function setDutch(event:MouseEvent):void
{
	chosenLanguage = myGame.Dutch;
	endLanguageSelection();
}

function endLanguageSelection():void{
	myGame.setLanguage(myGame.English, chosenLanguage);
	frameTransition(2);
}

//The function which is executed when the play button is clicked 
function playGame(e:Event)
{
	//If all of the settings have been set:
	if ((comboCategory.text != "") && (comboGameDifficulty.text != "") && (comboFormat.text != "") && ((comboSubcategoryLarge.text != "") || (comboSubcategoryMedium.text != "") || (comboSubcategorySmall.text != ""))){
		
		//These statements set the input and output language, based on the chosen format. EtoF means English to Foreign.
		if (comboFormat.selectedItem.data == "EtoF")
		{
			myGame.inputLanguage = chosenLanguage;
			myGame.outputLanguage = myGame.English
		}
		else
		{
			myGame.inputLanguage = myGame.English;
			myGame.outputLanguage = chosenLanguage
		}
		
		//Set all the properties for the game and handler, depending on which subcategory box is enabled
		if (largeCat){ myGame.currentGame.settingsTo(myGame.outputLanguage, comboCategory.selectedItem.data, comboGameDifficulty.selectedItem.data, comboSubcategoryLarge.selectedItem.data, comboFormat.selectedItem.data) }
		if (mediumCat){ myGame.currentGame.settingsTo(myGame.outputLanguage, comboCategory.selectedItem.data, comboGameDifficulty.selectedItem.data, comboSubcategoryMedium.selectedItem.data, comboFormat.selectedItem.data) }
		if (smallCat){ myGame.currentGame.settingsTo(myGame.outputLanguage, comboCategory.selectedItem.data, comboGameDifficulty.selectedItem.data, comboSubcategorySmall.selectedItem.data, comboFormat.selectedItem.data) };
		
		frameTransition(myGame.currentGame.gameFrameName);
	}
}

function pauseGame(e:Event):void
{
	//If there is a timer, it is removed, with a boolean to signify that it mustbe resumed.
	if (timerOn)
	{
		timerPaused = true;
		endTimer();
	}
	
	//Add the pause menu
	addChild(pauseScreen);

	//Add listeners for the buttons in the pause menu
	pauseScreen.btnReturn.addEventListener(MouseEvent.CLICK, returnToGame);
	pauseScreen.btnMenu.addEventListener(MouseEvent.CLICK, returnToMenu);
	pauseScreen.btnRestart.addEventListener(MouseEvent.CLICK, restartGame);
}

function returnToGame(e:Event):void
{
	unpause();
	//If the timer was paused, resume it
	if (timerPaused)
	{
		restartTimer();
	}
}

function returnToMenu(e:Event):void
{
	unpause();
	//The timer does not need to be restarted, so the variable signifying this is set to false
	timerPaused = false;
	frameTransition("Selection_Games");
}

//When the game is restarted, it is unpaused, 
function restartGame(e:Event):void
{
	unpause();
	if (timerPaused)
	{
		//The game is resumed...
		restartTimer();
		timerPaused = false;
		
		//...and ended.
		endTimer();
	}
	
	//A new game is started
	startFlashCards();
}

function unpause():void
{
	//Remove the pause screen
	removeChild(pauseScreen);
	//Remove pause screen button listeners
	pauseScreen.btnReturn.removeEventListener(MouseEvent.CLICK, returnToGame);
	pauseScreen.btnMenu.removeEventListener(MouseEvent.CLICK, returnToMenu);
	pauseScreen.btnRestart.removeEventListener(MouseEvent.CLICK, restartGame);
}

//Final score screen button events
function replayGame(e:Event){
	//Go to settings screen
	frameTransition(myGame.currentGame.gameFrameName);
}

function newGame(e:Event){
	frameTransition("Selection_Games");
}