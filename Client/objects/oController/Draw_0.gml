/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width / 2, room_height / 2, "Score: " + string(score));
draw_text(room_width / 2, room_height / 2 + 24, callback != "" ? callback : "");

// LMB to save
if (mouse_check_button_pressed(mb_left))
{
    name = get_string("Name", "user");
	post = http_post_string("http://localhost:55558/Home/CheckUser?", "name=" + name);
	getMode = 0;
}

// RBM to generate new score
if (mouse_check_button_pressed(mb_right))
{
	event_user(0);	
}

if (keyboard_check_pressed(ord("A")))
{
	http_get("http://localhost:55558/Home/GetAllScore");
	getMode = 1;
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (renderHi)
{
	for (var i = 0; i < ds_grid_width(global.cardData); i++)
	{
		draw_text(20, room_height / 2 + 24 + (i + 1) * 24, string(global.cardData[# i, 2]) + " - " + string(global.cardData[# i, 3])); 	
	}
}