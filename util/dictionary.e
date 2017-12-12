--Author	: Andr� Luiz
--Version	: 1.0.0.6

-----FUN��ES:
--empty()			INSTANCIA;
--get()				PEGA OS DADOS;
--getKeyByIndex()	PEGA A CHAVE DO �NDICE DO DICION�RIO;
--containsKey()		VERIFICA SE TEM A CHAVE;
--indexOf()			PEGA O �NDICE DA CHAVE DO DICION�RIO;
--size()			PEGA A QUANTIDADE DE DE CHAVES REGISTRADAS;
--keys()			RETORNA EM {} TODAS AS CHAVES;

-----PROCEDIMENTOS:
--put()				ADICONA UMA CHAVE NO DICION�RIO;
--remove()			REMOVE UMA CHAVE DO DICION�RIO;
--removeByIndex()	REMOVE UMA CHAVE DO DICION�RIO COM O �NDICE.
namespace dictionary
include std/map.e

--TIPO DICION�RIO
global type dictionary(object input)
	return map(input)
end type


--INSTANCIA UM DICION�RIO V�ZIO.
public function empty()
	return map:new()
end function


--ADICONA UMA CHAVE E ATRIBUI DADOS A ELA.
public procedure put(dictionary dict, object key, object value)
	if dictionary(dict) then
		map:put(dict, key, value)
	else
		trace(1)
		--Talvez tenha esquecido de instanciar o dicion�rio.
		--dictionary DICT = dictionary:empty()
	end if
end procedure


--PEGA OS DADOS DE UMA CHAVE.
--CASO N�O TENHA NADA RETORNA UM VOID.
public function get(dictionary dict, object key)
	if dictionary(dict) and containsKey(dict, key) then
		return map:get(dict, key)
	else
		return void
	end if
end function


--PEGA O NOME DA CHAVE ATRAV�Z DO �NDICE.
--CASO N�O EXISTA A CHAVE � RETORNADO UM VOID.
public function getKeyByIndex(dictionary dict, integer index)
	object item = map:keys(dict, 1)
	for i=0 to map:size(dict) do
		if (i = index) then
			return item[i]
		end if
	end for
	return void
end function


--VERIFICA SE EXISTE A CHAVE.
--RETORNA TRUE/FALSE.
public function containsKey(dictionary dict, object key)
	return map:has(dict, key)
end function


--REMOVE UMA CHAVE.
--CASO N�O TENHA RETORNA DEBUGANDO.
public procedure remove(dictionary dict, object key)
	if dictionary(dict) and containsKey(dict, key) then
		map:remove(dict, key)
	else
		trace(1)
		--N�o existe essa chave
	end if
end procedure


--REMOVE UMA CHAVE ATRAV�Z DO �NDICE.
public procedure removeByIndex(dictionary dict, integer index)
	if (index <= map:size(dict)) and (index >= 1) then
		map:remove(dict, getKeyByIndex(dict, index))
	else
		trace(1)
		--O �ndice talvez tenha ou ultrapassou ou
		--� menor que a quantidade de chaves do dicion�rio.
	end if
end procedure


--RETORNA O �NDICE DO DICION�RIO ATRAV�Z DO NOME DA CHAVE.
--CASO N�O EXISTA O �NDICE RETORNA -1.
public function indexOf(dictionary dict, object key)
	object item = map:keys(dict, 1)
	for i=1 to map:size(dict) do
		if calc_hash(item[i], MAX_INTEGER) = calc_hash(key, MAX_INTEGER) then
			return i
		end if
	end for
	return -1
end function


--RETORNA O QUANTAS CHAVES TEM.
--CASO N�O TENHA NENHUMA RETORNA -1.
public function size(dictionary dict)
	if dictionary(dict) then
		return map:size(dict)
	else
		return -1
	end if
end function


--RETORNA UMA SEQUENCIA COM AS CHAVES
public function keys(dictionary dict, integer sorted_result = 0)
	return map:keys(dict, sorted_result)
end function
