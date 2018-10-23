/// @description Insert description here
// You can write your code in this editor

hsHttpBeginRequest();

if (hsHttpRequestOk())
{
	hsHttpRequestDB(hsHttpGetRequestIndex());
}

var flag = false;

if (ds_map_find_value(async_load, "id") == post)
{
   if (ds_map_find_value(async_load, "status") == 0)
   {
      callback = ds_map_find_value(async_load, "result");
	  flag = true;
   }
}

if (flag)
{
	if (getMode == 0)
	{
		// Check user finished here
		if (callback == "true")
		{
		    pass = "";
			for (var i = 0; i < 3; i++)
			{
				for (var j = 0; j < 3; j++)
				{
					pass += chr(choose(irandom_range(97, 122), irandom_range(48, 57)));	
				}
				if (i != 2) {pass += "-";}
			}
			show_message("Your new password is: " + pass);
			
			post = http_post_string("http://localhost:55558/Home/PostUser?", "name=" + name + "&pass=" + pass);
			getMode = 2;
		}
		else 
		{
		       pass = get_string("Provide password associated", "");	
			   post = http_post_string("http://localhost:55558/Home/PostScore?", "name=" + string(name) + "&pass=" + string(pass) + "&score=" + string(score));
		       getMode = 3;
		}
	}	
	else if (getMode == 2)
	{
		callback = string_replace_all(callback, "\"", "");
		
		if (callback == "ok")
		{
			show_message("Account '" + name + "' registered");	
			pass = get_string("Provide password associated", "");
			post = http_post_string("http://localhost:55558/Home/PostScore?", "name=" + string(name) + "&pass=" + string(pass) + "&score=" + string(score));
		    getMode = 3;
		}
		else
		{
			show_message("Registration failed, username already taken");	
		}
	}
	else if (getMode == 3)
	{
		callback = string_replace_all(callback, "\"", "");
		if (callback == "ok")
		{
			show_message("Score added successfuly");
		}
		else if (callback == "errorWrongPassword")
		{
			show_message("Wrong password provided");	
		}
		else
		{
			show_message("Something with POST request went wrong");	
		}
	}
	else if (getMode == 5) 
	{
		callback = string_replace_all(callback, "\"", "");
		
		if (real(callback))
		{
			show_message("Position of this user is: " + callback);	
		}
	}
	else if (getMode == 6)
	{
		a = 1;
		var json = ds_map_find_value(async_load, "result");
	    var theJsonMap = json_decode(json);  
        var theList = ds_map_find_value(theJsonMap, "default");
		
		global.totalCards2 = ds_list_size(theList);
		global.cardData2 = ds_grid_create(global.totalCards2, 5);
		
	    for (var i = 0; i < global.totalCards2; i++)
	    {
	        var theEntry = ds_list_find_value(theList, i);
	        global.cardData2[# i, 0] = theEntry[? "Id"];
	        global.cardData2[# i, 1] = theEntry[? "Timestamp"];
	        global.cardData2[# i, 2] = theEntry[? "Score"];
			global.cardData2[# i, 3] = theEntry[? "UserId"];
			global.cardData2[# i, 3] = theEntry[? "UserName"];
	    }
		show_message(global.cardData2[# 0, 0]);
		      // opravuje memory leak  
      ds_map_destroy(theJsonMap);	
    			
	}
	
}

if (ds_map_find_value(async_load, "status") == 0)
{
	if (getMode == 1)
	{
		var json = ds_map_find_value(async_load, "result");
	    var theJsonMap = json_decode(json);  

        var theList = ds_map_find_value(theJsonMap, "default");
		
		global.totalCards = ds_list_size(theList);
		global.cardData = ds_grid_create(global.totalCards, 5);
		
    for (var i = 0; i < global.totalCards; i++)
    {
        var theEntry = ds_list_find_value(theList, i);
        global.cardData[# i, 0] = theEntry[? "Id"];
        global.cardData[# i, 1] = theEntry[? "Timestamp"];
        global.cardData[# i, 2] = theEntry[? "Score"];
		global.cardData[# i, 3] = theEntry[? "UserId"];
		global.cardData[# i, 3] = theEntry[? "UserName"];
    }

      // opravuje memory leak  
      ds_map_destroy(theJsonMap);	
	  renderHi = true;
	}
}