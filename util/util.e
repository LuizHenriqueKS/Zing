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