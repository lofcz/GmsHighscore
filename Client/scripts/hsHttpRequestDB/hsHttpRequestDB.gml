/// @function hsHttpRequestDB(index)
/// @description Defines how to process transations 
/// @ {enmRequests} index

var index = argument0;
var callback = hsHttpGetCallback();

#region Try auth 
if (index == enmRequests.iAuth)
{
	if (callback == "true")
	{
		var tempPass = hsUtilitiesGenPassword(3, 3);
		
		show_message("Registerning this account to you");	
		show_message("Your new password is " + tempPass);
		
		hsLocalUserSet(hsLocalUserGetTempName(), tempPass);
		hsTryRegister();
	}
	else
	{
		var tempPass = get_string("Auth with your password", "")
		hsTryLogin(tempPass);
	}
}
#endregion
#region Try register
if (index == enmRequests.iRegister)
{
	var cleanCallback = hsUtilitiesCleanCallback(callback);
	if (cleanCallback == "ok")
	{
		show_message("Registration done, you are now authed as '" + hsLocalUserGetName() + "'");	
		hsLocalUserSetAuthed(true);
	}
}
#endregion
#region Try login
if (index == enmRequests.iLogin)
{
	var cleanCallback = hsUtilitiesCleanCallback(callback);
	if (cleanCallback == "ok")
	{
		hsLocalUserSetAuthed(true);
		hsLocalUserSet(hsLocalUserGetTempName(), hsLocalUserGetTempPass());
		
		show_message("Login ok, you are now authed as '" + hsLocalUserGetName() + "'");	
	}
	else
	{
		show_message("Wrong password provided");	
	}
}
#endregion
#region Custom post score
if (index == enmRequests.iCustomPostScore)
{
	var cleanCallback = hsUtilitiesCleanCallback(callback);
	if (cleanCallback == "ok")
	{		
		show_message("Score posted");	
	}
	else
	{
		show_message("Session expired");	
	}
}
#endregion
#region Custom get all attempts
if (index == enmRequests.iCustomGetAttempts)
{
    hsUtilitiesProcessList("Id", "Timestamp", "Score", "UserId", "UserName");	
}
#endregion