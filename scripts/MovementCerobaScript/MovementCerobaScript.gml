// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MovementCerobaScript()
{
	
	speedH = 0;
	
	speedV = 0;
	
	var walkSpeed = 2;
	
	var checkLeft = (keyboard_check(vk_left));
	
	var checkRight = (keyboard_check(vk_right));
	
	var checkUp = (keyboard_check(vk_up));
	
	var checkDown = (keyboard_check(vk_down));
	
	var collidingLeft = place_meeting(x - 1, y, Obj_Collision);
	
	var collidingRight = place_meeting(x + 1, y, Obj_Collision);
	
	var collidingUp = place_meeting(x, y - 1, Obj_Collision); 
	
	var collidingDown = place_meeting(x, y + 1, Obj_Collision);
	
	
	var running = false;

	if (keyboard_check(ord("X")))
	{
		running = true;	
	}
	else
	{
		running = false;	
	}
	
	//Check for Keyboard Check
	if (!running)
	{
		if (checkLeft && !collidingLeft)
		{
			speedH = -1;
		}
		else if (checkRight && !collidingRight)
		{
			if (!checkLeft && !collidingRight)
			{
				speedH = 1;
			}
			else if (checkLeft && !collidingLeft)
			{
				speedH = 0;
			}
		}
		else
		{
			speedH = 0;	
		}
		
		if (checkUp && !collidingUp)
		{
			speedV = -1;
		}
		else if (checkDown && !collidingDown)
		{
			if (!checkUp && !collidingDown)
			{
				speedV = 1;
			}
			else if (checkUp && !collidingUp)
			{
				speedV = -1;
			}
		}
		else
		{	
			speedV = 0;
		}
		
		
		if (speedH != 0 && speedV != 0)
		{
			//Normalize the vector 
			var length = sqrt(speedH * speedH + speedV * speedV);
			
			speedH /= length;
			speedV /= length;
			speedH *= 8.5;
			speedV *= 8.5;
		}
		else
		{
			speedH *= 5.5;
			speedV *= 5.5;	
		}
		
		speedH /= (60/30);
		speedV /= (60/30);
		
		speedH = round(speedH);
		speedV = round(speedV);
		
	}
	else
	{
		if (checkLeft && !collidingLeft)
		{
			speedH = -1;
		}
		else if (checkRight && !collidingRight)
		{
			if (!checkLeft && !collidingRight)
			{
				speedH = 1;
			}
			else if (checkLeft && !collidingLeft)
			{
				speedH = 0;
			}
		}
		else
		{
			speedH = 0;	
		}
		
		if (checkUp && !collidingUp)
		{
			speedV = -1;
		}
		else if (checkDown && !collidingDown)
		{
			if (!checkUp && !collidingDown)
			{
				speedV = 1;
			}
			else if (checkUp && !collidingUp)
			{
				speedV = -1;
			}
		}
		else
		{	
			speedV = 0;
		}
		
		if (speedH != 0 && speedV != 0)
		{
			//Normalize the vector 
			var length = sqrt(speedH * speedH + speedV * speedV);
			
			speedH /= length;
			speedV /= length;	
			speedH *= 13.5;
			speedV *= 13.5;
		}
		else
		{
			speedH *= 9.5;
			speedV *= 9.5;
		}
		
		speedH /= (60/30);
		speedV /= (60/30);
		
		speedH = round(speedH);
		speedV = round(speedV);

		
	}
	
	

	move_and_collide(speedH, speedV, Obj_Collision_Parent);

}