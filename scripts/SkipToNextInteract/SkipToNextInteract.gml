// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SkipToNextInteract()
{
	if (textBoxIndex < array_length(textToGive) - 1)
	{
		textIndex = 0;
		soundIndex = 0;
		textBoxIndex++;
		textToRead = textToGive[textBoxIndex];
		facialExpress = facialExpressions[textBoxIndex];
	}
	//If so, then quit. 
	else 
	{
		textIndex = 0;
		textBoxIndex = 0;
		soundIndex = 0;
		decisionSelected = false;
		decisionPosition = 0;
		textToRead = textToGive[textBoxIndex];
		facialExpress = facialExpressions[textBoxIndex];
		readText = false;
		Obj_Ceroba.state = cerobaPosition.IDLE;
		alarm[0] = 60;
	}
}