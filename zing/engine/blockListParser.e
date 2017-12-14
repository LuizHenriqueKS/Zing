-- DECLARAÇÕES
namespace zingBlockListParser

include script/block.e
include script/engine.e

include util/list.e
include util/dictionary.e

-- MÉTODOS
public function parseBlockList(engine eng, sequence source)
	sequence alphabet = "abcdefghijklmnopqrstuvxwyz0123456789"
	dictionary commandNameDict = getCommandNameDictionary(eng)
	
	
	
	return list:from({block:new("em", 0, 0),block:new("desenvolvimento",0,0)})
end function

--MONTA UM DICIONARIO COM O NOME DOS COMANDOS E O CAMINHO DO COMANDO
--EX: COMANDO: ===
--    dict.put("=", false)
--    dict.put("==", false)
--    dict.put("===", true)
public function getCommandNameDictionary(engine eng)
	dictionary result = dictionary:empty()
	list commandBuilderList = getCommandBuilderList(eng)
	
	for i=0 to list:size(commandBuilderList) do
		commandBuilder cb = list:get(commandBuilderList, i)	
		
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
				if dictionary:containsKey(part) then
					--OBTEM O VALOR
					value = dictionary:get(part)
				end if
				--ATUALIZA O VALOR
				dictionary:put(part, value or i==length(name))
			end for
		end for
		
	end for
end function