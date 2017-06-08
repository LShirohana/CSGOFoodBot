local discordia = require('discordia')
local client = discordia.Client()
require('util')

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(msg)

	if msg.author == client.user then return end
	local guild = client.guilds()
	local hd = guild:getRole("name", "HIGH DONIT")
	local member = msg.author:getMembership(guild)
	
	--code runner
	if string.sub(msg.content,1,4) == '!lua' then
		if member:hasRole(hd) == false then return end
		local code = string.sub(msg.content, 6)
		execCode(code, msg)
		--msg.channel:sendmsg(code)
	end
	
	if string.find(msg.content, "jake") ~= nil then
		msg:reply("<:jakehead:259156188887777292>    <:hatson:259157685469970433>")
		msg:reply("<:jakebody:259159049248047104>")
	end
	
	
end)

client:on('messageUpdate', function(msg)
	
	if msg.author == client.user then return end
	local guild = client.guilds()
	local hd = guild:getRole("name", "HIGH DONIT")
	local member = msg.author:getMembership(guild)
	
	if string.sub(msg.content,1,4) == '!lua' then
		if member:hasRole(hd) == false then return end
		local code = string.sub(msg.content, 6)
		execCode(code, msg)
	end
	
end)

client:run('')

