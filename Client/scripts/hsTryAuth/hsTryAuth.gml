/// @function hsTryAuth(name)
/// @description Tries to auth local player using credentials
/// @param {string} name Temp name used to auth

hsHttpPost(enmRequests.iAuth, hsHttpBuildQuery("CheckUser", "name", argument0));
hsLocalUserTempName = argument0;

