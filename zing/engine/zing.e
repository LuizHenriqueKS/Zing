-- DECLARAÇÕES
namespace zing

include script/engine.e

include zing/engine/blockListParser.e

include zing/engine/commandBuilder/breakLineCommandBuilder.e

include util/list.e

-- MÉTODOS
public type zing(object input)
	return engine(input)
end type

public function new()
	zing result = engine:new()
	integer blockListParserId = routine_id("zingBlockListParser:parseBlockList")
	engine:setBlockListParser(result, blockListParserId)
	
	-- LISTA DE CONSTRUTORES COMANDOS
	list cbl = list:empty()
	list:add(cbl,breakLineCommandBuilder:new())
	
	engine:setCommandBuilderList(result, cbl)
	
	return result
end function
