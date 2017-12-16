--DECLARANDO A NAMESPACE
namespace ZingScripts
include std/filesys.e as file_exists
include std/sequence.e as length

--ABRINDO UM ARQUIVO.
public function openFile(sequence path, sequence mode = "r")
	-- ## MODE ##
	---r	= READ;
	---rb	= READ BINARY;
	---w	= WRITE;
	---wb	= WRITE BINARY;
	---u	= OPEN TEXT FILE FOR UPDATE;
	---ub	= OPEN BINARY FOR UPDATE;
	---a	= OPEN TEXT FILE FOR APPENDING;
	---ab	= OPEN BINARY FOR APPENDING;
	if file_exists(path) then
		if equal(mode,"wb") then
			return open(path, "ab")
		elsif equal(mode,"w") then
			return open(path, "a")
		else
			return open(path, mode)
		end if
	else
		return open(path, mode)
	end if
end function

--PEGA LINHA A LINHA DO ARQUIVO.
public function readLine(integer idFile)
	return gets(idFile)
end function

--PEGA CARACTERE POR CARACTERE.
public function readChar(integer idFile)
	return getc(idFile)
end function

--PEGA TODO O ARQUIVO DE UMA VEZ E JOGA EM UMA ARRAY.
--PARA CADA QUEBRA-D-LINHA, UMA ENDEREÇO-ARRAY.
public function readAll(integer idFile)
	if (idFile > -1) then
		object line, buffer = {}
		while 1 do
			line = readLine(idFile)
			if atom(line) then
				return buffer
			else
				buffer = append(buffer, line)
			end if
		end while
	else
		trace(1)
		--O arquivo não ter sido aberto.
	end if
end function

--RETORNA A QUANTIDADE DE LINHAS DE UM ARQUIVO.
--PROVISÓRIO**
public function getRows(sequence path)
	integer f	= openFile(path)
	integer len	= length(readAll(f))
	f = closeFile(f)
	return len
end function

--ESCREVE NO ARQUIVO.
public procedure write(integer idFile, object text)
	puts(idFile, text)
end procedure

--FECHA O ARQUIVO.
public function closeFile(integer idFile)
	close(idFile)
	return -1
end function