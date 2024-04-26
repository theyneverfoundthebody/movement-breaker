local toggled = false
local keyCode = Enum.KeyCode.Z
local normalHipHeight = 2.80
local disruptHipHeight = 0
local normalVelocity = Vector3.new(0, 0, 0)
local disruptVelocity = Vector3.new(0, -35, 0)

local function disruptAimbot()
    local humanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    humanoidRootPart.Velocity = disruptVelocity
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = disruptHipHeight
end

local function restoreNormal()
    local humanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    humanoidRootPart.Velocity = normalVelocity
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = normalHipHeight
end

game:GetService('UserInputService').InputBegan:Connect(function(input)
    if input.KeyCode == keyCode and not game:GetService('UserInputService'):GetFocusedTextBox() then
        toggled = not toggled
        if toggled then
            disruptAimbot()
        else
            restoreNormal()
        end
    end
end)
