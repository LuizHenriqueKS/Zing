include std/console.e

include util/list.e
include util/constants.e
include util/util.e

include script/block.e
include script/engine.e

include zing/engine/zing.e

sequence source = "var numero = 10f+1f;\r\n"
list expectedResult = list:from({"var"," ", "numero", " ", "=", "10f", "+", "1f", ";" , "\r\n"})

zing e = zing:new()
list result = engine:parseBlockList(e, source)

if list:size(source)!=list:size(expectedResult) then
	printf(1, "Tamanhos diferentes: %d(esperado) != %d(obtido)\r\n", {list:size(expectedResult),list:size(result)})
	puts(1, "Esperado: ")
	print_l(1, expectedResult)
	puts(1, "Obtido: ")
	print_l(1, block:listTexts(result))
	
end if

integer diff = 0
puts(1, "Comparando: \r\n")
puts(1, "===========================================\r\n")
for i=0 to list:size(result) do
	block blo = list:get(result, i)
	sequence text = block:getText(blo)
	sequence expected = list:get(expectedResult, i)
	if equal(text,expected) then
		printf(1, "%s=%s\r\n", {text, expected})
	else
		printf(1, "%s!=%s\r\n", {text, expected})
	end if
end for	
puts(1, "===========================================\r\n")
printf(1, "Quantidade de diferenças: ", diff)

any_key()