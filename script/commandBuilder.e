-- DECLARAÇÕES
namespace commandBuilder

include util/dictionary.e

public type commandBuilder(object input)
	return dictionary(input)
end type

-- CONSTRUTORES
public function new(sequence name, integer builder)
	commandBuilder result = dictionary:empty()
	setName(result, name)
	setCustom(result, false)
	setBuilder(result, builder)
	return result
end function

public function custom(sequence name, integer validator, integer builder)
	setName(result, name)
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
public function getName(commandBuilder cb)
	return dictionary:get(cb, "name")
end function
public procedure setName(commadBuilder cb, sequence name)
	dictionary:set(cb, "name", name)
end procedure

public function getValidator(commandBuilder cb)
	return dictionary:get(cb, "validator")
end function
public procedure setValidator(commandBuilder cb, integer routineId)
	dictionary:set(cb, "validator", routineId)
end procedure

public function isCustom(commandBuilder cb)
	object value = dictionary:get(cb, "custom")
	if boolean(value) then
		return value
	else 
		return false
	end if
end 
public procedure setCustom(commandBuilder cb, boolean custom)
	dictionary:set(cb, "custom", custom)
end procedure

public function getBuilder(commandBuilder cb)
	return dictionary:get(cb, "builder")
end function
public procedure setBuilder(commandBuilder cb, integer routineId)
	dictionary:set(cb, "builder", routineId)
end procedure

