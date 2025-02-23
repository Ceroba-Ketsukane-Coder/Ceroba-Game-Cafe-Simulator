// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckReset()
{
	//If the Z key is pressed & the text is being read + text is at max length.
	if (keyboard_check_pressed(ord("Z")) && readText && textIndex >= string_length(textToRead))
	{
		switch (check)
		{
			case false:
			
				switch (interact)
				{
					case false:
						//If not at the last box, reset.
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
							textToRead = textToGive[textBoxIndex];
							facialExpress = facialExpressions[textBoxIndex];
							readText = false;
							Obj_Ceroba.state = cerobaPosition.IDLE;
							alarm[0] = 60;
						}
						break;
					case true:
						
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
						
						
						break;
				}
				break;
				
				
				
			case true:
			
				var arrayCheck = 0;
			
				switch (checkBoth)
				{
					case true:
						arrayCheck = trueDialogue;
						break;
					case false:
						arrayCheck = falseDialogue;
						break;
				}
				
				//If not at the last box, reset.
				if (textBoxIndex < array_length(arrayCheck) - 1)
				{
					textIndex = 0;
					soundIndex = 0;
					textBoxIndex++;
					textToRead = checkArray[textBoxIndex];
					facialExpress = facialExpressions[textBoxIndex];
				}
				//If so, then quit. 
				else 
				{
					textIndex = 0;
					textBoxIndex = 0;
					soundIndex = 0;
					global.executeEvent = true;
					textToRead = textToGive[textBoxIndex];
					facialExpress = facialExpressions[textBoxIndex];
					readText = false;
					Obj_Ceroba.state = cerobaPosition.IDLE;
					alarm[0] = 60;
				}
				
				break;
		}
	}
	
	if (textIndex >= string_length(textToRead) && readText)
	{
		switch (interact)
		{
			case true:
				if (keyboard_check_pressed(vk_left))
				{
					decisionPosition = 0;
				}
				else if (keyboard_check_pressed(vk_right))
				{
					decisionPosition = 1;
				}
				break;
			
			case false:
		
				break;
	
		}
	}
	
	
	
	
	
}