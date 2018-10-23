/// @function hsTryLogin(pass)
/// @description Tries to login 
/// @param {string} pass

hsHttpPost(enmRequests.iLogin, hsHttpBuildQuery("CheckPassword", "name", hsLocalUserGetTempName(), "pass", argument0));
hsLocalUserTempPass = argument0;