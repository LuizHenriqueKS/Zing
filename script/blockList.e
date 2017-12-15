-- DECLARAÇÃO
namespace blockList

include script/block.e
include script/engine.e

include util/list.e
include util/dictionary.e

public type blockList(object input)
	return dictionary(input)
end type

-- CONSTRUTORES
public function new(engine eng)
	blockList result = dictionary:empty()
	setEngine(result, eng)
	setIndex(result, -1)
	setList(result, list:empty())
	return result
end function

-- MÉTODOS PÚBLICOS
public procedure add(blockList bl, block blo)
	list l = getList(bl)
	list:add(l, blo)
end procedure

public function size(blockList bl)
	list l = getList(bl)
	return list:size(l)
end function

public function isEof(blockList bl)
	integer s = size(bl)
	integer index = getIndex(bl)
	return index>=s
end function

public function next(blockList bl)
	integer index = getIndex(bl)
	index += 1
	setIndex(bl, index)
	return isEof(bl)
end function

public function prev(blockList bl)
	integer index = getIndex(bl)
	index -= 1
	setIndex(bl, index)
	return index<=0
end function 

public procedure first(blockList bl)
	setIndex(bl, 0)
end procedure

public procedure last(blockList bl)
	setIndex(bl, size(bl)-1)
end procedure

public procedure beforeFirst(blockList bl)
	setIndex(bl, -1)
end procedure

public function nextLeft(blockList bl, sequence patterns)
	while next(bl) do
		block blo = get(bl)
		sequence text = block:getText(blo)
		if find(text, patterns) then
			return true
		end if
	end while
	return false
end function

-- GETTERS E SETTERS
public function getEngine(blockList bl)
	return dictionary:get(bl, "engine")
end function
public procedure setEngine(blockList bl, engine eng)
	dictionary:put(bl, "engine", eng)
end procedure

public function getIndex(blockList bl)
	return dictionary:get(bl, "index")
end function
public procedure setIndex(blockList bl, integer index)
	dictionary:put(bl, "index", index)
end procedure

public function getList(blockList bl)
	return dictionary:get(bl, "list")
end function
public procedure setList(blockList bl, list list)
	dictionary:put(bl, "list", list)
end procedure

public function get(blockList bl)
	return getByIndex(bl, getIndex(bl))
end function

public function getByIndex(blockList bl, integer index)
	list l = getList(bl)
	return list:get(l, index)
end function