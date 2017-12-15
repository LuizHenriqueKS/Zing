-- DECLARAÇÕES
namespace breakLineCommandBuilder

include zing/engine/command/breakLineCommand.e

include script/block.e
include script/engine.e
include script/commandBuilder.e

-- CONSTRUTORES
public function new()
	return commandBuilder:new({"\r\n"}, routine_id("build"))
end function

public function build(engine eng, block blo)
	return breakLineCommand:new(eng, blo)
end function
