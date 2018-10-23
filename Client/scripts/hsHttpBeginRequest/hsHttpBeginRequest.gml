/// @function hsHttpBeginRequest()
/// @description Initializes transaction

hsRequestFlag = false;

if (ds_map_find_value(async_load, "id") == hsTransaction)
{
   if (ds_map_find_value(async_load, "status") == 0)
   {
      hsCallback = ds_map_find_value(async_load, "result");
	  hsRequestFlag = true;
   }
}