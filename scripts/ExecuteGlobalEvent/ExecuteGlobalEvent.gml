// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ExecuteGlobalEvent()
{
	switch(executeEvent)
	{
		case true:
			
			switch(eventChosen)
			{
				case "AddItem":
					
					if (ds_map_size(global.inventoryStruct) < 8)
					{
						ds_map_add_map(global.inventoryStruct, itemName, giveItem);
					}
					
					executeEvent = false;
					executeEventFirstTime = false;
					
					for (var i = 0; i < array_length(interactArray); i++)
					{
						interactArray[i] = false;
					}
					
					boolToCheck = [executeEventFirstTime];
					
					
					break;
					
				case "TriggerRoomOpen":
					
					
					
					
					
					break;
			}
			
			break;
			
		case false:
		
			break;
	}
}