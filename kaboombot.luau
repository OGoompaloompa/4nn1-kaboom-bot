--made by #vfc2 on discord

--Fedora admin sucks kaboom bot is better 🥶

print("ran")
local BLACKLISTED = {
	--anyone who isn't able to use the bot
}

local admins = {
	--anyone who has admin perms on the bot
	"GarbageMold"
}
local plr = game.Players.LocalPlayer
local tweenservice = game:GetService("TweenService")
ischasing = false
digpos = nil
--collision remover--
local function noclip()
	for _, v in pairs(workspace.Cabins:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
end

local function clip()
	for _, v in pairs(workspace.Cabins:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = true
		end
	end
end

local function nocoli()
	--turns off collision for the dogs
	for _, v in pairs(workspace.muffy:GetChildren()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end

	for _, v in pairs(workspace.socky:GetChildren()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
end

local function killdogs()
	--sets health to 100 incase client buggs the dogs--
	workspace.muffy.Humanoid.Health = 100
	workspace.socky.Humanoid.Health = 100
	task.wait()
	workspace.muffy.Humanoid.Health = 0
	workspace.socky.Humanoid.Health = 0
end

--attempts to get networkownership--
local function stealdogs()
	plr.Character.HumanoidRootPart.CFrame = workspace.muffy.Torso.CFrame
	task.wait(1)
	plr.Character.HumanoidRootPart.CFrame = workspace.socky.Torso.CFrame
	workspace.muffy.Torso.CFrame = plr.Character.HumanoidRootPart.CFrame
	task.wait(1)
	workspace.muffy.Torso.CFrame = plr.Character.Head.CFrame 
	workspace.socky.Torso.CFrame = plr.Character.Head.CFrame
end

--regular commands--
local function thecomand(msg)
	if string.find(msg, ";kaboom ") then
		local name = string.gsub(msg, ";kaboom ", "")
		print("name is "..name)
		if not game.Players:FindFirstChild(name) then return end
		local  victim = game.Players:FindFirstChild(name)
		if victim == plr then return end
		ischasing = true
		print("victim is "..victim.Name)
		nocoli()
		noclip()
		local startercframe = plr.Character.HumanoidRootPart.CFrame
		stealdogs()
		plr.Character.HumanoidRootPart.CFrame = startercframe
		--the important stuff--
		task.spawn(function() while plr.Character.Humanoid.Health > 10 do
				plr.Character.Humanoid:MoveTo(victim.Character.HumanoidRootPart.Position) task.wait(0.25) end end)
		while plr.Character.Humanoid.Health > 10 or victim.Character.Humanoid.Health > 10 do
			task.wait()
			workspace:FindFirstChild("muffy"):FindFirstChild("Torso").CFrame = plr.Character.Head.CFrame
			workspace:FindFirstChild("socky"):FindFirstChild("Torso").CFrame = plr.Character.Head.CFrame
			victim.Character.HumanoidRootPart.Touched:Connect(function(hit)
				if victim.Name == name then
					task.wait()
					if not workspace:FindFirstChild("muffy") or not workspace:FindFirstChild("socky") then
						clip()
						ischasing = false
						return end
					if hit.Parent == workspace:FindFirstChild("muffy") or workspace:FindFirstChild("socky") then
                        if ischasing == true then
							killdogs()
						end
						ischasing = false
						return end
				end
			end)
		end
	end
	if string.find(msg, ";setpos ") then
		local name = string.gsub(msg, ";setpos ", "")
		if not game.Players:FindFirstChild(name) then return end
		local victim = game.Players:FindFirstChild(name)
		digpos = victim
	end
	if string.match(msg, ";removepos") then
		if string.gsub(msg, ";removepos", "") ~= "" then return end
		digpos = nil
	end   
	if string.match(msg, ";getownership") then
		if string.gsub(msg, ";getownership", "") ~= "" then return end
		stealdogs()
	end               

	if string.match(msg, ";dig") then
		if string.gsub(msg, ";dig", "") == "" then
			if ischasing then return end
			print("dig")
			nocoli()
			stealdogs()
			task.wait()
			plr.Character.HumanoidRootPart.CFrame = digpos.Character.HumanoidRootPart.CFrame
			workspace.muffy.Torso.CFrame = plr.Character.Head.CFrame - Vector3.new(0,7,0)
			workspace.socky.Torso.CFrame = plr.Character.Head.CFrame - Vector3.new(0,7,0)
            task.wait(0.05)
			killdogs()
		end
	end
	if string.match(msg, ";digf") then
        print("test1")
		if string.gsub(msg, ";digf", "") ~= "" then return end 
        print("test2")
		if ischasing then return end
		print("digf")
		nocoli()
		stealdogs()
		task.wait()
		plr.Character.HumanoidRootPart.CFrame = digpos.Character.HumanoidRootPart.CFrame
        local cframe = plr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 1, 0)
		workspace.muffy.Torso.CFrame = cframe + cframe.LookVector * 3
		workspace.socky.Torso.CFrame = cframe + cframe.LookVector * 3 
        task.wait(0.05)
		killdogs()
	end
	if string.match(msg, ";digt") then
		if string.gsub(msg, ";digt", "") ~= "" then return end 
		if ischasing then return end
		print("digt")
		nocoli()
		stealdogs()
		task.wait()
		plr.Character.HumanoidRootPart.CFrame = digpos.Character.HumanoidRootPart.CFrame
        local cframe = plr.Character.Head.CFrame
		workspace.muffy.Torso.CFrame = cframe + Vector3.new(0,6,0)
		workspace.socky.Torso.CFrame = cframe + Vector3.new(0,6,0)
        task.wait()
		killdogs()
	end

	if string.find(msg, ";exterminate ") then
		if iskabooming then return end
		local name = string.gsub(msg, ";exterminate ", "")
		print("name is "..name)
		if not game.Players:FindFirstChild(name) then return end
		local  victim = game.Players:FindFirstChild(name)
		if victim == plr then return end
		print("victim is "..victim.Name)
		nocoli()
		stealdogs()
		--the important stuff--
		while plr.Character.Humanoid.Health > 10 do
			workspace.muffy.Torso.CFrame = plr.Character.Head.CFrame
			workspace.socky.Torso.CFrame = plr.Character.Head.CFrame
			local tween = tweenservice:Create(
				plr.Character.HumanoidRootPart,
				TweenInfo.new(
					0.25,
					Enum.EasingStyle.Sine,
					Enum.EasingDirection.InOut,
					0,
					false  
				),
				{CFrame = victim.Character.HumanoidRootPart.CFrame}
			)
			tween:Play()
			task.wait(0.2)
			victim.Character.HumanoidRootPart.Touched:Connect(function(hit)
				if victim.Name == name then
					if hit.Parent == workspace.muffy or workspace.socky then
						killdogs()
						task.wait(0.25)
						return end
				end
			end)

		end
	end
end
local function admincommand(msg)
	if string.match(msg, ";reset") then
		if string.gsub(msg, ";reset", "") ~= "" then return end
		plr.Character:FindFirstChild("Humanoid").Health = 0
	end    
	if string.find(msg, ";blacklist ") then
		local name = string.gsub(msg, ";blacklist ", "")
		if not game.Players:FindFirstChild(name) then return end
		local victim = game.Players:FindFirstChild(name)
		table.insert(BLACKLISTED, name)
		print("blacklisted "..name)
	end
	if string.find(msg, ";whitelist ") then
		local name = string.gsub(msg, ";whitelist ", "")
		if not game.Players:FindFirstChild(name) then return end
		local victim = game.Players:FindFirstChild(name)
		table.remove(BLACKLISTED, table.find(BLACKLISTED, name))
		print("whitelisted "..name)
	end
	if string.find(msg, ";forceleave") then
		game.Players.LocalPlayer:Kick("An admin used ;forceleave on you")
	end
	if string.find(msg, ";to ") then
		local name = string.gsub(msg, ";to ", "")
		if not game.Players:FindFirstChild(name) then return end
		local victim = game.Players:FindFirstChild(name)
		plr.Character.HumanoidRootPart.CFrame = victim.Character.HumanoidRootPart.CFrame
	end
	if string.find(msg, ";cmds ") then
		--this is admin only because its a lot of text and people may feel like spamming it. 
		if string.gsub(msg, ";cmds ", "") == "public" then
			game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Public Commands: ;kaboom (plr), ;exterminate (plr), ;setpos (plr), ;removepos, ;getownership, ;dig, ;digf, ;digt)")            
		end
		if string.gsub(msg, ";cmds ", "") == "adminonly" then
			game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Admin Commands: ;reset, ;forceleave, ;blacklist (plr), ;whitelist (plr), ;version, ;cmds, ;checkperms, ;to (plr)")                 
		end
	end
		if string.find(msg, ";version") then
			if string.gsub(msg, ";version", "") ~= "" then return end
			print(";cmds detetected")
			game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("idek")
		end
        if string.find(msg, ";rejoin") then
            if string.gsub(msg, ";rejoin", "") ~= "" then return end
            print("rejoining")
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId) 
		end
		if string.find(msg, ";checkadmin") then
			if string.gsub(msg, ";checkadmin", "") ~= "" then return end
			print(";cmds detetected")
			game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Admins: "..table.concat(admins, ", "))
		end
		if string.find(msg, ";checkblacklist") then
			if string.gsub(msg, ";checkblacklist", "") ~= "" then return end
			print(";cmds detetected")
			game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Blacklisted: "..table.concat(BLACKLISTED, ", "))
		end     
end
	--events--
plr.Chatted:Connect(thecomand)
game.Players.PlayerAdded:Connect(function(plar)
	if not table.find(BLACKLISTED, plar.Name) then
		plar.Chatted:Connect(thecomand)
	end
	if table.find(admins, plar.Name) then
		plar.Chatted:Connect(admincommand)
	end
end)
for _, v in pairs(game.Players:GetChildren()) do
	print(v)
	if not table.find(BLACKLISTED, v.Name) then
		v.Chatted:Connect(thecomand)
	end
	if table.find(admins, v.Name) then
		v.Chatted:Connect(admincommand)
	end
end
--needz this--
plr.Character.Humanoid.Died:Connect(function() ischasing = false task.wait(2) clip()end)
