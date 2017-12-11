--Author	: Andr� Luiz
--Version	: 1.0.0.4
---M�TODOS E FUN��ES:
--empty()		--FUNCTION
--put()			-- PROCEDURE
--get()			--FUNCTION
--existKey()	--FUNCTION
--remove()		-- PROCEDURE
--count()		--FUNCTION
--listKeys()	--FUNCTION
namespace dictionary
include std/map.e
include util/list.e

--LISTA AS CHAVES DE DICION�RIO J� ADICIONADA AT� O MOMENTO
list listVar = list:empty()

--TIPO DICION�RIO
global type dictionary(object input)
	--TIPO DICION�RIO
	return map(input)
end type

--INSTANCIA UM DICION�RIO V�ZIO.
public function empty()
	return new()
end function


--ADICONA UMA CHAVE E ATRIBUI DADOS A ELA.
public procedure put(object dict, sequence nameKey, object input)
	--ADICIONA UMA CHAVE AO DICION�RIO.
	if dictionary(dict) then
		map:put(dict, nameKey, input)
		list:add(listVar, nameKey)
	else
		puts(1, "erro:\n")
	end if
end procedure


--PEGA OS DADOS DE UMA CHAVE.
--CASO N�O TENHA NADA RETORNA UM VOID.
public function get(object dict, sequence nameKey)
	if dictionary(dict) and existKey(dict, nameKey) then
		return map:get(dict, nameKey)
	else
		--CASO N�O SEJA UM DICION�RIO.
		--OU A CHAVE N�O EXISTE.
		return void
	end if
end function


--VERIFICA SE EXISTE A CHAVE.
--RETORNA TRUE/FALSE.
public function existKey(object dict, sequence nameKey)
	if (list:indexOf(listVar, nameKey) > -1) then
		return true
	else
		return false
	end if
end function


--REMOVE UMA CHAVE.
--CASO N�O TENHA RETORNA UM PUTS(ERROR).
public procedure remove(object dict, sequence nameKey)
	if dictionary(dict) and existKey(dict, nameKey) then
		map:remove(dict, nameKey)
		list:remove(listVar, nameKey)
	else
		puts(1, "error:\n")
	end if
end procedure


--RETORNA O QUANTAS CHAVES TEM.
--CASO N�O TENHA NENHUMA RETORNA -1.
public function count(object dict)
	if dictionary(dict) then
		return list:size(listVar)
	else
		return -1
	end if
end function


--LISTA TODAS AS CHAVES J� CRIADAS.
--CASO N�O TENHA RETORNA UM VOID.
public function listKeys(object dict)
	if dictionary(dict) then
		object text = {}
		for i=0 to list:size(listVar)-1 do
			text = append(text, list:get(listVar, i))
		end for
		return text
	else
		return void
	end if
end function

