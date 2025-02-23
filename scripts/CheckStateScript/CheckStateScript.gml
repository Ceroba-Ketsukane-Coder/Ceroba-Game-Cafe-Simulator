// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckStateScript()
{
	var arrayKey = [vk_left, vk_right, vk_up, vk_down];
	
	var unchangeableStates = [cerobaPosition.CUTSCENE, cerobaPosition.TALK, cerobaPosition.READ];
	
	var inState = false;
	
	for (var k = 0; k < array_length(unchangeableStates); k++)
	{
		if (state == unchangeableStates[k])
		{
			inState = false;
			break;
		}
		else
		{
			inState = true;
		}
		
	}
	
	if (inState)
	{
		if (abs(speedH) >= 4 || abs(speedV) >= 4)
		{
			state = cerobaPosition.RUN;
		}
		else if (abs(speedH) >= 2 || abs(speedV) >= 2)
		{
			state = cerobaPosition.WALK;
		}
		else
		{
			state = cerobaPosition.IDLE;	
		}
	}
	
	
}