-- DECLARAÇÕES

namespace engine

include util/list.e
include util/dictionary.e

public type engine(object input)
	return dictionary(input)
end type

-- MÉTODOS PÚBLICOS

public function new()
	engine result = dictionary:empty()
	return result
end function

--ESSE MÉTODO AINDA VAI MUDAR
public function evalCommandList(engine eng, list commandList)
	return null
end function

public function eval(engine eng, sequence source)
	list blockList = parseBlockList(eng, source)
	list commandList = parseCommandList(eng, blockList)
	object result = evalCommandList(eng, commandList)
	return result
end function

public function parseBlockList(engine eng, sequence source)
	integer routineId = getBlockListParser(eng) 
	list result = call_func(routineId, {eng, source})
	return result
end function

public function parseCommandList(engine eng, list blockList)
	integer routineId = getCommandListParser(eng) 
	list result = call_func(routineId, {eng, blockList})
	return result
end function

-- GETTERS E SETTERS
public function getBlockListParser(engine eng)
	return dictionary:get(eng, "blockListParser")
end function
public procedure setBlockListParser(engine eng, integer routineId)
	dictionary:put(eng, "blockListParser", routineId)
end procedure

public function getCommandBuilderList(engine eng)
	return dictionary:get(eng, "commandBuilderList")
end function
public procedure setCommandBuilderList(engine eng, integer routineId)
	dictionary:put(eng, "commandBuilderList", routineId)
end procedure

public function isCaseSensitive(engine eng)
	object value = dictionary:get(eng, "caseSensitive")
	if boolean(value) then
		return value
	else 
		return false
	end if
end function
public procedure setCaseSensitive(engine eng, boolean caseSensitive)
	dictionary:put(eng, "caseSensitive", caseSensitive)
end procedure