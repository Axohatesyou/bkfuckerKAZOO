local commands = {}
local commandsarg = {}
local callbacks = {}

local rs = game:GetService("ReplicatedStorage")
local l = game:GetService("Lighting")


if game.CoreGui:FindFirstChild("joeeeeeeeebiden") then
    game.CoreGui:FindFirstChild("joeeeeeeeebiden"):Destroy()
    if getgenv().funnyuserinputservicething then
        getgenv().funnyuserinputservicething:Disconnect()
    end
end

local api = {}

function api.createCommand(command,arg,callback)
    table.insert(commands,command:lower())
    table.insert(commandsarg,arg:lower())
    table.insert(callbacks,callback)
end


function api.getplayer(string,callback)
    if string == "me" then
        spawn(function()
        callback(game.Players.LocalPlayer)
        end)
        return
    end
    if string == "all" then
        for i, v in pairs(game.Players:GetChildren()) do
            spawn(function()
                callback(v)
            end)
        end
        return
    end
    if string == "others" then
        for i, v in pairs(game.Players:GetChildren()) do
            if v ~= game.players.LocalPlayer then
            spawn(function()
                callback(v)
            end)
        end
        end
        return
    end
    if string ~= "others" and string ~= "all" and string ~= "me" then
        for i, v in pairs(game.Players:GetChildren()) do
            if v.Name:lower():match(string) then
                spawn(function()
                    callback(v)
                end)
            elseif v.DisplayName:lower():match(string) then
                spawn(function()
                    callback(v)
                end)
            end
        end
        return
    end
end
function swait(int)
    for i = 1,int do
        game:GetService("RunService").Heartbeat:Wait()
    end
end


-- pcall(function() -- so script doesnt shit itself
    local segways = {}
    local mine = {}
    function gets()
        local decided = nil
            for i, v in pairs(mine) do
                if v.Parent ~= nil and (v:IsDescendantOf(workspace) or v:IsDescendantOf(l) or v:IsDescendantOf(game.Players)) then
                    decided = v
                end
            end
            if decided == nil then
                for i, v in pairs(segways) do
                    if v.Parent ~= nil and (v:IsDescendantOf(workspace) or v:IsDescendantOf(l) or v:IsDescendantOf(game.Players)) then
                        decided = v
                    end
                end
            end
        return decided
    end
    -- ed segway omg ed sheeran my babe
    l.DescendantAdded:Connect(function(v)
        if v.Name == "HandlessSegway" then -- less gooo
            if not segways[table.find(segways,v)] then
                table.insert(segways,#segways + 1, v)
            end
        end
    end)
    for i, v in pairs(l:GetDescendants()) do
        if v.Name == "HandlessSegway" then -- less gooo
            if not segways[table.find(segways,v)] then
                table.insert(segways,#segways + 1, v)
            end
        end
    end
    rs.DescendantAdded:Connect(function(v)
        if v.Name == "HandlessSegway" then -- less gooo
            if not segways[table.find(segways,v)] then
                table.insert(segways,#segways + 1, v)
            end
        end
    end)
    for i, v in pairs(rs:GetDescendants()) do
        if v.Name == "HandlessSegway" then -- less gooo
            if not segways[table.find(segways,v)] then
                table.insert(segways,#segways + 1, v)
            end
        end
    end
    for i, plr in pairs(game.Players:GetChildren()) do
        local segways = segways -- dunno what the fuck this does but reggie did it so yea
        if plr == game.Players.LocalPlayer then
            segways = mine -- dunno what the fuck this does but reggie did it so yea
        end
        plr.Backpack.DescendantAdded:Connect(function(v)
            if v.Name == "HandlessSegway" then -- less gooo
                if not segways[table.find(segways,v)] then
                    table.insert(segways,#segways + 1, v)
                end
            end
        end)
        for i, v in pairs(plr.Backpack:GetChildren()) do
            if v.Name == "HandlessSegway" then -- less gooo
                if not segways[table.find(segways,v)] then
                    table.insert(segways,#segways + 1, v)
                end
            end
        end
        if plr.Character then
            for i, v in pairs(plr.Character:GetDescendants()) do
                if v.Name == "HandlessSegway" then -- less gooo
                    if not segways[table.find(segways,v)] then
                        table.insert(segways,#segways + 1, v)
                    end
                end
            end
            plr.Character.DescendantAdded:Connect(function(v)
                if v.Name == "HandlessSegway" then -- less gooo
                    if not segways[table.find(segways,v)] then
                        table.insert(segways,#segways + 1, v)
                    end
                end
            end)
        end
        plr.CharacterAdded:Connect(function(char)
            for i, v in pairs(char:GetDescendants()) do
                if v.Name == "HandlessSegway" then -- less gooo
                    if not segways[table.find(segways,v)] then
                        table.insert(segways,#segways + 1, v)
                    end
                end
            end
            char.DescendantAdded:Connect(function(v)
                    if v.Name == "HandlessSegway" then -- less gooo
                        if not segways[table.find(segways,v)] then
                            table.insert(segways,#segways + 1, v)
                        end
                    end
            end)
        end)
    end

    api.createCommand("hidename","plr",function(v)
        api.getplayer(v[2],function(plr)
            if plr == game.Players.LocalPlayer then
                game:GetService("RunService").Heartbeat:Connect(function()
                    swait(5)
                    if game.Players.LocalPlayer.Character then
                        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                            if v:IsA("BillboardGui") then
                                v:Destroy()
                            end
                        end
                    end
                end)
            end
        end)
    end)
    
    api.createCommand("invisiblechat","args",function(v)
        local rewrite = ""
        for i, x in pairs(v) do
            if i == 1 then
                rewrite = rewrite..x
            else
                rewrite = rewrite.." "..x
            end
            
        end
        local args = string.gsub(rewrite,"invisiblechat ","")
        game.Players:Chat(args)
    end)
    
    api.createCommand("headless","plr",function(v)
        api.getplayer(v[2],function(plr)
            local segway = gets()
            if segway then
            local re = segway.RemoteEvents:FindFirstChild("UndoHasWelded")
            if plr then
                if plr.Character then
                    if re then
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").HeadScale
                                }, Name = 'Seater'
                            }
                        })
                    end
                end
            end
        end
        end)
    end)
        
    api.createCommand("squish","plr",function(v)
        api.getplayer(v[2],function(plr)
            local segway = gets()
            if segway then
            local re = segway.RemoteEvents:FindFirstChild("UndoHasWelded")
            if plr then
                if plr.Character then
                    if re then
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").BodyHeightScale
                                }, Name = 'Seater'
                            }
                        })
                    end
                end
            end
        end
        end)
    end)
    api.createCommand("flat","plr",function(v)
        api.getplayer(v[2],function(plr)
            local segway = gets()
            if segway then
            local re = segway.RemoteEvents:FindFirstChild("UndoHasWelded")
            if plr then
                if plr.Character then
                    if re then
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").BodyDepthScale
                                }, Name = 'Seater'
                            }
                        })
                    end
                end
            end
        end
        end)
    end)
    api.createCommand("stick","plr",function(v)
        api.getplayer(v[2],function(plr)
            local segway = gets()
            if segway then
            local re = segway.RemoteEvents:FindFirstChild("UndoHasWelded")
            if plr then
                if plr.Character then
                    if re then
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").BodyDepthScale
                                }, Name = 'Seater'
                            }
                        })
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").BodyWidthScale
                                }, Name = 'Seater'
                            }
                        })
                    end
                end
            end
        end
        end)
    end)
    api.createCommand("skinny","plr",function(v)
        api.getplayer(v[2],function(plr)
            local segway = gets()
            if segway then
            local re = segway.RemoteEvents:FindFirstChild("UndoHasWelded")
            if plr then
                if plr.Character then
                    if re then
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").BodyWidthScale
                                }, Name = 'Seater'
                            }
                        })
                    end
                end
            end
        end
        end)
    end)
    api.createCommand("invisible","plr",function(v)
        api.getplayer(v[2],function(plr)
            local segway = gets()
            if segway then
            local re = segway.RemoteEvents:FindFirstChild("UndoHasWelded")
            if plr then
                if plr.Character then
                    if re then
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").BodyDepthScale
                                }, Name = 'Seater'
                            }
                        })
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").BodyWidthScale
                                }, Name = 'Seater'
                            }
                        })
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").BodyHeightScale
                                }, Name = 'Seater'
                            }
                        })
                        re:FireServer({
                            Value = {
                                Parent = {
                                    HasWelded = plr.Character:FindFirstChildWhichIsA("Humanoid").HeadScale
                                }, Name = 'Seater'
                            }
                        })
                    end
                end
            end
        end
        end)
    end)

    api.createCommand("view","plr",function(v)
        api.getplayer(v[2],function(plr)
            pcall(function()
                game.Workspace.CurrentCamera.CameraSubject = plr.Character:FindFirstChildWhichIsA("Humanoid")
            end)
        end)
    end)
    api.createCommand("unview","",function(v)
        pcall(function()
            game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
        end)
    end)

    api.createCommand("reinfect","",function(v)
        table.clear(mine)
        table.clear(segways)
        for i, v in pairs(l:GetDescendants()) do
            if v.Name == "HandlessSegway" then -- less gooo
                if not segways[table.find(segways,v)] then
                    table.insert(segways,#segways + 1, v)
                end
            end
        end
        for i, v in pairs(rs:GetDescendants()) do
            if v.Name == "HandlessSegway" then -- less gooo
                if not segways[table.find(segways,v)] then
                    table.insert(segways,#segways + 1, v)
                end
            end
        end
        for i, plr in pairs(game.Players:GetChildren()) do
            local segways = segways -- dunno what the fuck this does but reggie did it so yea
            if plr == game.Players.LocalPlayer then
                segways = mine -- dunno what the fuck this does but reggie did it so yea
            end
            for i, v in pairs(plr.Backpack:GetChildren()) do
                if v.Name == "HandlessSegway" then -- less gooo
                    if not segways[table.find(segways,v)] then
                        table.insert(segways,#segways + 1, v)
                    end
                end
            end
            if plr.Character then
                for i, v in pairs(plr.Character:GetDescendants()) do
                    if v.Name == "HandlessSegway" then -- less gooo
                        if not segways[table.find(segways,v)] then
                            table.insert(segways,#segways + 1, v)
                        end
                    end
                end
            end
            plr.CharacterAdded:Connect(function(char)
                for i, v in pairs(char:GetDescendants()) do
                    if v.Name == "HandlessSegway" then -- less gooo
                        if not segways[table.find(segways,v)] then
                            table.insert(segways,#segways + 1, v)
                        end
                    end
                end
        end)
    end
    end)

    api.createCommand("invischat","args",function(v)
        local rewrite = ""
        for i, x in pairs(v) do
            if i == 1 then
                rewrite = rewrite..x
            else
                rewrite = rewrite.." "..x
            end
            
        end
        local args = string.gsub(rewrite,"invisiblechat ","")
        game.Players:Chat(args)
    end)
    api.createCommand("ree","args",function(v)
        print('ok boomer')
    end)    




local joeeeeeeeebiden = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Login = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local shedow = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local username = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local shedow_2 = Instance.new("ImageLabel")
local pw = Instance.new("TextBox")
local UICorner_4 = Instance.new("UICorner")
local shedow_3 = Instance.new("ImageLabel")
local gradient = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local gradientender = Instance.new("Frame")
local UIGradient_2 = Instance.new("UIGradient")
local DropShadowHolder = Instance.new("Frame")
local DropShadow = Instance.new("ImageLabel")


--Properties:

joeeeeeeeebiden.Name = "joeeeeeeeebiden"
joeeeeeeeebiden.Parent = game.CoreGui
joeeeeeeeebiden.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = joeeeeeeeebiden
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 256, 0, 271)

Login.Name = "Login"
Login.Parent = Frame
Login.AnchorPoint = Vector2.new(0.5, 0.5)
Login.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Login.ClipsDescendants = true
Login.Position = UDim2.new(0.5, 0, 0.5, 0)
Login.Size = UDim2.new(0, 256, 0, 271)

UICorner.Parent = Login

TextButton.Parent = Login
TextButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextButton.Position = UDim2.new(0.10546875, 0, 0.77648735, 0)
TextButton.Size = UDim2.new(0, 200, 0, 39)
TextButton.AutoButtonColor = false
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "Login"
TextButton.TextColor3 = Color3.fromRGB(179, 135, 255)
TextButton.TextSize = 14.000

shedow.Name = "shedow"
shedow.Parent = TextButton
shedow.AnchorPoint = Vector2.new(0.5, 0.5)
shedow.BackgroundTransparency = 1.000
shedow.BorderSizePixel = 0
shedow.Position = UDim2.new(0.5, 0, 0.5, 1)
shedow.Size = UDim2.new(1, 14, 1, 15)
shedow.ZIndex = -1
shedow.Image = "rbxassetid://1316045217"
shedow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shedow.ImageTransparency = 0.600
shedow.ScaleType = Enum.ScaleType.Slice
shedow.SliceCenter = Rect.new(10, 10, 118, 118)

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = TextButton

username.Name = "username"
username.Parent = Login
username.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
username.Position = UDim2.new(0.1015625, 0, 0.259018362, 0)
username.Size = UDim2.new(0, 200, 0, 40)
username.Font = Enum.Font.Gotham
username.PlaceholderColor3 = Color3.fromRGB(236, 236, 236)
username.PlaceholderText = "Username"
username.Text = ""
username.TextColor3 = Color3.fromRGB(179, 135, 255)
username.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(0, 4)
UICorner_3.Parent = username

shedow_2.Name = "shedow"
shedow_2.Parent = username
shedow_2.AnchorPoint = Vector2.new(0.5, 0.5)
shedow_2.BackgroundTransparency = 1.000
shedow_2.BorderSizePixel = 0
shedow_2.Position = UDim2.new(0.5, 0, 0.5, 1)
shedow_2.Size = UDim2.new(1, 14, 1, 15)
shedow_2.ZIndex = -1
shedow_2.Image = "rbxassetid://1316045217"
shedow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
shedow_2.ImageTransparency = 0.600
shedow_2.ScaleType = Enum.ScaleType.Slice
shedow_2.SliceCenter = Rect.new(10, 10, 118, 118)

pw.Name = "pw"
pw.Parent = Login
pw.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
pw.Position = UDim2.new(0.101187497, 0, 0.477490842, 0)
pw.Size = UDim2.new(0, 200, 0, 40)
pw.Font = Enum.Font.Gotham
pw.PlaceholderColor3 = Color3.fromRGB(236, 236, 236)
pw.PlaceholderText = "Password"
pw.Text = ""
pw.TextColor3 = Color3.fromRGB(179, 135, 255)
pw.TextSize = 14.000

UICorner_4.CornerRadius = UDim.new(0, 4)
UICorner_4.Parent = pw

shedow_3.Name = "shedow"
shedow_3.Parent = pw
shedow_3.AnchorPoint = Vector2.new(0.5, 0.5)
shedow_3.BackgroundTransparency = 1.000
shedow_3.BorderSizePixel = 0
shedow_3.Position = UDim2.new(0.5, 0, 0.5, 1)
shedow_3.Size = UDim2.new(1, 14, 1, 15)
shedow_3.ZIndex = -1
shedow_3.Image = "rbxassetid://1316045217"
shedow_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
shedow_3.ImageTransparency = 0.600
shedow_3.ScaleType = Enum.ScaleType.Slice
shedow_3.SliceCenter = Rect.new(10, 10, 118, 118)

gradient.Name = "gradient"
gradient.Parent = Login
gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gradient.BorderSizePixel = 0
gradient.Size = UDim2.new(0, 256, 0, 30)
gradient.ZIndex = -9

UICorner_5.Parent = gradient

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(179, 135, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(118, 89, 168))}
UIGradient.Rotation = 10
UIGradient.Parent = gradient

gradientender.Name = "gradientender"
gradientender.Parent = Login
gradientender.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gradientender.BorderSizePixel = 0
gradientender.Position = UDim2.new(0, 0, 0.0288743582, 0)
gradientender.Size = UDim2.new(0, 256, 0, 29)
gradientender.ZIndex = -9

UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(179, 135, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(118, 89, 168))}
UIGradient_2.Rotation = 10
UIGradient_2.Parent = gradientender

DropShadowHolder.Name = "DropShadowHolder"
DropShadowHolder.Parent = Frame
DropShadowHolder.BackgroundTransparency = 1.000
DropShadowHolder.BorderSizePixel = 0
DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
DropShadowHolder.ZIndex = 0

DropShadow.Name = "DropShadow"
DropShadow.Parent = DropShadowHolder
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6014261993"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)



TextButton.MouseButton1Click:Connect(function()
	local usernames = {"Kazoo"}
	local passwords = {"NfhV8hcNTz"}
	if table.find(usernames,username.Text) and table.find(passwords,pw.Text) then
		Frame:Destroy()
		local cmdbar = Instance.new("Frame")
		local UICorner_6 = Instance.new("UICorner")
		local DropShadow_2 = Instance.new("ImageLabel")
		local logo = Instance.new("ImageLabel")
		local UIGradient_3 = Instance.new("UIGradient")
		local UIGradient_4 = Instance.new("UIGradient")
		local suggestion = Instance.new("TextLabel")
		cmdbar.Name = "cmdbar"
		cmdbar.Parent = joeeeeeeeebiden
		cmdbar.AnchorPoint = Vector2.new(0.5, 0.5)
		cmdbar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		cmdbar.Position = UDim2.new(0.5, 0, 1.5, 0)
		cmdbar.Size = UDim2.new(0, 899, 0, 52)

		UICorner_6.Parent = cmdbar

		DropShadow_2.Name = "DropShadow"
		DropShadow_2.Parent = cmdbar
		DropShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
		DropShadow_2.BackgroundTransparency = 1.000
		DropShadow_2.BorderSizePixel = 0
		DropShadow_2.Position = UDim2.new(0.497716159, 0, 0.499914318, 0)
		DropShadow_2.Size = UDim2.new(1.0098201, 47, 1.02915442, 47)
		DropShadow_2.ZIndex = 0
		DropShadow_2.Image = "rbxassetid://6014261993"
		DropShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
		DropShadow_2.ImageTransparency = 0.700
		DropShadow_2.ScaleType = Enum.ScaleType.Slice
		DropShadow_2.SliceCenter = Rect.new(49, 49, 450, 450)

		logo.Name = "logo"
		logo.Parent = cmdbar
		logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		logo.BackgroundTransparency = 1.000
		logo.Position = UDim2.new(0.0100111235, 0, 0.153846145, 0)
		logo.Size = UDim2.new(0, 35, 0, 35)
		logo.Image = "rbxassetid://7072706745"

		UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(179, 135, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(118, 89, 168))}
		UIGradient_3.Rotation = 10
		UIGradient_3.Parent = logo

        local text = Instance.new("TextBox") 
        text.Name = "text"
        text.Parent = cmdbar
        text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        text.BackgroundTransparency = 1.000
        text.Position = UDim2.new(0.063000001, 0, 0.211999997, 0)
        text.Size = UDim2.new(0, 200, 0, 30)
        text.ClearTextOnFocus = false
        text.Font = Enum.Font.Gotham
        text.Text = "invisi"
        text.TextColor3 = Color3.fromRGB(179, 135, 255)
        text.TextSize = 18.000
        text.TextXAlignment = Enum.TextXAlignment.Left
        

		suggestion.Name = "suggestion"
		suggestion.Parent = cmdbar
		suggestion.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		suggestion.BackgroundTransparency = 1.000
		suggestion.Position = UDim2.new(0.0634037852, 0, 0.211538464, 0)
		suggestion.Size = UDim2.new(0, 200, 0, 30)
		suggestion.ZIndex = -10
		suggestion.Font = Enum.Font.Gotham
		suggestion.Text = "invisible [plr]"
		suggestion.TextColor3 = Color3.fromRGB(118, 118, 118)
		suggestion.TextSize = 18.000
		suggestion.TextXAlignment = Enum.TextXAlignment.Left

        local cmdbart = false;
        local mouse = game.Players.LocalPlayer:GetMouse()

        getgenv().funnyuserinputservicething = game:GetService("UserInputService").InputBegan:Connect(function(input, typing)
            if not typing then
                if input.KeyCode == Enum.KeyCode.Semicolon then
                    if cmdbar.Position == UDim2.new(0.5,0,1.5,0) then
                    suggestion.Text = "Type something.."
                    text.Text = ""
                    cmdbar:TweenPosition(UDim2.new(0.5, 0, 0.9, 0),"InOut","Sine",0.8)
                    cmdbart = true
                    wait(0.5)
                    text:CaptureFocus()
                    else
                    cmdbar:TweenPosition(UDim2.new(0.5, 0, 1.5, 0),"InOut","Sine",1)
                    cmdbart = false
                    end
                end
            end
        end)

        text.FocusLost:Connect(function()
            if cmdbart == true then
                for _,Command in pairs(commands) do
                    Command = Command:lower()
                    if string.match(text.Text,Command) then
                        print("ok matches")
                        local args = string.split(text.Text," ")
                        pcall(function()
                            spawn(function()
                                callbacks[_](args)
                            end)
                        end)
                    end
                end
                cmdbart = false
                cmdbar:TweenPosition(UDim2.new(0.5, 0, 1.5, 0),"InOut","Sine",1)
            end
        end)

        mouse.Button1Down:Connect(function()
            if cmdbart == true then
                cmdbar:TweenPosition(UDim2.new(0.5, 0, 1.5, 0),"InOut","Sine",1)
                cmdbart = false
                text:ReleaseFocus()
            end
        end)
        mouse.Button2Down:Connect(function()
            if cmdbart == true then
                cmdbar:TweenPosition(UDim2.new(0.5, 0, 1.5, 0),"InOut","Sine",1)
                cmdbart = false
                text:ReleaseFocus()
            end
        end)


        text.Changed:Connect(function()
            for _,Command in pairs(commands) do
                Command = Command:lower()
                
                if text.Text == "" then
                    suggestion.Text = ""
                elseif text.Text == string.sub(Command, 1, string.len(text.Text)) then
                    if commandsarg[_] == "" then
                        suggestion.Text = Command
                    else
                        suggestion.Text = Command.." ["..commandsarg[_].."]"
                    end
                    
                    
                    break
                else
                    suggestion.Text = ""
                end
            end
        end)
	else
		return ""
	end
end)