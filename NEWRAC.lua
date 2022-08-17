local Chat_Remote = game.ReplicatedStorage.Events.PlayerChatted

local hub_name_list_coregui = {"Hexagon","bloxtap","DarkHub","MarkBeatsIsGay","ScreenGui","bloxsense"}
local hub_name_list_playergui = {"Gui"}
local mt = getrawmetatable(game)
local chat = false
oldNamecall = hookfunction(mt.__namecall, newcclosure(function(self, ...)
	local method = getnamecallmethod()
	local callingscript = getcallingscript()
	local args = {...}

	if not checkcaller() then

		if method == "InvokeServer" then
			if self.Name == "Filter" and callingscript == game.Players.LocalPlayer.PlayerGui.GUI.Main.Chats.DisplayChat then
				if chat == true then
					return args[1]
				
				end
			end
		end


	end
	return oldNamecall(self, unpack(args))
end))
chat = true
delay(1,function()
	chat = false
end)
Chat_Remote:FireServer("Setup anti cheat succesfully! "..tostring(#tostring(os.time)).."B"..string.sub(game.Players.LocalPlayer.Name,1,1), false, game.Players.LocalPlayer.Status.Role.Value, not game.Players.LocalPlayer.Status.Alive.Value, true)

function anti_cheat_coregui(Name)
	if table.find(hub_name_list_coregui,Name) then

		Chat_Remote:FireServer("I'm a hacker!", false, game.Players.LocalPlayer.Status.Role.Value, not game.Players.LocalPlayer.Status.Alive.Value, true)
		wait(3)
		game.Players.LocalPlayer:Kick("Hack cai dit me may")
	end
end
function anti_cheat_playergui(Name)
	if table.find(hub_name_list_playergui,Name) then
		Chat_Remote:FireServer("I'm a hacker!", false, game.Players.LocalPlayer.Status.Role.Value, not game.Players.LocalPlayer.Status.Alive.Value, true)
		wait(3)
		game.Players.LocalPlayer:Kick("Hack cai dit me may")
	end
end
for i,v in pairs(game.CoreGui:GetChildren()) do
	anti_cheat_coregui(v.Name)
end
for i,v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
	anti_cheat_playergui(v.Name)
end
game.CoreGui.ChildAdded:Connect(function(child)
	anti_cheat_coregui(child.Name)
end)
game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
	anti_cheat_playergui(child.Name)
end)
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.832696736, 0, 0, 0)
TextLabel.Size = UDim2.new(0.167303279, 0, 0.0520446114, 0)
TextLabel.Font = Enum.Font.TitilliumWeb
TextLabel.Text = "ACCB v1"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
