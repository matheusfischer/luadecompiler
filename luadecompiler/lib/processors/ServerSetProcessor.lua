
	--[[
	
		LuaDecompiler [ver 0.0.1]
		
		Project created by Octie @ serverdev.net, on fully educational purposes,
		saying that, I also state that the complete source code of this script
		is also availible to anyone, which also has an interest of learning.
		
	]]--
	
	ServerSetProcessor =
	{
		Process = function (bt)
			bt.Stream:seek("set", 4)
			
			local output = assert(io.open(LuaDecompiler.Settings.OutputPath.."serverset.txt", "w"))
			
			output:write("//ID\tServer Name\tRegion\tGate\t...\r\n")
			
			for block = 0, (bt.BlockCount - 1), 1 do
				local offset = (block * bt.BlockSize) + 4
				bt.Stream:seek("set", offset)
				
				local base_offset = (block * bt.BlockSize) + 4
				
				local id_offset = base_offset + 4 -- base + 0x4
				local name_offset = base_offset + 8 -- base + 0x8
				local gate_offset = base_offset + 108 -- base + 0x6C
				local region_offset = base_offset + 188 -- base + 0xBC

				local id = seekAndRead(bt.Stream, id_offset, readInt32)
				local name = seekAndRead(bt.Stream, name_offset, readStringToZero)
				local gate = seekAndRead(bt.Stream, gate_offset, readStringToZero)
				local region = seekAndRead(bt.Stream, region_offset, readStringToZero)
				
				output:write(string.format("%s\t%s\t%s\t%s\t0\t0\t0\t0\r\n", id, name, region, gate))
				
			end
			
			output:close()
			bt.Stream:close()
		end
	}