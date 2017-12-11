namespace list

public type list(sequence values)
	return length(values)=2
end type

--INICIA UMA LISTA VAZIA
public function empty()
	list result = {0,0}
	return result
end function

-- ADICIONA UM ITEM NA LISTA
public procedure add(list list, object item)
	sequence newItem = {item, 0}
	if isEmpty(list) then
		list[1] = {newItem}
		list[2] = newItem
	else 
		list[1] = append(list[1], newItem)
		list[2][size(list)-1][2] = newItem
	end if
end procedure

-- RETORNA UM ITEM DA LISTA
public function get(list list, integer index)
	return list[1][index+1][1]
end function

-- REMOVE UM ITEM DA LISTA
-- RETORNA TRUE SE O ITEM FOI REMOVIDO
public function remove(list list, object item)
	return removeByIndex(list, indexOf(list, item))
end function

-- REMOVE O ITEM PELO ÍNDICE
-- RETORNA TRUE SE O ITEM FOI REMOVIDO
public function removeByIndex(list list, integer index)
	return 0
end function

-- OBTEM O ÍNDICE DO ITEM DENTRO DA LISTA
-- RETORNA -1 SE NÃO ENCONTROU O ITEM NA LISTA
public function indexOf(list list, object item)
	return -1
end function

-- OBTEM O ÚLTIMO ÍNDICE DO ITEM DENTRO DA LISTA
-- RETORNA -1 SE NÃO ENCONTROU O ITEM NA LISTA
public function lastIndexOf(list list, object item)
	return -1
end function

-- VERIFICA SE TEM O ITEM NA LISTA
-- RETONA TRUE SE TEM O ITEM
public function contains(list list, object item)
	return indexOf(list, item)>-1
end function 

-- RETORNA O TAMANHO ATUAL DA LISTA
public function size(list list)
	if list[1]=0 then
		return 0
	end if
	return length(list[1])
end function

-- RETORNA TRUE SE A LISTA ESTÁ VAZIA
public function isEmpty(list list)
	return size(list)=0
end function