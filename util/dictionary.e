--Author	: André Luiz
--Version	: 1.0.0.4
---MÉTODOS E FUNÇÕES:
--empty()		--FUNCTION
--put()			-- PROCEDURE
--get()			--FUNCTION
--containsKey()	--FUNCTION
--remove()		-- PROCEDURE
--size()		--FUNCTION
--listKeys()	--FUNCTION
namespace dictionary
include std/map.e
include util/list.e

--TIPO DICIONÁRIO
global type dictionary(object input)
	--TIPO DICIONÁRIO
	return map(input)
end type

--INSTANCIA UM DICIONÁRIO VÁZIO.
public function empty()
	return new()
end function


--ADICONA UMA CHAVE E ATRIBUI DADOS A ELA.
public procedure put(dictionary dict, object key, object value)
	--ADICIONA UMA CHAVE AO DICIONÁRIO.
	if dictionary(dict) then
		map:put(dict, key, value)
	else
		puts(1, "erro:\n")
	end if
end procedure


--PEGA OS DADOS DE UMA CHAVE.
--CASO NÃO TENHA NADA RETORNA UM VOID.
public function get(dictionary dict, object key)
	if dictionary(dict) and containsKey(dict, key) then
		return map:get(dict, key)
	else
		--CASO NÃO SEJA UM DICIONÁRIO.
		--OU A CHAVE NÃO EXISTE.
		return void
	end if
end function


--VERIFICA SE EXISTE A CHAVE.
--RETORNA TRUE/FALSE.
public function containsKey(dictionary dict, object key)
	return map:has(dict, key)
end function


--REMOVE UMA CHAVE.
--CASO NÃO TENHA RETORNA UM PUTS(ERROR).
public procedure remove(dictionary dict, object key)
	if dictionary(dict) and containsKey(dict, key) then
		map:remove(dict, key)
	else
		puts(1, "error:\n")
	end if
end procedure


--RETORNA O QUANTAS CHAVES TEM.
--CASO NÃO TENHA NENHUMA RETORNA -1.
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

--LISTA TODAS AS CHAVES JÁ CRIADAS.
--CASO NÃO TENHA RETORNA UM VOID.
public function listKeys(dictionary dict, integer sorted_result = 0)
	if dictionary(dict) then
		return list:from(map:keys(dict, sorted_result))
	else
		return void
	end if
end function

