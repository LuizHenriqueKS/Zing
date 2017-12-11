include util/dictionary.e
include util/constants.e

dictionary var = dictionary:empty()

dictionary:put(var, "k_1", "Teste 1")
dictionary:put(var, "k_2", "Teste 2")

? dictionary:listKeys(var)

system("pause")