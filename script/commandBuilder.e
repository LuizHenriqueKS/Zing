-- DECLARAÇÕES
namespace commandBuilder

include util/constants.e
include util/dictionary.e

public type commandBuilder(object input)
	return dictionary(input)
end type

-- CONSTRUTORES
public function new(sequence patterns, integer builder)
	commandBuilder result = dictionary:empty()
	setPatterns(result, patterns)
	setCustom(result, false)
	setBuilder(result, builder)
	return result
end function

public function custom(sequence patterns, integer validator, integer builder)
	commandBuilder result = dictionary:empty()
	setPatterns(result, patterns)
	setCustom(result, true)
	setValidator(result, validator)
	setBuilder(result, builder)
	return result
end function

public function clone(commandBuilder cb)
	commandBuilder result = dictionary:clone(cb)
	return result
end function

-- MÉTODOS PÚBLICOS


-- GETTERS E SETTERS
public function getPatterns(commandBuilder cb)
	return dictionary:get(cb, "patterns")
end function
public procedure setPatterns(commandBuilder cb, sequence patterns)
	dictionary:put(cb, "patterns", patterns)
end procedure

public function getValidator(commandBuilder cb)
	return dictionary:get(cb, "validator")
end function
public procedure setValidator(commandBuilder cb, integer routineId)
	dictionary:put(cb, "validator", routineId)
end procedure

public function isCustom(commandBuilder cb)
	object value = dictionary:get(cb, "custom")
	if boolean(value) then
		return value
	else 
		return false
	end if
end  function
public procedure setCustom(commandBuilder cb, boolean custom)
	dictionary:put(cb, "custom", custom)
end procedure

public function getBuilder(commandBuilder cb)
	return dictionary:get(cb, "builder")
end function
public procedure setBuilder(commandBuilder cb, integer routineId)
	dictionary:put(cb, "builder", routineId)
end procedure

