local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
	Title = "Domius - Vox Seas",
	SubTitle = "by mini hell",
	TabWidth = 160,
	Size = UDim2.fromOffset(500, 300),
	Acrylic = true,
	Theme = "Darker",
	MinimizeKey = Enum.KeyCode.End
})
local t = Window:AddTab({
	Title = "Farm",
	Icon = "home"
})


local autoRodSwitch = false

-- Toggle para Auto Rod Switching
local Toggle = t:AddToggle("AutoRodSwitch", {
    Title = "Auto Rod Switching",
    Description = "",
    Default = false, -- desligado por padrão
    Callback = function(state)
        autoRodSwitch = state
        NotifyInfo("Smart Rods", "Auto rod switching " .. (state and "enabled" or "disabled"))
    end
})

-- Lista de varas
local rods = {
    { Name = "Luck Rod", Price = "350 Coins", ID = 79, Desc = "Luck: 50% | Speed: 2% | Weight: 15 kg" },
    { Name = "Carbon Rod", Price = "900 Coins", ID = 76, Desc = "Luck: 30% | Speed: 4% | Weight: 20 kg" },
    { Name = "Grass Rod", Price = "1.50k Coins", ID = 85, Desc = "Luck: 55% | Speed: 5% | Weight: 250 kg" },
    { Name = "Damascus Rod", Price = "3k Coins", ID = 77, Desc = "Luck: 80% | Speed: 4% | Weight: 400 kg" },
    { Name = "Ice Rod", Price = "5k Coins", ID = 78, Desc = "Luck: 60% | Speed: 7% | Weight: 750 kg" },
    { Name = "Lucky Rod", Price = "15k Coins", ID = 4, Desc = "Luck: 130% | Speed: 7% | Weight: 5k kg" },
    { Name = "Midnight Rod", Price = "50k Coins", ID = 80, Desc = "Luck: 100% | Speed: 10% | Weight: 10k kg" },
    { Name = "Steampunk Rod", Price = "215k Coins", ID = 6, Desc = "Luck: 175% | Speed: 19% | Weight: 25k kg" },
    { Name = "Chrome Rod", Price = "437k Coins", ID = 7, Desc = "Luck: 229% | Speed: 23% | Weight: 250k kg" },
    { Name = "Astral Rod", Price = "1M Coins", ID = 5, Desc = "Luck: 350% | Speed: 43% | Weight: 550k kg" }
}

-- Criando botões para comprar varas
for _, rod in ipairs(rods) do
    RodTab:AddButton(rod.Name .. " (" .. rod.Price .. ")", {
        Description = rod.Desc,
        Callback = function()
            pcall(function()
                replicatedStorage.Packages._Index["sleitnick_net@0.2.0"].net["RF/PurchaseFishingRod"]:InvokeServer(rod.ID)
                NotifySuccess("Rod Purchase", "Successfully bought " .. rod.Name .. "! " .. rod.Desc)
            end)
        end
    })
end
