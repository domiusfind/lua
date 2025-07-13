--// SERVIÇOS
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

--// VARIÁVEIS GLOBAIS
local autoStealActive = false
local autoStealConnection = nil
local autoStealTimer = nil
local autoStealCooldown = false
local savedBasePosition = nil
local savedHeight = nil
local floatActive = false
local floatConnection = nil

--// GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "AutoStealGUI"

local AutoStealBtn = Instance.new("TextButton")
AutoStealBtn.Size = UDim2.new(0, 180, 0, 35)
AutoStealBtn.Position = UDim2.new(0, 20, 0.5, -20)
AutoStealBtn.Text = "Auto Steal: OFF"
AutoStealBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
AutoStealBtn.TextColor3 = Color3.new(1, 1, 1)
AutoStealBtn.Font = Enum.Font.Gotham
AutoStealBtn.TextSize = 16
AutoStealBtn.Parent = screenGui
AutoStealBtn.BorderSizePixel = 0
AutoStealBtn.AutoButtonColor = true
AutoStealBtn.BackgroundTransparency = 0.1
AutoStealBtn.TextStrokeTransparency = 0.6
AutoStealBtn.ZIndex = 2

--// SALVAR POSIÇÃO DA BASE (usa ao iniciar o jogo ou manualmente se quiser)
local function setBase()
	local character = player.Character or player.CharacterAdded:Wait()
	local hrp = character:WaitForChild("HumanoidRootPart")
	savedBasePosition = hrp.Position + Vector3.new(0, 2, 0)
end

--// FLUTUAR ATÉ A BASE
local function floatToBase()
	if not savedBasePosition then return end

	local character = player.Character
	if not character then return end

	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	floatActive = true
	if floatConnection then floatConnection:Disconnect() end

	floatConnection = RunService.Heartbeat:Connect(function()
		if not floatActive then
			hrp.Velocity = Vector3.zero
			floatConnection:Disconnect()
			return
		end

		local direction = (savedBasePosition - hrp.Position)
		local distance = direction.Magnitude

		if distance < 3 then
			hrp.Velocity = Vector3.zero
			floatActive = false
			floatConnection:Disconnect()
			return
		end

		hrp.Velocity = direction.Unit * 40 -- velocidade de flutuação
	end)
end

--// FUNÇÃO PRINCIPAL DO AUTO STEAL
local function toggleAutoSteal()
	if autoStealCooldown then return end

	if not savedBasePosition then
		warn("Base não salva ainda! Salvando agora...")
		setBase()
	end

	autoStealActive = not autoStealActive
	AutoStealBtn.Text = "Auto Steal: " .. (autoStealActive and "ON" or "OFF")
	AutoStealBtn.BackgroundColor3 = autoStealActive and Color3.fromRGB(50, 120, 50) or Color3.fromRGB(70, 70, 70)

	if autoStealActive then
		autoStealCooldown = true

		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		savedHeight = hrp.Position.Y
		local skyPos = hrp.Position + Vector3.new(0, 200, 0)
		hrp.CFrame = CFrame.new(skyPos)

		task.wait(1)

		local backup = savedBasePosition
		savedBasePosition = Vector3.new(backup.X, skyPos.Y, backup.Z)

		floatToBase()

		autoStealTimer = task.delay(15, function()
			if autoStealActive then
				toggleAutoSteal()
			end
		end)

		repeat task.wait() until not floatActive

		hrp.CFrame = CFrame.new(hrp.Position.X, savedHeight, hrp.Position.Z)

		savedBasePosition = backup
		autoStealActive = false
		autoStealCooldown = false
		AutoStealBtn.Text = "Auto Steal: OFF"
		AutoStealBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	else
		if autoStealTimer then
			task.cancel(autoStealTimer)
			autoStealTimer = nil
		end
		autoStealCooldown = false
	end
end

--// CONECTAR O BOTÃO
AutoStealBtn.MouseButton1Click:Connect(toggleAutoSteal)

--// SALVAR BASE AO INICIAR
setBase()

