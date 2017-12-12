include util/list.e
include util/util.e

-- map meu = new()
-- map:put(meu, "a","b")
-- puts(1, map:get(meu,"a"))
-- printf(1, "%d\r\n", {calc_hash(meu, 9999)})

list minhaLista = list:empty()
list:add(minhaLista, "Primeiro item")
list:add(minhaLista, "Segundo item")
list:add(minhaLista, "Terceiro item")


printf(1, "Tamanho da lista: %d\r\n", {list:size(minhaLista)})
list:removeByIndex(minhaLista, 0)
list:remove(minhaLista, "Segundo item")
printf(1, "%s\r\n", {list:get(minhaLista, 0)})

list listaNum = list:empty()
list:add(listaNum, 1)
list:add(listaNum, 2)
list:add(listaNum, 3)

list:remove(listaNum, 2)
list:lastIndexOf(listaNum, 1)

printf(1, "%d!=%d\r\n", {list:get(listaNum, 0),list:get(listaNum, 1)})

object i = 10
printf(1, "i is integer: %d\r\n", integer(i))
printf(1, "i is integer 2: %d\r\n", integer("i"))

printf(1, "listaNum is list: %d\r\n", list(listaNum))
printf(1, "listaNum is list: %d\r\n", list(0))

list listaSimples = list:from({1,2,4,5})
list:insert(listaSimples, 2, 3)
puts(1, "Lista simples: ")
print_s(1, list:toSequence(listaSimples))

system("pause")