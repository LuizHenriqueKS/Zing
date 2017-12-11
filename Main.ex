puts(1, "Hello world")
--<Code>
--André Luiz
	include std/sequence.e
	sequence var = {"Ola,", " mundo!"}
	printf(1, "\n%s\n", {join(var, "")})
--</Code>
system("pause")