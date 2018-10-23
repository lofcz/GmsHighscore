/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width / 2, 60, "Score: " + string(score));
draw_text(room_width / 2, 60 + 24, hsLocalUserGetAuthed() ? "Authed as '" + hsLocalUserGetName() + "'" : "Not authed. [Q] to auth.");


if (keyboard_check_pressed(ord("Q")))
{
	// Performs entire register / login process
	if (!hsLocalUserGetAuthed())
	{
		hsTryAuth(get_string("Enter your username: ", ""));
	}
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (hsLocalUserGetAuthed())
{
	draw_text(20, 100, "[A] - Save score\n[S] - Get your attempts\n[D] - Get position in ladder");	
	
	if (hsTransactionGetMap() != undefined)
	{
		for (var i = 0; i < ds_grid_width(hsTransactionGetMap()); i++)
		{
			draw_text(20, 180 + i * 24, "Score: " + string(hsTransactionMap[# i, 2]) + " Entry Id: " + string(hsTransactionMap[# i, 0])); 
		}
	}
	
	// Post score
	if (keyboard_check_pressed(ord("A")))
	{
		// Build custom query
		hsHttpPost(enmRequests.iCustomPostScore, hsHttpBuildQuery("PostScore", "score", score, "name", hsLocalUserGetName(), "pass", hsLocalUserGetPass()));
	}
	
	// Get all attempts
	if (keyboard_check_pressed(ord("S")))
	{
		hsHttpGet(enmRequests.iCustomGetAttempts, hsHttpBuildQuery("GetAllUserEntries", "user", hsLocalUserGetName()));
	}
}



// RBM to generate new score
if (mouse_check_button_pressed(mb_right))
{
	event_user(0);	
}

if (renderHi)
{
	for (var i = 0; i < ds_grid_width(global.cardData); i++)
	{
		draw_text(20, room_height / 2 + 24 + (i + 1) * 24, string(global.cardData[# i, 2]) + " - " + string(global.cardData[# i, 3])); 	
	}
}

if (a)
{
	for (var i = 0; i < ds_grid_width(global.cardData2); i++)
	{
		draw_text(20, room_height / 2 + 24 + (i + 1) * 24, string(global.cardData2[# i, 0])); 	
	}		
}