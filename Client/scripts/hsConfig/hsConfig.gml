/// @function hsConfig(baseUrl) 
/// @description Initializes Highscore system
/// @param {string} baseUrl Base URL of further JSON requests

#macro M_INVALID_INPUT "[invalid]";

enum enmRequests 
{
	iAuth,
	iRegister,
	iLogin,
	iCustomPostScore,
	iCustomGetAttempts,
	_blank,
	_size
}

randomize();
hsBaseUrl = argument0;
hsCallback = "";
hsRequestMode = 0;
hsRequestFlag = false;
hsTransaction = "";
hsTransactionMap = undefined;