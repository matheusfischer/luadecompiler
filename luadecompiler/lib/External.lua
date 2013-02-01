
	--[[
	
		LuaDecompiler [ver 0.0.1]
		
		Project created by Octie @ serverdev.net, on fully educational purposes,
		saying that, I also state that the complete source code of this script
		is also availible to anyone, which also has an interest of learning.
		
		This file contains a group of functions collected from free and open
		sources from and to the internet.
		
	]]--

	function fsize (file)
      local current = file:seek()      -- get current position
      local size = file:seek("end")    -- get file size
      file:seek("set", current)        -- restore position
      return size
    end
	
	function readInt32(stream)
		return tonumber(string.byte(stream:read(4)))
	end
	
	function readStringToZero(stream)
		local bytes = stream:read(72)
		local result = ""
		
		for b in string.gfind(bytes, ".") do
			if (b ~= nil) then
				result = result .. b
			else
				break
			end
		end
		
		return result
	end
	
	function advance(stream, count)
		stream:read(count)
	end
	
	function seekAndRead(stream, offset, readproc)
		stream:seek("set", offset)
		return readproc(stream)
	end
