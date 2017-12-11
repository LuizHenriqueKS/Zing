include dictionary.e
include util/constants.e

dictionary var = dictionary:empty()

dictionary:add("var1", "Ola")

? var

--printf(1, "%d\n", {var})

system("pause")