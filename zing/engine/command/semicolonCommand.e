-- DECLARAÇÕES
namespace semicolonCommand

include script/block.e
include script/engine.e
include script/command.e

-- CONSTRUTORES
public function new(engine eng, block blo)
	command c = command:new(eng, blo, "semicolonCommand")
	return c
end function
