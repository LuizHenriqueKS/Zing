namespace list

include std/map.e
include util/constants.e

public type list(map map)
	return 1
end type

--INICIA UMA LISTA VAZIA
public function empty()
	list result = map:new()
	return result
end function

-- ADICIONA UM ITEM NA LISTA
public procedure add(list list, object item)
	integer index = size(list)
	map:put(list, index, item)
end procedure

-- RETORNA UM ITEM DA LISTA
public function get(list list, integer index)
	return map:get(list, index)
end function

-- REMOVE UM ITEM DA LISTA
-- RETORNA TRUE SE O ITEM FOI REMOVIDO
public function remove(list list, object item)
	return removeByIndex(list, indexOf(list, item))
end function

-- REMOVE O ITEM PELO ÍNDICE
-- RETORNA TRUE SE O ITEM FOI REMOVIDO
public function removeByIndex(list list, integer index)
	if map:has(list, index) then
		for i = index to size(list)-1 do 
			map:put(list, i, map:get(list, i+1))
		end for
		map:remove(list, size(list))
		return 1
	else 
		return 0
	end if
end function

-- OBTEM O ÍNDICE DO ITEM DENTRO DA LISTA
-- RETORNA -1 SE NÃO ENCONTROU O ITEM NA LISTA
public function indexOf(list list, object item)
	for i = 0 to size(list) do
		if calc_hash(get(list,i), MAX_INTEGER) = calc_hash(item, MAX_INTEGER) then
			return i
		end if
	end for
	return -1
end function

-- OBTEM O ÚLTIMO ÍNDICE DO ITEM DENTRO DA LISTA
-- RETORNA -1 SE NÃO ENCONTROU O ITEM NA LISTA
public function lastIndexOf(list list, object item)
	for i = size(list)-1 to 0 by -1 do
		if calc_hash(get(list,i), MAX_INTEGER) = calc_hash(item, MAX_INTEGER) then
			return i
		end if
	end for
	return -1
end function

-- VERIFICA SE TEM O ITEM NA LISTA
-- RETONA TRUE SE TEM O ITEM
public function contains(list list, object item)
	return indexOf(list, item)>-1
end function 

-- RETORNA O TAMANHO ATUAL DA LISTA
public function size(list list)
	return map:size(list)
end function

-- RETORNA TRUE SE A LISTA ESTÁ VAZIA
public function isEmpty(list list)
	return size(list)=0
end function