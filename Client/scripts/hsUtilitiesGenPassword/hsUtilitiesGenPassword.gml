/// @function hsUtilitiesGenPassword(sections, sectionLenght)
/// @description Generates new pseudo-random password
/// @param {int} sections
/// @param {int} sectionLenght

var pass = "";
for (var i = 0; i < argument0; i++)
{
	for (var j = 0; j < argument1; j++)
	{
		pass += chr(choose(irandom_range(97, 122), irandom_range(48, 57)));	
	}
	if (i != (argument1 - 1)) {pass += "-";}
}

return pass;