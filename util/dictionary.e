--Author	: Andr� Luiz
--Version	: 1.0.0.7

-----FUN��ES:
--empty()			INSTANCIA;
--get()				PEGA OS DADOS;
--getKeyByIndex()	PEGA A CHAVE DO �NDICE DO DICION�RIO;
--containsKey()		VERIFICA SE TEM A CHAVE;
--indexOf()			PEGA O �NDICE DA CHAVE DO DICION�RIO;
--size()			PEGA A QUANTIDADE DE DE CHAVES REGISTRADAS;
--keys()			RETORNA EM {ARRAY} TODAS AS CHAVES;
--values()			RETORNA EM {ARRAY} TODOS OS VALORES DA CHAVE;

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

--CLONA UM DICION�RIO -- VERIFICAR SE � TEM UMA MANEIRA NATIVA
public function clone(dictionary dict)
	dictionary result = dictionary:empty()
	sequence keys = dictionary:keys(dict)
	for i=0 to length(keys) do
		object key = keys[i]
		object value = dictionary:get(dict, key)
		dictionary:put(result, key, value)
	end for
	return result
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


--CLONA UM DICION�RIO PARA OUTRO;
--INCLUI CHAVES E VALORES.
public procedure clone(dictionary dict1, dictionary dict2)
	if dictionary(dict1) and dictionary(dict2) then
		map:copy(dict1, dict2)
	else
		trace(1)
		--O DICION�RIO "DICT1" OU "DICT2" PODE N�O SER
		--DE FATO UM DICION�RIO.
	end if
end procedure


--PEGA OS DADOS DE UMA CHAVE.
--CASO N�O TENHA NADA RETORNA UM NULL.
public function get(dictionary dict, object key)
	if dictionary(dict) and containsKey(dict, key) then
		return map:get(dict, key)
	else
		return null
	end if
end function


--PEGA O NOME DA CHAVE ATRAV�Z DO �NDICE.
--CASO N�O EXISTA A CHAVE � RETORNADO UM NULL.
public function getKeyByIndex(dictionary dict, integer index)
	object item = map:keys(dict, 1)
	for i=0 to map:size(dict) do
		if (i = index) then
			return item[i]
		end if
	end for
	return null
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
		--N�o existe essa chave ou o dicion�rio
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


--RESETA UM DICION�RIO POR COMPLETO.
public procedure clear(dictionary dict)
	if dictionary(dict) then
		map:clear(dict)
	else
		trace(1)
		--N�o existe essa chave ou o dicion�rio
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

--RETORNA OS VALORES DAS CHAVES
--SINTAXE DO PAR�NEMTRO KEY:
---dictionary:values([DICION�RIO])
---dictionary:values([DICION�RIO], {"chave1", "chave2"})
public function values(dictionary dict, object key = 0)
	return map:values(dict, key)
end function
