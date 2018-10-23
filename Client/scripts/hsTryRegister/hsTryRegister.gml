/// @function hsTryRegister()
/// @description Registers new user

hsHttpPost(enmRequests.iRegister, hsHttpBuildQuery("PostUser", "name", hsLocalUserGetName(), "pass", hsLocalUserGetPass()));