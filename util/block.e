--- DEFINIÇÕES
namespace block

include util/list.e
include util/dictionary.e

public type block(object input)
	return dictionary(input)
end type

-- MÉTODOS PÚBLICOS
public function new(sequence text, integer column, integer row)
	block result = dictionary:empty()
	setText(result, text)
	setColumn(result, column)
	setRow(result, row)
	return result
end function

public function listTexts(list blockList)
	list result = list:empty()
	for i=0 to list:size(blockList)-1 do
		block blo = list:get(blockList, i)
		sequence text = getText(blo)
		list:add(result, text)
	end for
	return result
end function

-- GETTERS E SETTERS
public function getText(block block)
	return dictionary:get(block, "text")
end function
public procedure setText(block block, sequence text)
	dictionary:put(block, "text", text)
end procedure

public function getColumn(block block)
	return dictionary:get(block, "column")
end function
public procedure setColumn(block block, integer column)
	dictionary:put(block, "column", column)
end procedure

public function getRow(block block)
	return dictionary:get(block, "row")
end function
public procedure setRow(block block, integer row)
	dictionary:put(block, "row", row)
end procedure 