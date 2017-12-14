include std/text.e
include std/console.e

include util/util.e

sequence text = "MAÇÃ É BOM"
sequence striped_text = "MACA E BOM"

printf(1, "Texto original: %s\r\n", {text})
printf(1, "Em caixa baixa: %s\r\n", {lower(text)})
printf(1, "Sem acentos: %s\r\n", {removeAccents(text)})
printf(1, "Tamanho das strings: %d!=%d\r\n", {length(text), length(striped_text)})

any_key()