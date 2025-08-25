local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Screen GUI Setup
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "SCRIPT X"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame (black/grey style)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 240, 0, 140)
frame.Position = UDim2.new(0.5, -120, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
frame.Name = "PetDuplicateFrame"
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Title (nasa taas)
local title = Instance.new("TextLabel", frame)
title.Text = "SCRIPT X"
title.Font = Enum.Font.FredokaOne
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 8)

-- Duplicate Button (nasa ilalim ng SCRIPT X)
local dupeButton = Instance.new("TextButton", frame)
dupeButton.Text = "Duplicate"
dupeButton.Font = Enum.Font.FredokaOne
dupeButton.TextSize = 28
dupeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dupeButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
dupeButton.Size = UDim2.new(0, 200, 0, 50)
dupeButton.Position = UDim2.new(0.5, -100, 0, 55) -- nasa baba ng title
Instance.new("UICorner", dupeButton)

-- Footer Label (updated text)
local footer = Instance.new("TextLabel", frame)
footer.Text = "TIKTOK & YT : M SCRIPTS"
footer.Font = Enum.Font.FredokaOne
footer.TextSize = 12
footer.TextColor3 = Color3.fromRGB(255, 255, 255)
footer.BackgroundTransparency = 1
footer.Size = UDim2.new(1, 0, 0, 18)
footer.Position = UDim2.new(0, 0, 1, -20)

-- Get equipped pet
local function getEquippedPetTool()
	character = player.Character or player.CharacterAdded:Wait()
	for _, tool in pairs(character:GetChildren()) do
		if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
			return tool
		end
	end
	return nil
end

-- Error message popup (Red background UI)
local function showErrorMessage(text)
	local errorLabel = Instance.new("TextLabel", screenGui)
	errorLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	errorLabel.Position = UDim2.new(0.5, 0, 0.45, 0)
	errorLabel.Size = UDim2.new(0, 220, 0, 40)
	errorLabel.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Red
	errorLabel.Text = text
	errorLabel.Font = Enum.Font.FredokaOne
	errorLabel.TextScaled = true
	errorLabel.TextWrapped = true
	errorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	errorLabel.ZIndex = 30
	Instance.new("UICorner", errorLabel)

	task.delay(2.5, function()
		errorLabel:Destroy()
	end)
end

-- Instant duplication
dupeButton.MouseButton1Click:Connect(function()
	local equipped = getEquippedPetTool()
	if not equipped then
		showErrorMessage("No Tool Held!")
		return
	end

	local clone = equipped:Clone()
	clone.Name = equipped.Name
	clone.Parent = player.Backpack
	dupeButton.Text = "✅ Duplicated!"

	task.wait(1.5)
	dupeButton.Text = "Duplicate"
end)
