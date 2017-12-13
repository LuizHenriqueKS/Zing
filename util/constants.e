--name		: constants
--version	: 1.0.0.0
global constant
	true = 1,
	false = 0,
	default = 1,
	null = {"class: Null"},
	MAX_INTEGER = 1073741823

type boolean(atom input)
	return input=0 or input=1
end type