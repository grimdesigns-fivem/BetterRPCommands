-- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA!
-- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA!
-- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA! -- JUST EDIT THE CONFIG.LUA!

-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!
-- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE! -- DO NOT EDIT THESE!


--[[ R P   C O M M A N D S ]]--
-----------------------------------/ I T \---------------------------------
AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/it" and enable_core_commands == true then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "^2>*^0" .. string.sub(msg,5), { 255, 255, 255 })

	end
        if sm[1] == "/me" and enable_core_commands == true then
                CancelEvent()
                TriggerClientEvent('chatMessage', -1 "^2>**0" .. string.sub(msg,5), { 255, 255, 255 })
       end
end)

--------------------/ R P   N A M E \------------------------------
AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/rpname" and enable_roleplay_commands == true then
		CancelEvent()
		if sm[2] == nil then
			TriggerClientEvent('chatMessage', -1, "/rpname <Name_Surname/Name> <Message>", { 255, 255, 255 })
		else
		rpname = string.gsub(sm[2], "_", " ")
		rpmsg = string.sub(msg, #sm[1] + 1 + #sm[2] + 2, #msg)
		TriggerClientEvent('chatMessage', -1, "^2".. rpname .. "^7: " .. rpmsg, { 255, 255, 255 })
		end
	end
end)

-----------------------------------/ I D \---------------------------------
 AddEventHandler('chatMessage', function(source, name, msg)
sm = stringsplit(msg, " ");
if sm[1] == "/id" and enable_police_commands == true then
	CancelEvent()
	if sm[2] == nil then 
		TriggerClientEvent('chatMessage', -1, "/id <First Name> <Surname>", {255,255,255})
	elseif sm[3] == nil then 
		TriggerClientEvent('chatMessage', -1, "/id <First Name> <Surname>", {255,255,255})
	elseif sm[4] == nil then 
		fname = sm[2]
		sname = sm[3]
			TriggerClientEvent('chatMessage', -1, "^2ID ^7|^2 First Name:^7 " .. fname .. " ^2Surname:^7 " .. sname, {255,255,255})
	else
		fname = sm[2]
		sname = sm[3]
		dob = sm[4]
			TriggerClientEvent('chatMessage', -1, "^2ID ^7|^2 First Name:^7 " .. fname .. " ^2Surname:^7 " .. sname .. " ^2DOB:^7 " .. dob, {255,255,255})
	end
end
end)

RegisterServerEvent('chatEvent')
AddEventHandler('chatEvent', function(string)
  TriggerClientEvent('chatMessage', -1, string)
end)

AddEventHandler('chatMessage', function(s, n, m)
	local message = string.lower(m)
	if message == "/p" and enable_police_commands == true then
		CancelEvent()
		--------------
		TriggerClientEvent('PanicLocation', s)
	end
end)



-- STRING SPLIT FUNCTION
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

-----------------------------------/ DONT TOUCH\---------------------------------
-- Version Checking down here, better don't touch this
local CurrentVersion = '1.0.1'
local GithubResourceName = 'Resources'
 
PerformHttpRequest('https://raw.githubusercontent.com/GrimDesignsFiveM/BetterRPCommands/master/' .. GithubResourceName .. '/VERSION', function(Error, NewestVersion, Header)
	PerformHttpRequest('https://raw.githubusercontent.com/GrimDesignsFiveM/BetterRPCommands/master/' .. GithubResourceName .. '/CHANGES', function(Error, Changes, Header)
		print('\n')
		print('##############')
		print('## ' .. GetCurrentResourceName())
		print('##')
		print('## Current Version: ' .. CurrentVersion)
		print('## Newest Version: ' .. NewestVersion)
		print('##')
		if CurrentVersion ~= NewestVersion then
			print('##BetterRPCommands Outdated')
			print('## Check the GitHub')
			print('## For the newest Version!')
                        print('## github.com/GrimDesignsFiveM/BetterRPCommands')
			print('##############')
			print('CHANGES: ' .. Changes)
		else
			print('## Up to date!')
			print('##############')
		end
		print('\n')
	end)
end)
 
-- Bot status down here, better don't touch this
local Status = 'UpToDate'
local GithubResourceName = 'Resources'		
 
PerformHttpRequest('https://raw.githubusercontent.com/GrimDesignsFiveM/BetterRPCommands/master/' .. GithubResourceName .. '/ONLINE', function(Error, Online, Header)
	PerformHttpRequest('https://raw.githubusercontent.com/GrimDesignsFiveM/BetterRPCommands/master/' .. GithubResourceName .. '/MAINTENANCE', function(Error, Maintenance, Header)
		print('\n')
		print('##############')
		print('## ' .. GetCurrentResourceName())
		print('##')
		print('## Status: ' .. Status)
		print('## Online: ' .. Online)
		print('##')
		if Status ~= UpToDate then
			print('## Bot Is Online!')
			print('##############')
		else 
			print('## Bot Is Outdated')
			print('## Check the GitHub')
			print('## For Status & Updates')
                        print('## github.com/GrimDesignsFiveM/BetterRPCommands')
			print('##############')
			print('MAINTENANCE: ' .. Maintenance)
		end
		print('\n')
	end)
end)
