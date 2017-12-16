with trace
include util/openScript.e
include std/sequence.e as length
include std/convert.e

--ESCREVENDO EM UM ARQUIVO NOVO
integer f = ZingScripts:openFile("resource/Script0003.zing", "w")
ZingScripts:write(f, join({"Ola : ", to_string(ZingScripts:getRows("resource/Script0003.zing")), "\n"}, ""))
f=ZingScripts:closeFile(f)

--LENDO UM ARQUIVO
f = ZingScripts:openFile("resource/Script0003.zing")
object myScript = ZingScripts:readAll(f)
for i=1 to length(myScript) do
	printf(1, "%s", {myScript[i]})
end for

system("pause")