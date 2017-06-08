function codeToString(str)
	return string.format('```\n%s```', str)
end

function execCode(arg, msg)
	
	if not arg then return end
	
	if (string.find(arg, "os.exit",1) ~= nil) then
		msg:reply("fuck off zook")
		return
	end
	
	local func, errors = load(arg)
	
	if not func then 
		return msg:reply(codeToString(errors))
	end
	
	local success, errordos = pcall(func)
	if not success then return msg:reply(codeToString(errordos)) end

end

print("util file loaded.")