include std/console.e -- for display()
include std/net/http.e

object result = http_get("http://example.com") 
if atom(result) then 
   printf(1, "Web error: %d\n", result) 
    abort(1) 
end if 

colors_to_attr(4, 7)
display(result[1]) -- header key/value pairs
printf(1, "Content: %s\n", { result[2] }) 
put_screen_char(1, 1, {'A', 152, 'Z', 131})
any_key()