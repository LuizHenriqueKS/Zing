--name		: constants
--version	: 1.0.0.0
global constant
	true = 1,
	false = 0,
	default = 1,
	void = {{}, {}}

global type isVoid(object arg)
	return equal(arg, void)
end type
