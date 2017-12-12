--name		: constants
--version	: 1.0.0.0
global constant
	true = 1,
	false = 0,
	default = 1,
	void = {"class: Void"},
	null = {"class: Null"},
	MAX_INTEGER = 1073741823

global type isVoid(object arg)
	return equal(arg, void)
end type