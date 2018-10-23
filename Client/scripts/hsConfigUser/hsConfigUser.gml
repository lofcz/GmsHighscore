/// @function hsConfigUser([name], [pass])
/// @description Initializes local cache for a user
/// @param {string} [name]
/// @param {string} [pass]

hsLocalUserName = "";
hsLocalUserPassword = "";
hsLocalUserAuthenticated = false;
hsLocalUserTempName = "";
hsLocalUserTempPass = "";

if (argument_count > 0) {hsLocalUserName = argument[0];}
if (argument_count > 1) {hsLocalUserPassword = argument[1];}
