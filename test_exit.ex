include std/console.e

puts(1, "Entre com S ou N: ")
sequence input = gets(0)
printf(1, "Resposta: %s\r\n", input)
if equal(input,"S") or equal(input, "s") or 1 then
	puts(1, "Encerrando...")
	abort(0)
end if

any_key()