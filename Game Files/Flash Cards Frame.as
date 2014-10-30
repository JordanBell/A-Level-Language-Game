import flash.text.FontStyle;
import flash.events.Event;

addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
answerButton.addEventListener(MouseEvent.CLICK, giveAnswer);
btnSkip.addEventListener(MouseEvent.CLICK, finishRound);

////////////////////////////;

startFlashCards();
function startFlashCards(e:Event = null)
{
	//All of the initial processes for starting the game:

	//Resets all round stats from previous game.
	myGame.currentGame.resetGameStats();
	//Fires off the first round automatically. The next rounds are handled by the Answer Submission event listener;
	myGame.currentGame.nextRound();
	startTimer();
	
	lblLanguage.text = myGame.outputLanguage.name;
	lblTotalRounds.text = myGame.currentGame.totalRounds.toString();
	
	//Sets the dynamic messages to not be visible
	yes.visible = false;
	yesMessage.visible = false;
	no.visible = false;
	noMessage.visible = false;
	lblAnswer.visible = false;
	//If there is a timer restriction...
	if (myGame.currentGame.useTimer == true)
	{
		lblTime.text = (myGame.currentGame.score.duration - myGame.currentGame.score.playTime).toString();
	}
	else
	{
		lblTime.visible = false;
	}

	updateUI();
}


/////////////////TIMER FUNCTION//////////////////
//If a timer is not currently set up, one is started. Otherwise, a duplicate is trying to be made and an error is sent to the programmer
function startTimer()
{
	if (timerOn == false)
	{
		gameTimer = setInterval(setTime,1000);
		timerOn = true;
		myGame.currentGame.score.playTime = 0;
	}
	else
	{
		trace("Duplicate timer trying to be made");
	}
}

//Functions the same as startTimer, but doesn't reset the playTime variable, allow the timer to resume
function restartTimer()
{
	//If there is currently no timer
	if (timerOn == false)
	{
		//Starts a timer without resetting the amount of time passed
		gameTimer = setInterval(setTime,1000);
		timerOn = true;
	}
	else
	{
		//Notify the programmer of the error
		trace("Duplicate timer trying to be made");
	}
}

//Ends the timer
function endTimer()
{
	//If a timer is on
	if (timerOn == true)
	{
		//Remove the timer
		clearInterval(gameTimer);
		timerOn = false;
	}
	else
	{
		//Notify the programmer of the error
		trace("Trying to end a timer, when one isn't running.");
	}
}

//Updates the time variables, as per the set interval
function setTime()
{
	//Play time increments
	myGame.currentGame.score.playTime++;
	
	//If a timer is being used
	if (myGame.currentGame.useTimer == true)
	{
		//The time label is dynamically updated
		lblTime.text = (myGame.currentGame.score.duration - myGame.currentGame.score.playTime).toString();
		
		//If the the elapsed time equals the maximum game duration...
		if (myGame.currentGame.score.playTime == myGame.currentGame.score.duration)
		{
			//The game is ended, and a message notifying the player of such is displayed
			var timeout:Timeout = new Timeout();
			timeout.x = 400;
			timeout.y = 300;
			addChild(timeout);
			endGame();
		}
	}
}


//Input functions
function keyHandler(e:KeyboardEvent)
{
	//If the enter key is pressed, the answer is submitted
	if (e.keyCode == Keyboard.ENTER)
	{
		giveAnswer();
	}
}

function giveAnswer(e:Event = null)
{
	//Submits the answer
	correctAnswer = myGame.submitAnswer(myGame.currentGame,inputBox.text);
	respondUI();

	finishRound();
}

function finishRound(e:Event = null):void
{
	//If the game is over:
	if (myGame.currentGame.round >= (myGame.currentGame.totalRounds - 1))
	{
		endGame();
	}
	else
	{
		//If the game hasn't ended, go to the next round.
		myGame.currentGame.nextRound();
		updateUI();
	}
}

//Processes
function endGame()
{
	//Game over!
	//Freeze the gameplay my removing the input listeners
	removeEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
	answerButton.removeEventListener(MouseEvent.CLICK, giveAnswer);
	endTimer();
	
	outputBox.text = "Game over!";
	
	//If they have done well...
	if (myGame.currentGame.score.numCorrect > (myGame.currentGame.totalRounds / 2))
	{
		//Congratulate them!
		var congratulations:Congratulations = new Congratulations();
		congratulations.x = 400;
		congratulations.y = 200;
		addChild(congratulations);
	}
	else
	{
		//Console them
		var tooBad:TooBad = new TooBad();
		tooBad.x = 400;
		tooBad.y = 200;
		addChild(tooBad);
	}
	
	//Delay for a second to allow for the response UI to take effect, then go to the score screen
	setTimeout(transitionToEnd, 1000);
	
	function transitionToEnd():void
	{
		frameTransition("GameOver");
	}
}

function updateUI()
{
	//The displayed round is 1 more than the actual value, as the actual value is used as an array index.
	lblCounter.text = (myGame.currentGame.round + 1).toString();
	//Displays the score
	lblScore.text = (myGame.currentGame.score.numCorrect * 100).toString();
	//Displays the next word
	outputBox.text = myGame.currentGame.currentWord;
	//Resets the inputbox
	inputBox.text = "";
}

function respondUI()
{
	if (correctAnswer)
	{
		//The player is CORRECT
		//Symbols
		yes.visible = true;
		yes.gotoAndPlay(1);
		no.visible = false;

		//Verbal messages
		yesMessage.visible = true;
		yesMessage.gotoAndPlay(1);
		noMessage.visible = false;
		lblAnswer.visible = false;
	}
	else
	{
		//The player is WRONG
		//Symbols
		no.visible = true;
		no.gotoAndPlay(1);
		yes.visible = false;

		//Verbal messages
		lblAnswer.visible = true;
		lblAnswer.gotoAndPlay(1);
		lblAnswer.lblAnswerTween.outputWordDisplay.text = myGame.currentGame.currentWord;
		lblAnswer.lblAnswerTween.expectedAnswerDisplay.text = myGame.expectedAnswer;
		noMessage.visible = true;
		noMessage.gotoAndPlay(1);
		yesMessage.visible = false;
	}
}
