with trace
include util/dictionary.e
include util/constants.e
dictionary var = dictionary:empty()

dictionary:put(var, "k_1", "Teste 1")
dictionary:put(var, "k_2", "Teste 2")
dictionary:put(var, "k_3", "Teste 3")

--Retorna o n�mero m�ximo de chaves existentes.
? dictionary:size(var)

--Pega o �ndice da chave do dicion�rio.
? dictionary:indexOf(var, "k_1")

--Um simples teste, para saber se as inf. est�o corretas.
printf(1, "%s\n", {dictionary:getKeyByIndex(var, dictionary:indexOf(var, "k_1"))})

--Lista todas as chaves.
? dictionary:keys(var, 1)

--Listando os valores das chaves "k_1" e "k_3"
? dictionary:values(var, {"k_1", "k_3"})

--Remove uma chave do dicion�rio atravez do �ndice.
dictionary:removeByIndex(var, 1)

--Pega a ultima chave do dicion�rio.
? dictionary:getKeyByIndex(var, dictionary:size(var))

--Verifica se tem uma determinada chave do dicion�rio.
? dictionary:containsKey(var, "k_2")

--Lista todas as chaves.
? dictionary:keys(var, 1)

system("pause")