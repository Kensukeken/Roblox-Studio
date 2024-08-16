function ot(hit)
if hit.Parent ~= nil then
local player = game.Players:playerFromCharacter(hit.Parent)
if player ~= nil then
if player.leaderstats.Stage.Value == script.Parent.Name - 1 then
local h = hit.Parent:FindFirstChild("Humanoid")
if h ~= nil then
if h.Health ~= 0 then
player.leaderstats.Stage.Value = script.Parent.Name
end end end end end end

script.Parent.Touched:connect(ot)
