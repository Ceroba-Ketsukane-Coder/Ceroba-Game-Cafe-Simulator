// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AnimationCerobaScript()
{
	
	var arrayKey = [vk_up, vk_down, vk_left, vk_right];
	
	var animations = [Spr_Ceroba_Idle_Move_Up, Spr_Ceroba_Idle_Move_Down, Spr_Ceroba_Idle_Move_Left, Spr_Ceroba_Idle_Move_Right];
	
	var animationsRun = [Spr_Ceroba_Run_Move_Up, Spr_Ceroba_Run_Move_Down, Spr_Ceroba_Run_Move_Left, Spr_Ceroba_Run_Move_Right];
	
	var pressingKey = false;
	
	var valueAnimation = 0;
	
	var otherKeysPressed = false;
	
	var collisions = [place_meeting(x, y - 1, Obj_Collision), place_meeting(x, y + 1, Obj_Collision), place_meeting(x - 1, y, Obj_Collision), place_meeting(x + 1, y, Obj_Collision)];
	
	for (var k = 0; k < array_length(collisions); k++)
	{
		if (collisions[k])
		{
			valueAnimation = k;
			break;	
		}
	}
	
	for (var i = 0; i < array_length(arrayKey); i++)
	{
		if (keyboard_check(arrayKey[i]))
		{
			if (i != valueAnimation)
			{
				otherKeysPressed = true;
			}
		}
	}
	

	for (var i = 0; i < array_length(arrayKey); i++)
	{
		if (keyboard_check(arrayKey[i]))
		{
			if (image_speed == 0)
			{
				image_index = 0;	
			}
			
			if (collisions[i] && otherKeysPressed)
			{
				continue;
			}
			else if (collisions[i] && !otherKeysPressed)
			{
				sprite_index = animations[i];
				image_index = sprite_get_number(animations[i]) - 1;	
                lastKey = arrayKey[i];
                pressingKey = true;
				break;
			}			
			
			if (state == cerobaPosition.WALK)
			{
				sprite_index = animations[i];
				image_speed = 1;
				sprite_set_speed(animations[i], 6, spritespeed_framespersecond);
				lastKey = arrayKey[i];
				pressingKey = true;
				break;
			}
			else if (state == cerobaPosition.RUN)
			{
				sprite_index = animationsRun[i];
				image_speed = 1;
				sprite_set_speed(animationsRun[i], 9, spritespeed_framespersecond);
				lastKey = arrayKey[i];
				pressingKey = true;
				break;
			}
		}
	}
	if (!pressingKey)
	{
		for (var i = 0; i < array_length(arrayKey); i++)
		{
			if (lastKey == arrayKey[i])
			{
				sprite_index = animations[i];
				image_index = sprite_get_number(animations[i]) - 1;	
				image_speed = 0;
			}
		}
	}

	

	
}