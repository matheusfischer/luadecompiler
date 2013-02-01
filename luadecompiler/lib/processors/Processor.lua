
	--[[
	
		LuaDecompiler [ver 0.0.1]
		
		Project created by Octie @ serverdev.net, on fully educational purposes,
		saying that, I also state that the complete source code of this script
		is also availible to anyone, which also has an interest of learning.
		
	]]--
	
	dofile(".\\lib\\processors\\ServerSetProcessor.lua")
	dofile(".\\lib\\processors\\MusicInfoProcessor.lua")
	
	Processor =
	{
		ProcessorList = {},
		RegisterProcessor = function (key, processor)
			Processor.ProcessorList[key] = processor
		end,
		UnregisterProcessor = function (key)
			Processor.ProcessorList[key] = nil
		end,
		GetProcessor = function (key)
			return Processor.ProcessorList[key]
		end,
	}