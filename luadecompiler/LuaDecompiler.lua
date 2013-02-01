
	--[[
	
		LuaDecompiler [ver 0.0.1]
		
		Project created by Octie @ serverdev.net, on fully educational purposes,
		saying that, I also state that the complete source code of this script
		is also availible to anyone, which also has an interest of learning.
	
		------------------------------------------------------------------------
		
		LuaDecompiler.lua
		
		Main file handling LuaDecompiler, grouping all libraries and executing
		the main processing of the script. Also contains settings information.
		
	]]--
	
	dofile(".\\lib\\BinaryTable.lua")
	dofile(".\\lib\\External.lua")
	
	dofile(".\\lib\\processors\\Processor.lua")
	
	LuaDecompiler =
	{
		BinaryFile = ".\\input\\musicinfo.bin",
		Processor = "MusicInfo",
	
		Settings =
		{
			OutputPath = ".\\output\\",
			EncryptedBin = false,
			BinaryEncryptionKey = "TODO"
		},
		
		RegisterProcessors = function ()
			Processor.RegisterProcessor("ServerSet", ServerSetProcessor)
			Processor.RegisterProcessor("MusicInfo", MusicInfoProcessor)
			-- TODO ...
		end,
		
		Initiate = function ()
			LuaDecompiler.RegisterProcessors()
			
			BinaryTable.Load(LuaDecompiler.BinaryFile)

			if (LuaDecompiler.EncryptedBin) then
				CryptProcessor.Decrypt(BinaryTable.Stream)
			end
			
			BinaryTable.Process(Processor.GetProcessor(LuaDecompiler.Processor))
		end
	}
	
	LuaDecompiler.Initiate()
