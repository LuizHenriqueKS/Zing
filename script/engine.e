-- DECLARAÇÕES

namespace engine

include util/list.e
include util/constants.e
include util/dictionary.e

include script/block.e
include script/blockList.e

public type engine(object input)
	return dictionary(input)
end type

-- MÉTODOS PÚBLICOS

public function new()
	engine result = dictionary:empty()
	engine:setCommandBuilderList(result, list:empty())
	dictionary:put(result, "params", dictionary:empty())
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

public function parseCommandList(engine eng, blockList bl, sequence commandNames = null, sequence expectedPatterns = null)
	-- integer routineId = get(eng) 
	-- qlist result = call_func(routineId, {eng, blockList})
	list result = list:empty()
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
	object result = dictionary:get(eng, "commandBuilderList")
	if (list(result)) then
		return result
	else 
		return list:empty()
	end if
end function
public procedure setCommandBuilderList(engine eng, list commandBuilderList)
	dictionary:put(eng, "commandBuilderList", commandBuilderList)
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

public function getParam(engine eng, sequence name)
	dictionary params = dictionary:get(eng, "params")
	return dictionary:get(params, name)
end function
public procedure setParam(engine eng, sequence name, object value)
	dictionary params = dictionary:get(eng, "params")
	dictionary:put(params, name, value)
end procedure