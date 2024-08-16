local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local ServerStorage = game:GetService("ServerStorage")

local tools = ServerStorage.Tools

local gamePassesTools = {
	{Name = "GravityCoil", ID = 894074473},
	{Name = "RainbowMagicCarpet", ID = 18651703} 
}

Players.PlayerAdded:Connect(function(player)
	for _, v in pairs(gamePassesTools) do 
		local success, hasPass = pcall(function()
			return MarketplaceService:UserOwnsGamePassAsync(player.UserId, v.ID)
		end)

		if success and hasPass then
			print("Player owns game pass:", v.Name) -- Debugging
			local tool1 = tools[v.Name]:Clone()
			tool1.Parent = player.Backpack

			local tool2 = tools[v.Name]:Clone()
			tool2.Parent = player.StarterGear
		elseif not success then
			warn("Error checking game pass:", v.Name, " - ", hasPass) -- Debugging
		else
			print("Player does not own the game pass:", v.Name) -- Debugging
		end
	end
end)

local function OnPromptPurchaseFinished(player, gamepassID, purchaseSuccess)
	if purchaseSuccess then
		print("Purchase successful for game pass ID:", gamepassID) -- Debugging
		for _, v in pairs(gamePassesTools) do
			if v.ID == gamepassID then
				local tool1 = tools[v.Name]:Clone()
				tool1.Parent = player.Backpack

				local tool2 = tools[v.Name]:Clone()
				tool2.Parent = player.StarterGear
				print("Tool added to player:", v.Name) -- Debugging
			end
		end
	else
		print("Purchase failed or canceled for game pass ID:", gamepassID) -- Debugging
	end
end

MarketplaceService.PromptGamePassPurchaseFinished:Connect(OnPromptPurchaseFinished)
