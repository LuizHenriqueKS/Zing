include util/list.e

-- map meu = new()
-- map:put(meu, "a","b")
-- puts(1, map:get(meu,"a"))
-- printf(1, "%d\r\n", {calc_hash(meu, 9999)})

list minhaLista = list:empty()
list:add(minhaLista, "Primeiro item")
list:add(minhaLista, "Segundo item")

printf(1, "%s\r\n", list:get(minhaLista, 1))

system("pause")