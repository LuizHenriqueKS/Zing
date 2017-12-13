-- DECLARAÇÕES
namespace zing

include script/engine.e

include zing/engine/blockListParser.e

-- MÉTODOS
public type zing(object input)
	return engine(input)
end type

public function new()
	zing result = engine:new()
	integer blockListParserId = routine_id("zingBlockListParser:parseBlockList")
	engine:setBlockListParser(result, blockListParserId)
	return result
end function