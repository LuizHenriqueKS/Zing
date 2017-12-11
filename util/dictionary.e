--Author	: Andr� Luiz
--Version	: 1.0.0.0
namespace dictionary
include std/map.e

export sequence listVar = void

global type dictionary(object input)
	--TIPO DICION�RIO
	return object(input)
end type

public function empty()
	--INSTANCIA UM DICION�RIO V�ZIO.
	return new()
end function

public procedure put(object dict, sequence nameKey, object input)
	--ADICIONA UMA CHAVE AO DICION�RIO.
	map:put(dict, nameKey, input)
	listVar = append(listVar, nameKey)
end procedure

public function get(object dict, sequence nameKey)
	if map(dict) then
		if (find(nameKey, listVar) > 0) then
			return map:get(dict, nameKey)
		else
			--Caso a chave n�o exista.
			return void
		end if
	else
		--Caso n�o seja um dictionary.
		return void
	end if
end function
--public function 