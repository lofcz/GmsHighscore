/// @function hsUtilitiesProcessList([param1])
/// @description parses list of JSON entries
/// @param {string} [param1]

var json = ds_map_find_value(async_load, "result");
var theJsonMap = json_decode(json);  
var theList = ds_map_find_value(theJsonMap, "default");
var size = ds_list_size(theList);
var map = ds_grid_create(size, argument_count);

for (var i = 0; i < size; i++)
{
	var theEntry = ds_list_find_value(theList, i);
	
	for (var j = 0; j < argument_count; j++)
	{
		map[# i, j] = theEntry[? argument[j]];	
	}
}

hsTransactionMap = map;
ds_map_destroy(theJsonMap);	