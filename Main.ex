-- INCLUDES --

include std/io.e
include std/console.e

include util/list.e
include util/util.e
include util/constants.e
include util/dictionary.e

include script/engine.e

include zing/engine/zing.e

-- CONSTANTES --

constant SCRIPT_PATH = "resource/Script0001.zing"

-- MAIN --

--LÊ O SCRIPT
object scriptFile = open(SCRIPT_PATH, "r")
sequence scriptSource = read_file(scriptFile)
close(scriptFile)

--EXIBE O SCRIPT QUE VAI SER EXECUTADO
puts(1, "Previsualização do script: \r\n")
puts(1, "=====================================\r\n")
printf(1, "%s\r\n", {scriptSource})
puts(1, "=====================================\r\n")
puts(1, "\r\n")

--EXECUTA O SCRIPT
puts(1, "Executando script: \r\n")
puts(1, "=====================================\r\n")
zing eng = zing:new()
object result = engine:eval(eng, scriptSource)
display(result)
puts(1, "=====================================\r\n")

any_key()