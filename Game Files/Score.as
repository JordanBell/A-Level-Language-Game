package  {
	import flash.utils.Timer;
	
	public class Score {
		public var correctCount:uint;
		public var incorrectCount:uint;
		public var playTime:Number;
		public var timeBonusLimit:Number;
		public var penaltyOnWrong:Boolean;
		public var difficultyMultiplier:Number;
		
		//Score value components
		public var baseCompletionScore:Number;
		public var timeBonus:Number;
		public var performanceBonus:Number;
		public var totalScore:Number;

		public function Score() {
		
		}
		
		public function calcScore():void{
			//Sets the time bonus, which is higher depending on 
			if (playTime < timeBonusLimit){
				timeBonus = (timeBonusLimit - playTime) * 50;
			}else{
				timeBonus = 0;
			}
			
			//Error checker for the time bonus value - Should not be negative
			if (timeBonus < 0){
				trace("ERROR: Time bonus is negative, which is hardly a 'bonus'.");
			}
			
			//Sets the performance bonus, which is higher based on the number of correct answers
			performanceBonus += correctCount * 100;
			
			if (penaltyOnWrong){
				performanceBonus -= incorrectCount * 50;
			}
			
			totalScore = (baseCompletionScore + performanceBonus + timeBonus) * difficultyMultiplier;
		}

	}
	
}
