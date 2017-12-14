include std/console.e
include util/constants.e

if equal(null,null) then
	puts(1, "equal(null,null) is true\r\n")
else 
	puts(1, "equal(null,null) is false\r\n")
end if

if equal(void,void) then
	puts(1, "equal(void,void) is true\r\n")
else 
	puts(1, "equal(void,void) is false\r\n")
end if

if equal(10,10) then
	puts(1, "equal(10,10) is true\r\n")
else 
	puts(1, "equal(10,10) is false\r\n")
end if

if equal(10,20) then
	puts(1, "equal(10,20) is true\r\n")
else 
	puts(1, "equal(10,20) is false\r\n")
end if

any_key()