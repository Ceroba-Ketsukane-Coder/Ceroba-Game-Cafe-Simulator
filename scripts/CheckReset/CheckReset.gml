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
						
						script_execute(SkipToNext);
						
						break;
					case true:
						
						script_execute(SkipToNextInteract);
						
						break;
				}
				break;
				
			case true:
			
				var arrayCheck = [];
			
				switch (checkBoth)
				{
					case true:
						arrayCheck = trueDialogue;
						break;
					case false:
						arrayCheck = falseDialogue;
						break;
				}
				
				script_execute(SkipToNextInteractCheck, arrayCheck);
				
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