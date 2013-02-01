
	--[[
	
		LuaDecompiler [ver 0.0.1]
		
		Project created by Octie @ serverdev.net, on fully educational purposes,
		saying that, I also state that the complete source code of this script
		is also availible to anyone, which also has an interest of learning.
		
	]]--
	
	BinaryTable =
	{
		File = nil,
		BlockSize = 0,
		FileSize = 0,
		Stream = nil,
		
		Load = function (path)
			BinaryTable.File = path
			BinaryTable.Stream = assert(io.open(path, "rb"))
			
			BinaryTable.FileSize = fsize(BinaryTable.Stream)
			BinaryTable.BlockSize = readInt32(BinaryTable.Stream)
			BinaryTable.BlockCount = (BinaryTable.FileSize - 4) / BinaryTable.BlockSize
		end,
		
		Process = function (proc)
			proc.Process(BinaryTable)
		end
	}
