/// @function hsHttpBuildQuery(action, [param1Name], [param1Value]..)
/// @description Builds query
/// {string} action
/// {string} [param1Name]
/// {type} [param1Value]

var r = hsBaseUrl + argument[0];

if (argument_count > 1) {r += "?";}

for (var i = 1; i < argument_count - 1; i += 2)
{
	if (i > 1) {r += "&";}
	r += string(argument[i]) + "=" + string(argument[i + 1]);
}

return r;