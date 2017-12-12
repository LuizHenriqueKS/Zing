-- INCLUDES

include std/io.e
include std/console.e

include util/list.e
include util/util.e
include util/constants.e
include util/dictionary.e

include zing/base/engine.e

-- CONSTANTES

constant SCRIPT_PATH = "resource/Script0001.zing"

-- MAIN

object scriptFile = open(SCRIPT_PATH, "r")
sequence scriptSource = read_file(scriptFile)
close(scriptFile)

zing eng = engine:new()
engine:eval(eng, scriptFile)

any_key()