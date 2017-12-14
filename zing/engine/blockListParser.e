-- DECLARAÇÕES
namespace zingBlockListParser

include std/text.e
include script/block.e
include script/engine.e
include script/commandBuilder.e

include util/constants.e
include util/list.e
include util/dictionary.e
include util/util.e

-- MÉTODOS
public function parseBlockList(engine eng, sequence source)
	sequence alphabet = "abcdefghijklmnopqrstuvxwyz0123456789"
	dictionary commandNameDict = getCommandNameDictionary(eng)
	list result = list:empty()
	sequence buffer = ""
	boolean wasSymbol = false
	integer len = length(source)
	integer row = 1
	integer column = 1
	integer startRow = 1
	integer startColumn = 1
	integer skip = 0
	
	for a=1 to length(source) do 
	
		if skip>0 then
			skip -= 1
			continue
		end if
	
		sequence letterInfo = getLetterInfo(source, a, len)
		skip = letterInfo[1]-1
		atom letter = letterInfo[2]
		
		boolean isSymbol = find(lower(letter), alphabet)=0
		printf(1, "%s -> %d\r\n", {letter,find(letter, alphabet)})
		
		if (isSymbol xor wasSymbol) or (isSymbol) then
			if not util:isEmpty(buffer) then
				list:add(result, block:new(buffer,startColumn, startRow))
			end if 
			buffer = {letter}
			startColumn = column
			startRow = row
		else 
			buffer &= letter
		end if
		wasSymbol = isSymbol
		
	end for
	
	if not util:isEmpty(buffer) then
		list:add(result, block:new(buffer,0,0))
	end if 
	
	return result
end function

function getLetterInfo(sequence source, integer index, integer len)
	return {1, source[index]}
end function

--MONTA UM DICIONARIO COM O NOME DOS COMANDOS E O CAMINHO DO COMANDO
--EX: COMANDO: ===
--    dict.put("=", false)
--    dict.put("==", false)
--    dict.put("===", true)
function getCommandNameDictionary(engine eng)
	dictionary result = dictionary:empty()
	list commandBuilderList = engine:getCommandBuilderList(eng)
	
	for i=0 to list:size(commandBuilderList)-1 do
		commandBuilder cb = list:get(commandBuilderList, i)	
		
		--VERIFICA SE NÃO É UM COMMAND BUILDER
		if not commandBuilder(cb) then
			continue
		end if
		
		--VERIFICA SE É UM COMANDO CUSTOMIZADO
		if (commandBuilder:isCustom(cb)) then
			continue -- SE É CUSTOMIZADO IGNORA
		end if
		
		--OBTEM OS NOMES DO COMANDO
		sequence names = commandBuilder:getNames(cb)
		for j=1 to length(names) do
			sequence name = names[j]
			sequence part = ""
			for l=1 to length(name) do
				sequence letter = name[l]
				part &= letter
				boolean value = false
				--VERIFICA SE JÁ TEM PARTE DO COMANDO
				if dictionary:containsKey(result, part) then
					--OBTEM O VALOR
					value = dictionary:get(result, part)
				end if
				--ATUALIZA O VALOR
				dictionary:put(result, part, value or i=length(name))
			end for
		end for
		
	end for
	
	return result
end function