-- DECLARAÇÕES
namespace zingBlockListParser

include std/text.e
include script/block.e
include script/engine.e
include script/blockList.e
include script/commandBuilder.e

include util/util.e
include util/list.e
include util/constants.e
include util/dictionary.e

-- MÉTODOS
public function parseBlockList(engine eng, sequence source)
	sequence alphabet = "abcdefghijklmnopqrstuvxwyz0123456789"
	dictionary commandNameDict = getCommandNameDictionary(eng)
	blockList result = blockList:new(eng)
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
		atom letter = letterInfo[3]
		
		boolean isSymbol = find(lower(letter), alphabet)=0
		--printf(1, "%s -> %d\r\n", {letter,find(letter, alphabet)})		
		
		-- NOVA LINHA
		if equal(letter, '\n') then
			row += 1
			column = 0
		end if
		
		if (isSymbol xor wasSymbol) or (isSymbol) then
			if not util:isEmpty(buffer) then
				
				-- É O PADRÃO DE UM COMANDO
				if dictionary:containsKey(commandNameDict, buffer & letterInfo[2]) then
					buffer &= letterInfo[2]
					wasSymbol = isSymbol
					continue
				end if
				
				blockList:add(result, block:new(buffer,startColumn, startRow))
			end if 
			
			buffer = letterInfo[2]
			startColumn = column
			startRow = row
		else 
			buffer &= letterInfo[2]
		end if
		wasSymbol = isSymbol
		
	end for
	
	if not util:isEmpty(buffer) then
		blockList:add(result, block:new(buffer,0,0))
	end if 
	
	return result
end function

function getLetterInfo(sequence source, integer index, integer len)
	if index+1>len then
		return {1, {source[index]}, source[index]}
	end if
	sequence w_char = {source[index], source[index+1]}
	sequence result = removeAccents(w_char)
	if equal(w_char, result) then
		return {1, {source[index]}, source[index]}
	else 
		return {2, w_char, result[1]}
	end if
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
		sequence names = commandBuilder:getPatterns(cb)
		for j=1 to length(names) do
			sequence name = names[j]
			sequence part = ""
			for l=1 to length(name) do
				atom letter = name[l]
				part &= {letter}
				boolean value = false
				--VERIFICA SE JÁ TEM PARTE DO COMANDO
				if dictionary:containsKey(result, part) then
					--OBTEM O VALOR
					value = dictionary:get(result, part)
				end if
				--ATUALIZA O VALOR
				dictionary:put(result, part, value or l=length(name))
			end for
		end for
		
	end for
	
	return result
end function