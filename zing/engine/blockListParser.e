-- DECLARAÇÕES
namespace zingBlockListParser

include script/block.e
include script/engine.e

include util/list.e

-- MÉTODOS
public function parseBlockList(engine eng, sequence source)
	return list:from({block:new("em", 0, 0),block:new("desenvolvimento",0,0)})
end function