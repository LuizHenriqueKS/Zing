-- DECLARAÇÕES
namespace command

include script/block.e
include script/engine.e

include util/dictionary.e

public type command(object input)
	return dictionary(input)
end type

-- CONSTRUTORES
public function new(engine eng, block blo, sequence name, integer execute = -1)
	command result = dictionary:empty()
	setEngine(result, eng)
	setBlock(result, blo)
	setName(result, name)
	setExecute(result, execute)
	return result
end function

-- GETTERS E SETTERS
public function getName(command c)
	return dictionary:get(c, "name")
end function
public procedure setName(command c, sequence name)
	dictionary:put(c, "name", name)
end procedure

public function getEngine(command c)
	return dictionary:get(c, "engine")
end function
public procedure setEngine(command c, engine eng)
	dictionary:put(c, "engine", eng)
end procedure

public function getBlock(command c)
	return dictionary:get(c, "block")
end function
public procedure setBlock(command c, block blo)
	dictionary:put(c, "block", blo)
end procedure

public function getExecute(command c)
	return dictionary:get(c, "execute")
end function
public procedure setExecute(command c, integer routineId)
	dictionary:put(c, "execute", routineId)
end procedure