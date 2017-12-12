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

--EXECUTA O SCRIPT
zing eng = zing:new()
engine:eval(eng, scriptFile)

any_key()