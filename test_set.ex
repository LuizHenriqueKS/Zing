include std/console.e

include util/set.e
include util/util.e

procedure print_set(set s)
	for i=0 to set:size(s)-1 do 
		sequence value = set:get(s,i)
		printf(1, "%s\r\n", {value})
	end for
end procedure

puts(1, "Iniciando testes de set...\r\n")

set s = set:empty()
set:add(s, "Luiz")
set:add(s, "Luiz")
set:add(s, "Henrique")
set:insert(s, 1, "Henrique")

print_set(s)

puts(1, "\r\nTestes concluídos.\r\n")
any_key()