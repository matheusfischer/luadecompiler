
	--[[
	
		LuaDecompiler [ver 0.0.1]
		
		Project created by Octie @ serverdev.net, on fully educational purposes,
		saying that, I also state that the complete source code of this script
		is also availible to anyone, which also has an interest of learning.
		
	]]--
	
	MusicInfoProcessor =
	{
		Process = function (bt)
			bt.Stream:seek("set", 4)
			
			local output = assert(io.open(LuaDecompiler.Settings.OutputPath.."musicinfo.txt", "w"))
			
				output:write(string.format("// LuaDecompiler\r\n// - MusicInfoProcessor\r\n// -- %s (%sB)\r\n// -- Block Size: %s\r\n// -- Block Count: %s\r\n\r\n", bt.File, bt.FileSize, bt.BlockSize, bt.BlockCount))
			
			for block = 0, (bt.BlockCount - 1), 1 do
				local offset = (block * bt.BlockSize) + 4
				bt.Stream:seek("set", offset)
				
				local base_offset = (block * bt.BlockSize) + 4
				
				local id_offset = base_offset + 4 -- base + 0x4
				local file_offset = base_offset + 8 -- base + 0x8
				local num_offset = base_offset + 108 -- base + 0x6C

				local id = seekAndRead(bt.Stream, id_offset, readInt32)
				local file = seekAndRead(bt.Stream, file_offset, readStringToZero)
				local num = seekAndRead(bt.Stream, num_offset, readInt32)
				
				output:write(string.format("%s\t%s\t%s\r\n", id, file, num))
				
			end
			
			output:close()
			bt.Stream:close()
		end
	}