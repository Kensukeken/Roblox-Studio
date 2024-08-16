local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui

local module = {}
local Shared = {}

Shared.Guis = {
	Top = PlayerGui:WaitForChild("Top")
}
function Shared.HandleProgressBar(progressBar: CanvasGroup, progressAmount: number, progressText:string?)
	local progressFrame= progressBar:FindFirstChild("Progress") or progressBar:FindFirstChildOfClass("Frame")
	if progressFrame and progressFrame:IsA("Frame") then
		local percent = math.clamp(progressAmount, 0,1)
		local newSize = UDim2.fromScale(percent, 1)

		local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
		local tweenGoal = {}
		tweenGoal.Size = newSize
		
		local tween = TweenService:Create(progressFrame, tweenInfo, tweenGoal)
		tween:Play()
	end
	local textLabel = progressBar:FindFirstChild("Amount") or progressBar:FindFirstChildOfClass("TextLabel")
	if progressText and textLabel and textLabel:IsA("TextLabel") then
		textLabel.Text = progressText
	end
end


return module
