-namespace list

include std/map.e
include util/constants.e

public type list(object value)
	return map(value)
end type

--INICIA UMA LISTA VAZIA
public function empty()
	list result = map:new()
	return result
end function

--INICIA UM LISTA A PARTIR DE ITEMS
public function from(object items)
	list result = empty()
	addAll(result, items)
	return result
end function

--INICIA UMA LISTA A PARTIR DE UMA SEQUENCIA
public function fromSequence(sequence seq)
	list result = empty()	addAll(result, seq)
	return result
end function

--INICIA UMA LISTA A PARTIR DE UMA LISTA
public function fromList(list items)
	list result = empty()
	addAll(result, items)
	return result
end function 

-- ADICIONA UM ITEM NA LISTA
public procedure add(list list, object item)
	integer index = size(list)
	map:put(list, index, item)
end procedure

-- ADICIONA VARIOS ITENS A LISTA
public procedure addAll(list lis, object items)
	if sequence(items) then
		addSequence(lis, items)
	else 
		if list(items) then
			addList(lis, items)
		else 
			trace("O tipo do 'items' n�o � reconhecido")
		end if
	end if
end procedure

-- INSERIR UM ITEM NUMA POSICAO
public procedure insert(list list, integer index, object item)
	for i=size(list) to index+1 by -1 do 
		map:put(list, i, get(list, i-1))
	end for
	map:put(list, index, item)
end procedure

-- ADICIONA UMA SEQUENCIA A LISTA
public procedure addSequence(list list, sequence seq)
	for i=1 to length(seq) do
		add(list, seq[i])
	end for
end procedure

-- ADICIONA UMA LISTA A LISTA
public procedure addList(list lis, list items)
	for i=0 to size(items)-1 do
		add(lis, get(items, i))
	end for
end procedure

-- ALTERA O VALOR DE UM DETERMINADO �NDICE
public procedure set(list list, integer index, object item)
	if index<0 or index>=size(list) then
		trace("index invalid: " & index)
	else 
		map:put(list, index, item)
	end if
end procedure

-- RETORNA UM ITEM DA LISTA
public function get(list list, integer index)
	if map:has(list, index) then
		return map:get(list, index)
	else 
		return null
	end  if
end function

-- REMOVE UM ITEM DA LISTA
-- RETORNA TRUE SE O ITEM FOI REMOVIDO
public function remove(list list, object item)
	return removeByIndex(list, indexOf(list, item))
end function

-- REMOVE O ITEM PELO �NDICE
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

-- OBTEM O �NDICE DO ITEM DENTRO DA LISTA
-- RETORNA -1 SE N�O ENCONTROU O ITEM NA LISTA
public function indexOf(list list, object item)
	for i = 0 to size(list) do
		if calc_hash(get(list,i), MAX_INTEGER) = calc_hash(item, MAX_INTEGER) then
			return i
		end if
	end for
	return -1
end function

-- OBTEM O �LTIMO �NDICE DO ITEM DENTRO DA LISTA
-- RETORNA -1 SE N�O ENCONTROU O ITEM NA LISTA
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

-- RETORNA TRUE SE A LISTA EST� VAZIA
public function isEmpty(list list)
	return size(list)=0
end function

-- RETORNA UMA SEQUENCIA DE UMA LSITA
public function toSequence(list list)
	sequence result = {}
	for i=0 to size(list)-1 do
		result &= get(list, i)
	end for
	return result
end function