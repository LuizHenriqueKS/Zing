include dictionary.e
include util/constants.e

dictionary var = dictionary:empty()

? var

dictionary:put(var, "key_1", "Ola ")
dictionary:put(var, "key_2", "mundo!")

? dictionary:get(var, "key_1")
? dictionary:get({}, "key_1")  -- n�o � um "dictionary"
? dictionary:get(var, "key_3") -- n�o existe essa chave.


system("pause")