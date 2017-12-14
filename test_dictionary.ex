-with trace
include util/dictionary.e
include util/constants.e
dictionary var = dictionary:empty()

dictionary:put(var, "k_1", "Teste 1")
dictionary:put(var, "k_2", "Teste 2")
dictionary:put(var, "k_3", "Teste 3")

--Retorna o número máximo de chaves existentes.
? dictionary:size(var)

--Pega o índice da chave do dicionário.
? dictionary:indexOf(var, "k_1")

--Um simples teste, para saber se as inf. estão corretas.
printf(1, "%s\n", {dictionary:getKeyByIndex(var, dictionary:indexOf(var, "k_1"))})

--Lista todas as chaves.
? dictionary:keys(var, 1)

--Listando os valores das chaves "k_1" e "k_3"
? dictionary:values(var, {"k_1", "k_3"})

--Remove uma chave do dicionário atravez do índice.
dictionary:removeByIndex(var, 1)

--Pega a ultima chave do dicionário.
? dictionary:getKeyByIndex(var, dictionary:size(var))

--Verifica se tem uma determinada chave do dicionário.
? dictionary:containsKey(var, "k_2")

--Lista todas as chaves.
? dictionary:keys(var, 1)

system("pause")