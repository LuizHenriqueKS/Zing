namespace set

include util/list.e
include util/constants.e

public type set(object value)
	return list(value)
end type

--INICIA UM SET VAZIO
public function empty()
	list result = list:empty()
	return result
end function

--INICIA UM SET A PARTIR DE ITEMS
public function from(object items)
	set result = empty()
	addAll(result, items)
	return result
end function

--INICIA UM SET A PARTIR DE UMA SEQUENCIA
public function fromSequence(sequence seq)
	set result = empty()	
	addAll(result, seq)
	return result
end function

--INICIA UM SET A PARTIR DE UM SET
public function fromList(list items)
	set result = empty()
	addAll(result, items)
	return result
end function 

-- ADICIONA UM ITEM NO SET
public function add(set set, object item)
	if contains(set, item) then
		return false
	else
		list:add(set, item)
		return true
	end if
end function

-- ADICIONA VARIOS ITENS AO SET
public procedure addAll(set s, object items)
	if sequence(items) then
		addSequence(s, items)
	else 
		if list(items) then
			addList(s, items)
		else 
			trace("O tipo do 'items' não é reconhecido")
		end if
	end if
end procedure

-- INSERIR UM ITEM NUMA POSICAO
public function insert(set set, integer index, object item)
	if contains(set, item) then
		return false
	else 
		list:insert(set, index, item)
		return true
	end if
end function

-- ALTERA UM VALOR EM UM DETERMINADO ÍNDICE
public function set(set set, integer index, object item)
	if contains(set, item) then
		if equal(get(set, index), item) then
			return true
		else 
			return false
		end if
	else 
		list:set(set, index, item)
		return true
	end if
end function

-- ADICIONA UMA SEQUENCIA AO SET
public procedure addSequence(set set, sequence seq)
	for i=1 to length(seq) do
		add(set, seq[i])
	end for
end procedure

-- ADICIONA UMA LISTA AO SET
public procedure addList(set s, list items)
	for i=0 to size(items)-1 do
		add(s, get(items, i))
	end for
end procedure

-- RETORNA UM ITEM DO SET
public function get(set set, integer index)
	return list:get(set, index)
end function

-- REMOVE UM ITEM DO SET
-- RETORNA TRUE SE O ITEM FOI REMOVIDO
public function remove(set set, object item)
	return removeByIndex(set, indexOf(set, item))
end function

-- REMOVE O ITEM PELO ÍNDICE
-- RETORNA TRUE SE O ITEM FOI REMOVIDO
public function removeByIndex(set set, integer index)
	return list:removeByIndex(set, index)
end function

-- OBTEM O ÍNDICE DO ITEM DENTRO DO SET
-- RETORNA -1 SE NÃO ENCONTROU O ITEM NO SET
public function indexOf(set set, object item)
	return list:indexOf(set, item)
end function

-- OBTEM O ÚLTIMO ÍNDICE DO ITEM DENTRO DO SET
-- RETORNA -1 SE NÃO ENCONTROU O ITEM NO SET
public function lastIndexOf(set set, object item)
	return list:lastIndexOf(set, item)
end function

-- VERIFICA SE TEM O ITEM NO SET
-- RETONA TRUE SE TEM O ITEM
public function contains(set set, object item)
	return indexOf(set, item)>-1
end function 

-- RETORNA O TAMANHO ATUAL DO SET
public function size(set set)
	return list:size(set)
end function

-- RETORNA TRUE SE O SET ESTÁ VAZIO
public function isEmpty(set set)
	return size(set)=0
end function

-- RETORNA UMA SEQUENCIA DE UM SET
public function toSequence(set set)
	return list:toSequence(set)
end function