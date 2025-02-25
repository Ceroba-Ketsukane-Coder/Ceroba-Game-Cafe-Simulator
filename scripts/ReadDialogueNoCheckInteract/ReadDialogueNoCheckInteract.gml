// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ReadDialogueNoCheckInteract(top)
{
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
								
								
	if (textIndex >= string_length(textToRead))
	{
		draw_set_font(DialogueText);
									
		draw_text_transformed(camera_get_view_x(view_camera[0]) + 130, camera_get_view_y(view_camera[0]) + 203, "Yes", 1, 1, 0);
									
		draw_text_transformed(camera_get_view_x(view_camera[0]) + 210, camera_get_view_y(view_camera[0]) + 203, "No", 1, 1, 0);
									
		switch (decisionPosition)
		{
			case 0:
				draw_sprite_ext(Spr_Ceroba_Soul, image_index, camera_get_view_x(view_camera[0]) + 120, camera_get_view_y(view_camera[0]) + 210, 0.7, 0.7, image_angle, image_blend, image_alpha);
				break;
											
			case 1:
				draw_sprite_ext(Spr_Ceroba_Soul, image_index, camera_get_view_x(view_camera[0]) + 200, camera_get_view_y(view_camera[0]) + 210, 0.7, 0.7, image_angle, image_blend, image_alpha);
				break;
		}
	}
}