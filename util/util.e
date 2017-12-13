namespace util

include util/list.e

public procedure print_s(atom out, sequence seq)
	puts(out, "{")
	atom first = 1
	for i=1 to length(seq) do
		if not first then
			puts(out, ",")
		end if
		first = 0
		if integer(seq[1]) then
			printf(out, "%d", {seq[i]})
		else 
			printf(out, "%s", {seq[i]})
		end if
	end for
	puts(out, "}\r\n")
end procedure

public procedure print_l(atom out, list input)
	print_s(out, list:toSequence(input))
end procedure