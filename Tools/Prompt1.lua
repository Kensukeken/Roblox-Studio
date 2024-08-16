local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local player = Players.LocalPlayer
local button = script.Parent

local gamepassID = 894074473

button.MouseButton1Click:Connect(function()
	print("Button clicked!") -- Debugging
	local success, errorMsg = pcall(function()
		MarketplaceService:PromptGamePassPurchase(player, gamepassID)
	end)
	if not success then
		warn("Failed to prompt game pass purchase: " .. errorMsg) -- Debugging
	else
		print("Prompting purchase for game pass ID:", gamepassID) -- Debugging
	end
end)
