local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Player = Players.LocalPlayer

local GuiController = require(script.Parent.Parent.Parent.GuiController)
local StageConfig = require(ReplicatedStorage.Configs.Stages)

local Gui = GuiController.Guis.Top
local ProgressBar = Gui.Frame.Stage

local STAGE_TEXT = "Stage AMOUNT (PERCENT%)"

local Local = {}
local Shared = {}

function Shared.OnStart()
	local leaderstats = Player:WaitForChild("leaderstats")
	local stage: NumberValue = leaderstats:WaitForChild("Stage")
	
	Local.UpdateProgress(stage.Value)
	
	stage.Changed:Connect(function(value:number)
		Local.UpdateProgress(value)
	end)
end


function Local.UpdateProgress(stage: number)
	local totalStages = StageConfig.GetTotalStages()
	local progressPercent = stage / totalStages
	
	local progressText = STAGE_TEXT:gsub("AMOUNT", stage)
	progressText = progressText:gsub("PERCENT", math.floor(progressPercent * 100))
		GuiController.HandleProgressBar(ProgressBar, progressPercent, progressText)
end

return Shared
