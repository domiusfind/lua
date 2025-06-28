game:GetService("Players").LocalPlayer.Idled:connect(function()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new(0,0));
	game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
	wait(1);
	game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame);
end);

function init()
	if not isfolder("rin") then
		makefolder("rin")
	end
	if not isfile("rin/save.config") then
		writefile("rin/save.config", game.HttpService:JSONEncode({
			["nhuw"] = 50,
			["tnhuw_"] = {},
			["Tnhuw"] = false,
			["AutoBuyabc"] = false,
			["AutoDestroy"] = false,
			["hola"] = {},
			["AutoSellMoonlitCrop"] = false,
			["Lol"] = false
		}))
	end
end
function savesetting()
	init()
	writefile("rin/save.config", game:GetService("HttpService"):JSONEncode(getgenv().Config))
end
if not getgenv()["Config"] then
	getgenv()["Config"] = {}
end
if isfile("rin/save.config") then
	local rf = game.HttpService:JSONDecode(readfile("rin/save.config"))
	for i, v in pairs(rf) do
		getgenv()["Config"][i] = v
	end
else
	getgenv()["Config"] = {
		["nhuw"] = 50,
		["tnhuw_"] = {},
		["Tnhuw"] = false,
		["AutoBuyabc"] = false,
		["AutoDestroy"] = false,
		["hola"] = {},
		["AutoSellMoonlitCrop"] = false,
		["Lol"] = false,
	}
end

local p = require(game:GetService("ReplicatedStorage").Modules.Remotes)
local pp = p.Crops.Collect


function seed_module(v, ...)
	local _v = require(game:GetService("ReplicatedStorage").Data.SeedData)
	local v_ = {
		...
	}
	local id072019 = {}
	for i, v in pairs(v_) do
		local pp = _v[v]
		id072019[#id072019 + 1] = pp[v]
	end
	return unpack(id072019)
end


local format_ = {
	["Seed"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Max Stock: %s | Stock: %s\n", i, v["MaxStock"], v["Stock"])
		end
		return str
	end,
	["Pet"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Stock: %s\n", i, v["Stock"])
		end
		return str
	end,
	["Gear"] = function(tnhuw)
		local str = "" or ("gg"):gsub("gg", "")
		for i, v in tnhuw do
			str = string.format(str .. "%s - Max Stock: %s | Stock: %s\n", i, v["MaxStock"], v["Stock"])
		end
		return str
	end,
	["Event"] = function(tnhw)
		local n = ""
		for i, v in tnhw do
			n = n .. string.format("%s - Max Stock: %s | Stock: %s\n",i,v["MaxStock"],v["Stock"])
		end
		return n
	end,
	["seed_in_backpack"] = {
		["name"] = function(tnhuw)
			local t = string.gsub(tnhuw, "%A+%[(.-)]", "")
			return t:gsub(" Seed", "")
		end,
		["count"] = function(tnhuw)
			return tonumber(string.match(tnhuw, "%[X(%d+)%]"))
		end
	}
}
-- GetAttribute("Pollinated") [Pollinated] Blueberry [0.22kg]

local stock = {
	["Seed"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["SeedStock"]["Stocks"]) do
			stock[i] = {
				["MaxStock"] = v["MaxStock"],
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["SeedStock"]["Seed"]
	end,
	["Pet"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["PetEggStock"]["Stocks"]) do
			stock[v["EggName"]] = {
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["PetEggStock"]["Egg"]
	end,
	["Gear"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local stock = {}
		for i, v in pairs(f["GearStock"]["Stocks"]) do
			stock[i] = {
				["MaxStock"] = v["MaxStock"],
				["Stock"] = v["Stock"]
			}
		end
		return stock, f["GearStock"]["Gear"]
	end,
	["Event"] = function()
		local f = require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()
		local st = {}
		for i, v in pairs(f["EventShopStock"]["Stocks"]) do
			st[i] = {
				["MaxStock"] = v["MaxStock"],
				["Stock"] = v["Stock"]
			}
		end
		return st, f["EventShopStock"]["ShopSeed"]
	end
}

local hello = {
	"Daffodil",
	"Coconut",
	"Tomato",
	"Apple",
	"Blueberry",
	"Strawberry",
	"Watermelon",
	"Mushroom",
	"Pumpkin",
	"Pepper",
	"Cacao",
	"Corn",
	"Dragon Fruit",
	"Orange Tulip",
	"Carrot",
	"Mango",
	"Cactus",
	"Beanstalk",
	"Grape",
	"Bamboo"
}

local destroy = {
    "Carrot",
    "Tomato",
    "Poatato",
    "Strawberry",
    "Blueberry",
    "Cauliflower",
    "Watermelon",
    "Green Apple",
    "Avocado",
    "Banana",
    "Pineapple",
    "Kiwi",
    "Beli Pepper",
    "Prickly Pear",
    "Loquato",
    "Feijoa",
    "Sugar Apple"
}

local Shop = {
	"Daffodil",
	"Coconut",
	"Tomato",
	"Apple",
	"Blueberry",
	"Strawberry",
	"Watermelon",
	"Mushroom",
	"Pumpkin",
	"Pepper",
	"Cacao",
	"Corn",
	"Dragon Fruit",
	"Orange Tulip",
	"Carrot",
	"Mango",
	"Cactus",
	"Beanstalk",
	"Grape",
	"Bamboo"
}	

local MyFarm
for _2 , v3 in pairs(workspace.Farm:GetChildren()) do
	if v3.Name == "Farm" then
		if v3.Important.Data.Owner.Value == game.Players.LocalPlayer.Name then
			print("adsads")
			MyFarm = v3
		end
	end
end

function randompt(part)
    local size = part.Size
    local localX = (math.random() - 0.5) * size.X
    local localY = (math.random() - 0.5) * size.Y
    local localZ = (math.random() - 0.5) * size.Z
    local localOffset = Vector3.new(localX, localY, localZ)
    local worldPosition = part.CFrame:PointToWorldSpace(localOffset)
    local rotX = math.rad(math.random(0, 360))
    local rotY = math.rad(math.random(0, 360))
    local rotZ = math.rad(math.random(0, 360))
    local randomRotation = CFrame.Angles(rotX, rotY, rotZ)
    return CFrame.new(worldPosition) * randomRotation
end


function plant(tn)
	if game.Players.LocalPlayer.Character:FindFirstChild(tn) then
		local part = MyFarm.Important.Plant_Locations:GetChildren()[math.random(1, 2)]
		local cf = randompt(part)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cf * CFrame.new(0, 10, 0)
		game:GetService("ReplicatedStorage").GameEvents.Plant_RE:FireServer(Vector3.new(cf.X, cf.Y, cf.Z), format_["seed_in_backpack"]["name"](tn))
		wait(0.1)
		return
	elseif game.Players.LocalPlayer.Backpack:FindFirstChild(tn) then
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(tn))
		return plant(tn)
	end
end

function checkhasseed()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(v.Name:lower(), "seed") then
			return v
		end
	end
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if string.find(v.Name:lower(), "seed") then
			return v
		end
	end
	return
end

function checkhasmoonlit()
	for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
		if string.find(v.Name:lower(), "pollinated") then
			return v
		end
	end
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if string.find(v.Name:lower(), "pollinated") then
			return v
		end
	end
	return
end

spawn(function()
	while wait() do
		spawn(function()
			if getgenv()["Config"].AutoBuyabc then
				local stock_ = stock["Seed"]()
				for n1, n2 in pairs(getgenv()["Config"]["tnhuw_"]) do
					if stock_[n1] and stock_[n1]["Stock"] > 0 then
						game:GetService("ReplicatedStorage").GameEvents.BuySeedStock:FireServer(n1)
					end
				end
			end
		end)
	end
end)

-- local args = {
--     [1] = Vector3.new(44.17329788208008, -13.372404098510742, 271.4956970214844),
--     [2] = Vector3.new(-0.3491062819957733, 0.1335812509059906, 0.9275132417678833)
-- }


-- --game:GetService("Players").LocalPlayer.Character:FindFirstChild("Acidum Rifle").M1:FireServer(unpack(args))
-- game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(args[1])
--game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
-- while wait() do
-- 	if game.Workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name) then
-- 		local gg = game.Workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name)
-- 		gg:SetAttribute("AllCooldown", 1)
-- 		gg:SetAttribute("SwordCooldown", 1)
-- 	end
-- end


-- getnearestplayer = function()
-- 	local hh, gg = math.huge, nil
-- 	for i, v in pairs(game.Players:GetPlayers()) do
-- 			if v.Name ~= game.Players.LocalPlayer.Name then
-- 				if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < hh then
-- 					hh = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
-- 					gg = v.Character.HumanoidRootPart
-- 				end
-- 			end
-- 		end
-- 	return gg
-- end

-- spawn(function()
-- 	while wait() do
-- 		if getnearestplayer() then
-- 			print("oO")
-- 			local args = {
-- 				[1] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,
-- 				[2] = getnearestplayer().HumanoidRootPart
-- 			}
-- 			game:GetService("Players").LocalPlayer.Character:FindFirstChild("Acidum Rifle").M1:FireServer(unpack(args))
-- 		end
-- 	end
-- end)

--Carrot Seed [X6]
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
	Title = "Apple hub [ ☀️🏖️]",
	SubTitle = "",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 400),
	Acrylic = true,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.End
})
local t = Window:AddTab({
	Title = "Farming",
	Icon = ""
})
local st = Window:AddTab({
	Title = "Shop",
	Icon = ""
})
local sv = Window:AddTab({
	Title = "Event",
	Icon = ""
})


local farmingSection = t:AddSection("[ FARMING ]")
local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Collect",
	Description = "",
	Default = getgenv()["Config"].Tnhuw ,
	Callback = function(state)
		getgenv()["Config"].Tnhuw = state
		savesetting()
	end 
})

local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Fast Collect",
	Description = "turn on if has good device",
	Default = getgenv()["Config"].Tnhuw ,
	Callback = function(state)
		getgenv()["Config"].Lol = state
		savesetting()
	end 
})


local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Plant All Seed",
	Description = "",
	Default = getgenv()["Config"].AutoSellMoonlitCrop,
	Callback = function(state)
		getgenv()["Config"].AutoPlant = state
		savesetting()
	end 
})

local Toggle = t:AddToggle("MyToggle", 
{
	Title = "Auto Sell Pollinated Crops",
	Description = "",
	Default = getgenv()["Config"].AutoPlant,
	Callback = function(state)
		getgenv()["Config"].AutoSellMoonlitCrop = state
		savesetting()
	end 
})
local Slider = t:AddSlider("Slider", 
{
	Title = "Select quantity to sell",
	Description = "",
	Default = getgenv()["Config"].nhuw,
	Min = 1,
	Max = 300,
	Rounding = 1,
	Callback = function(Value)
		getgenv()["Config"].nhuw = Value
		savesetting()
	end
})
local chiu = {}
if #getgenv()["Config"]["tnhuw_"] > 0 then
	for i, v in pairs(getgenv()["Config"]["tnhuw_"]) do
		table.insert(chiu, i)
	end
end
local farmingSection = st:AddSection("[ BUY ]")
local MultiDropdown = t:AddDropdown("MultiDropdown", {
	Title = "Select seed to want buy",
	Description = "",
	Values = Shop,
	Multi = true,
	Default = getgenv()["Config"]["tnhuw_"],
})

MultiDropdown:OnChanged(function(Value)
	getgenv()["Config"]["tnhuw_"] = Value
	savesetting()
end)

local Toggle = st:AddToggle("MyToggle", 
{
	Title = "Auto Buy Seed",
	Description = "",
	Default = getgenv()["Config"].AutoBuyabc,
	Callback = function(state)
		getgenv()["Config"].AutoBuyabc = state
		savesetting()
	end 
})

local lll = sv:AddDropdown("MultiDropdown", {
	Title = "Select seed to want destroy",
	Description = "",
	Values = destroy,
	Multi = true,
	Default = getgenv()["Config"]["hola"],
})
lll:OnChanged(function(Value)
	getgenv()["Config"]["hola"] = Value
	savesetting()
end)
local Toggle = sv:AddToggle("MyToggle", 
{
	Title = "Auto Destroy Plant",
	Description = "",
	Default = getgenv()["Config"].AutoDestroy,
	Callback = function(state)
		getgenv()["Config"].AutoDestroy = state
		savesetting()
	end 
})
getgenv().IsBusy = false

topos = function(v)
	local t = game:GetService("TweenService")
	local tt = TweenInfo.new((v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / 300, Enum.EasingStyle.Linear)
	local gg = t:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tt, {
		CFrame = v
	})
	gg:Play()
end
-- dung hoi tai sao lai dung de quy
function getparent(ins)
	if not ins or typeof(ins) ~= "Instance" then
		return
	elseif ins.Name == "Important" then
		return ins
	else
		return getparent(ins.Parent)
	end
end

function getabcishavestable()
	local lol = {}
	local gg = game:GetService("CollectionService"):GetTagged("CollectPrompt")
	if #gg > 0 then
		for i, v in pairs(gg) do
			local troi = v:FindFirstAncestor("Important")
			if troi and troi.Data.Owner.Value == game.Players.LocalPlayer.Name then
				lol[#lol + 1] = v.Parent.Parent
			end
		end
	end
	return lol 
end
local p = require(game:GetService("ReplicatedStorage").Modules.Remotes)
local pp = p.Crops.Collect
for i, v in pairs(getabcishavestable()) do
	pp.send({v})
end
function idk()
	for i, v in pairs(MyFarm.Important.Plants_Physical:GetChildren()) do
		if getgenv()["Config"]["hola"][v.Name] then
			return v
		end
	end
	return
end
-- local args = {
--     [1] = workspace.Farm.Farm.Important.Plants_Physical:GetChildren()[17]:GetChildren()[11]
-- }

-- game:GetService("ReplicatedStorage").GameEvents.Remove_Item:FireServer(unpack(args))
function getcrop()
	local tnhu = {}
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if not string.find(v.Name:lower(), "seed") and not string.find(v.Name:lower(), "shovel") then
			tnhu[#tnhu+1] = v
		end
	end
	return tnhu
end
function honeycollectable()
	return require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()["HoneyMachine"]["PlantWeight"] >= 0
end
function gethoney()
	return require(game:GetService("ReplicatedStorage").Modules.DataService):GetData()["SpecialCurrency"]["Honey"]
end
spawn(function()
	while wait() do
		--pcall(function()
			if getgenv()["Config"].AutoSellMoonlitCrop and checkhasmoonlit() then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-105.984184, 4.00001335, -9.94348621, 0.311976552, -3.36578376e-10, 0.950089812, -2.16052012e-08, 1, 7.44865858e-09, -0.950089812, -2.28506885e-08, 0.311976552)
				wait(0.5)
				if checkhasmoonlit() and checkhasmoonlit().Parent ~= game.Players.LocalPlayer.Character then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(checkhasmoonlit())
				end
				game:GetService("ReplicatedStorage").GameEvents.HoneyMachineService_RE:FireServer("MachineInteract")
			elseif getgenv()["Config"].AutoDestroy and idk() then
				if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shovel [Destroy Plants]") then
					game.Players.LocalPlayer.Character:FindFirstChild("Humanoid"):EquipTool(game:GetService("Players").LocalPlayer.Backpack["Shovel [Destroy Plants]"])
				end
				local p = idk()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p:FindFirstChildOfClass("Part").CFrame
				game:GetService("ReplicatedStorage").GameEvents.Remove_Item:FireServer(p:FindFirstChildOfClass("Part"))
			elseif getgenv()["Config"].AutoPlant and checkhasseed() then
				local ins = checkhasseed()
				plant(ins.Name)
			elseif getgenv()["Config"].Tnhuw then
				if #getcrop() >= tonumber(getgenv()["Config"].nhuw) then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.8899384, 2.99999976, 0.119625024, -6.69919464e-05, 8.90339535e-08, -1, -4.8785342e-08, 1, 8.9037222e-08, 1, 4.8791307e-08, -6.69919464e-05)
					game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory:FireServer()
					wait(0.1)
				else
					if #getabcishavestable() > 0 then
						for i, v in pairs(getabcishavestable()) do
							if not getgenv()["Config"].Tnhuw or #getcrop() >= tonumber(getgenv()["Config"].nhuw) then
								continue
							end
							pp.send({
								v
							})
							if not getgenv()["Config"].Lol then
								wait()
							end
						end
						-- pp.send({
						-- 	(unpack or table.unpack)(getabcishavestable())
						-- }) -- so lag
					else
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.8899384, 2.99999976, 0.119625024, -6.69919464e-05, 8.90339535e-08, -1, -4.8785342e-08, 1, 8.9037222e-08, 1, 4.8791307e-08, -6.69919464e-05)
						game:GetService("ReplicatedStorage").GameEvents.Sell_Inventory:FireServer()
						wait(0.1)
					end
				end
			end
		--end)
	end
end)
local farmingSection = sv:AddSection("[ SUMMER EVENT 🏖️]")
local autoCollectOptimized = false
local collectThread = nil

local fruitsToCollect = {
	["Tomato"] = true,
	["Cauliflower"] = true,
	["Watermelon"] = true,
	["Green Apple"] = true,
	["Avocado"] = true,
	["Banana"] = true,
	["Pineapple"] = true,
	["Kiwi"] = true,
	["Beli Pepper"] = true,
	["Prickly Pear"] = true,
	["Loquato"] = true,
	["Feijoa"] = true,
	["Strawberry"] = true,
	["Suga Apple"] = true,
}

-- 🔘 Toggle no seu hub
local Toggle = sv:AddToggle("MyToggle", 
{
	Title = "Collect Fruit Summer Event",
	Description = "Only summer fruits",
	Default = false,
	Callback = function(state)
		autoCollectOptimized = state

		if state and not collectThread then
			local Players = game:GetService("Players")
			local CollectionService = game:GetService("CollectionService")
			local ReplicatedStorage = game:GetService("ReplicatedStorage")

			local player = Players.LocalPlayer
			local Remotes = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Remotes"))
			local collectRemote = Remotes.Crops.Collect

			-- 🌱 Inicia o loop de coleta
			collectThread = task.spawn(function()
				while autoCollectOptimized do
					local tagged = CollectionService:GetTagged("CollectPrompt")

					for _, prompt in ipairs(tagged) do
						local fruitModel = prompt:FindFirstAncestorWhichIsA("Model")
						if not fruitModel or not fruitModel:IsDescendantOf(workspace) then continue end

						local important = prompt:FindFirstAncestor("Important")
						if not important then continue end

						local data = important:FindFirstChild("Data")
						local owner = data and data:FindFirstChild("Owner")
						if not owner then continue end

						-- Verifica se a fruta é sua e está na lista
						if owner.Value == player or owner.Value == player.Name or owner.Value.Name == player.Name then
							local fruitName = fruitModel.Name
							if fruitsToCollect[fruitName] then
								collectRemote.send({fruitModel})
								task.wait(0.05)
							end
						end
					end

					task.wait(0.1)
				end
			end)
		elseif not state and collectThread then
			-- ❌ Cancela o loop corretamente
			task.cancel(collectThread)
			collectThread = nil
		end
	end
})
local autoSellSummer = false
local sellThread = nil

local Toggle = sv:AddToggle("MyToggle", 
{
    Title = "Auto Sell Summer Fruit",
    Description = "Sell all summer fruits instantly",
    Default = false,
    Callback = function(state)
        autoSellSummer = state

        if state and not sellThread then
            sellThread = task.spawn(function()
                while autoSellSummer do
                    local args = {
                        [1] = "SubmitAllPlants"
                    }

                    game:GetService("ReplicatedStorage").GameEvents.SummerHarvestRemoteEvent:FireServer(unpack(args))
                    task.wait(0) -- pode ajustar o delay se quiser mais rápido ou mais lento
                end
            end)
        elseif not state and sellThread then
            task.cancel(sellThread)
            sellThread = nil
        end
    end
})
