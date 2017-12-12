namespace engine

type engine(object input)
	return dictionary(input)
end type

public function new()
	engine result = dictionary:empty()
	return result
end function

public function eval(engine eng, sequencie source)
	return null
end function