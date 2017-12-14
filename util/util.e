namespace util

include util/list.e

public procedure print_s(atom out, sequence seq)
	print_l(1, list:from(seq))
end procedure

public procedure print_l(atom out, list input)
	puts(out, "{")
	for i=0 to list:size(input)-1 do
		if i>0 then
			puts(out, ",")
		end if
		object item = list:get(input, i)
		if integer(item) then
			printf(out, "%d", {item})
		else 
			printf(out, "%s", {item})
		end if
	end for
	puts(out, "}\r\n")
end procedure

public function removeAccents(sequence str)
	sequence accents =    {"À","Á","Â","Ã","Ä","Å","à","á","â","ã","ä","å","ß","Ò","Ó","Ô","Õ","Õ","Ö","Ø","ò","ó","ô","õ","ö","ø","È","É","Ê","Ë","è","é","ê","ë","ð","Ç","ç","Ð","Ì","Í","Î","Ï","ì","í","î","ï","Ù","Ú","Û","Ü","ù","ú","û","ü","Ñ","ñ","Š","š","Ÿ","ÿ","ý","Ž","ž"}
    sequence accentsOut = {"A","A","A","A","A","A","a","a","a","a","a","a","B","O","O","O","O","O","O","O","o","o","o","o","o","o","E","E","E","E","e","e","e","e","e","C","c","D","I","I","I","I","i","i","i","i","U","U","U","U","u","u","u","u","N","n","S","s","Y","y","y","Z","z"}
	sequence result = str
	for i = 1 to length(accents) do
		result = util:replace(result, accents[i], accentsOut[i])
	end for
	return result
end function

public function replace( sequence target, sequence old, sequence new )
  integer len, loc

  len = length( old )
  loc = match( old, target )

  while loc do
    return target[1..(loc - 1) ] &
           new &
           -- recursive call on remainder of string --
           replace( target[(loc + len)..length( target )], old, new )
  end while

  return target

end function
