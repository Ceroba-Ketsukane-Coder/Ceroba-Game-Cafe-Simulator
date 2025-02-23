// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ReadInteractDialogue(top, checkAuth, boolArray)
{	
	
	var boolChecked = false;
	
	var runCheck = false;
	
	//If the parameter array exists
	if (array_length(boolArray) > 0 && !runCheck && checkAuth)
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
		}
	} 
	
	
	switch (runCheck)
	{
		case false:
			//Check if the boolean Value readText is true.
			if (readText)
			{
				//Set Player State to Read Dialogue so that the Player can't move until the dialogue stops. 
				Obj_Ceroba.state = cerobaPosition.READ;
	
				//If the textIndex is less than or equal to textToBeRead
				if (textIndex <= string_length(textToRead))
			    {
					//Set the textToGive variable to the string that is being read. 
			        textGive = string_copy(textToRead, 1, textIndex);
			
					//Replace all instances of \n with / so that it is read as one key
					var checkText = string_replace_all(textToRead, "\n", "#");
			
					//Get the current character.
			        var currentChar = string_char_at(checkText, textIndex + 1);

					//Switch statement for checking if the key is not one of the keys not required to be read
			        switch currentChar
					{
						//If the it is equal to any of these characters then do nothing.
						case " ":
						case ".":
							break;
						//Else if it is a character to be read 
						default:
							//Play the beep sound.
							audio_stop_sound(CerobaTalk);
							audio_play_sound(CerobaTalk, 1, false);
							break;
					}
					//Add to Index
					textIndex++;
			    } 

				//If the X key is pressed then set the text to max length. 
				if (keyboard_check_pressed(ord("X")))
				{
					textIndex = string_length(textToRead);
				}
		
		
				//Draw the sprites in the bottom if not set to top. 
				if (!top)
				{
					draw_sprite_ext(Spr_TextBox, image_index, camera_get_view_x(view_camera[0]) + 160, camera_get_view_y(view_camera[0]) + 200, 1.2, 1.2, image_angle, image_blend, image_alpha);
	
					if (textIndex % 16 == 0)
					{
						draw_sprite_ext(facialExpress, 0, camera_get_view_x(view_camera[0]) + 50, camera_get_view_y(view_camera[0]) + 200, 0.6, 0.6, image_angle, image_blend, image_alpha);
					}
					else
					{
						draw_sprite_ext(facialExpress, 1, camera_get_view_x(view_camera[0]) + 50, camera_get_view_y(view_camera[0]) + 200, 0.6, 0.6, image_angle, image_blend, image_alpha);
					}
	
					draw_set_font(DialogueText);
	
					draw_text_transformed(camera_get_view_x(view_camera[0]) + 85, camera_get_view_y(view_camera[0]) + 170, textGive, 1, 1, 0);
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
					
						textToRead = checkArray[0];
						
						break;
						
					case true:
					
						textToRead = checkArray[1];
						
						break;
				}
	
				//If the textIndex is less than or equal to textToBeRead
				if (textIndex <= string_length(textToRead))
			    {
					//Set the textToGive variable to the string that is being read. 
			        textGive = string_copy(textToRead, 1, textIndex);
			
					//Replace all instances of \n with / so that it is read as one key
					var checkText = string_replace_all(textToRead, "\n", "#");
			
					//Get the current character.
			        var currentChar = string_char_at(checkText, textIndex + 1);

					//Switch statement for checking if the key is not one of the keys not required to be read
			        switch currentChar
					{
						//If the it is equal to any of these characters then do nothing.
						case " ":
						case ".":
							break;
						//Else if it is a character to be read 
						default:
							//Play the beep sound.
							audio_stop_sound(CerobaTalk);
							audio_play_sound(CerobaTalk, 1, false);
							break;
					}
					//Add to Index
					textIndex++;
			    } 

				//If the X key is pressed then set the text to max length. 
				if (keyboard_check_pressed(ord("X")))
				{
					textIndex = string_length(textToRead);
				}
		
				//Draw the sprites in the bottom if not set to top. 
				if (!top)
				{
					draw_sprite_ext(Spr_TextBox, image_index, camera_get_view_x(view_camera[0]) + 160, camera_get_view_y(view_camera[0]) + 200, 1.2, 1.2, image_angle, image_blend, image_alpha);
	
					if (textIndex % 16 == 0)
					{
						draw_sprite_ext(facialExpress, 0, camera_get_view_x(view_camera[0]) + 50, camera_get_view_y(view_camera[0]) + 200, 0.6, 0.6, image_angle, image_blend, image_alpha);
					}
					else
					{
						draw_sprite_ext(facialExpress, 1, camera_get_view_x(view_camera[0]) + 50, camera_get_view_y(view_camera[0]) + 200, 0.6, 0.6, image_angle, image_blend, image_alpha);
					}
	
					draw_set_font(DialogueText);
	
					draw_text_transformed(camera_get_view_x(view_camera[0]) + 85, camera_get_view_y(view_camera[0]) + 170, textGive, 1, 1, 0);
				}

			}
			
			break;
	}
	
	
	
	
	
}
