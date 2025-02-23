// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckCollision()
{
	if (instance_place(x, y, Obj_Ceroba))
	{
		if (keyboard_check_pressed(ord("Z")) && !readText && alarm[0] == 0)
		{
			for (var i = 0; i < array_length(checkDirection); i++)
			{
				if (Obj_Ceroba.sprite_index == checkDirection[i])
				{
					readText = true;
				}
			}
		}	
	}
}