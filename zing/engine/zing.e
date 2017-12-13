namespace zing

include script/engine.e

public type zing(object input)
	return engine(input)
end type

public function new()
	zing result = engine:new()
	return result
end function
