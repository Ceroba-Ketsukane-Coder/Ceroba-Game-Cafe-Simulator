// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ReadInteractDialogue(top, checkAuth, boolArray, interactAuth, BoolInteractArray)
{	
	
	var boolChecked = false;
	
	var runCheck = false;
	
	
	
	switch (checkAuth)
	{
		case true:
		
			//If the parameter array exists
			if (array_length(boolArray) > 0 && !runCheck)
			{
				runCheck = true;
				var count = 0;
				for (var k = 0; k < array_length(boolArray); k++)
				{
					if (boolArray[k] == true)
					{
						count++;	
					}
				}
		
				if (count == array_length(boolArray))
				{
					boolChecked = true;
					checkBoth = true;
				}
				else
				{
					boolChecked = false;
					checkBoth = false;
				}
			} 
	
			break;
			
		case false:
		
			break;
	}


	switch (runCheck)
	{
		case false:
		
			//Check if the boolean Value readText is true.
			if (readText)
			{
				//Set Player State to Read Dialogue so that the Player can't move until the dialogue stops. 
				Obj_Ceroba.state = cerobaPosition.READ;
	
				switch(interactAuth)
				{
					case true:
				
						var selectChoice = false;
						
						if (BoolInteractArray[textBoxIndex] == true)
						{
							selectChoice = true;
						}
						
						switch(selectChoice)
						{
							case false:
								
								script_execute(ReadDialogueNoCheckNoInteract, top);
								
								break;
						
							case true:
								
								script_execute(ReadDialogueNoCheckInteract, top);
												
								break;
						}				
						break;
						
					
					
					case false:
						
						script_execute(ReadDialogueNoCheckNoInteract, top);
					
						break;
				}
			}
			
			break;
		
		
		case true:
			//Check if the boolean Value readText is true.
			if (readText)
			{
				//Set Player State to Read Dialogue so that the Player can't move until the dialogue stops. 
				Obj_Ceroba.state = cerobaPosition.READ;
				
				switch (boolChecked)
				{
					case false:
						
						switch (runTrueDialogue)
						{
							case false:
								textToRead = falseDialogue[textBoxIndex];
								break;
								
							case true:
								textToRead = finalDialogueAfterTrueAndFalse[textBoxIndex];
								break;
						}
						
						break;
						
					case true:
						
						textToRead = trueDialogue[textBoxIndex];
						
						break;
				}
				
				switch(interactAuth)
				{
					case false:
						
						script_execute(ReadDialogueNoCheckNoInteract, top);
						
						break;
						
					case true:
					
						var selectChoice = false;
						
						
						if (BoolInteractArray[textBoxIndex] == true)
						{
							selectChoice = true;
						}
						
						switch(selectChoice)
						{
							case false:
								
								//Same script 
								script_execute(ReadDialogueNoCheckNoInteract, top);
								
								break;
						
							case true:
							
								script_execute(ReadDialogueNoCheckInteract, top);
							
								break;
						}
				
					}
			
			break;
		}
	
	}
	
	
	
	
}
