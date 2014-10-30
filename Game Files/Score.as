package 
{
	import flash.utils.Timer;

	public class Score
	{
		//Common score-based properties
		public var numCorrect:uint = 0;
		public var numIncorrect:uint = 0;
		public var playTime:Number = 0;
		
		public var duration:Number;
		public var penaltyOnWrong:Boolean;
		public var difficultyMultiplier:Number;

		//Score value components
		public const baseCompletionScore:Number = 100;
		public var timeBonus:Number = 0;
		public var performanceBonus:Number = 0;
		public var totalScore:Number = 0;


		//Constructor
		public function Score()
		{

		}


		//Processes
		public function calcScore():Number
		{
			//Sets the time bonus, which is higher depending on how long it took the player to complete the round
			if (playTime < duration)
			{
				timeBonus = (duration - playTime) * 50;
			}
			else
			{
				timeBonus = 0;
			}

			//Error checker for the time bonus value - Should not be negative
			if (timeBonus < 0)
			{
				trace("ERROR: Time bonus is negative, which is hardly a 'bonus'.");
			}

			//Sets the performance bonus, which is higher based on the number of correct answers
			performanceBonus = numCorrect * 100;

			if (penaltyOnWrong)
			{
				performanceBonus -=  numIncorrect * 50;
			}

			//The totalScore holds the value of all of these values put together
			totalScore = (baseCompletionScore + performanceBonus + timeBonus) * difficultyMultiplier;
			return (totalScore);
		}
		public function resetScore()
		{
			numCorrect = 0;
			numIncorrect = 0;
			playTime = 0;
		}
		
	}
}