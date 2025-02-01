
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Ordis Hub",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Ordis Hub",
    LoadingSubtitle = "by OrdisHQ",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Ordis Hub",
       Subtitle = "Key System",
       Note = "Type ordis", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"ordis"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })




 ------------------------------------------------------------------------------------ Main Tab ------------------------------------------------------------------------------------
 local Tab = Window:CreateTab("Main") -- Title, Image









 ------------------------------------------------------------------------------------ AutoFarm Tab ------------------------------------------------------------------------------------
 local Tab = Window:CreateTab("AutoFarm") -- Title, Image







 ------------------------------------------------------------------------------------ Player Tab ------------------------------------------------------------------------------------  
  local Tab = Window:CreateTab("Player") -- Title, Image






  ----------------------------------------------------------------------------------- Teleports Tab ------------------------------------------------------------------------------------
  local Tab = Window:CreateTab("Teleport") -- Title, Image


 -- Town Teleports ------------------------------------------------------------------------------------
  local Section = Tab:CreateSection("Town Teleports")

  local Button = Tab:CreateButton({
   Name = "Shijo Town | Level 1",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.CFrame = CFrame.new(4317.55469, 653.036743, -1139.77734)
      end
   end,
})

local Button = Tab:CreateButton({
   Name = "Umi Village | Level 60+",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.CFrame = CFrame.new(2775.34619, 669.725342, 270.112671)
      end
   end,
})

local Button = Tab:CreateButton({
   Name = "Numa Temple | Level 120+",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.CFrame = CFrame.new(6074.58105, 982.393555, -476.648346)
      end
   end,
})

local Button = Tab:CreateButton({
   Name = "Kura Camp | Level 180+",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.CFrame = CFrame.new(8515.73926, 773.933716, 1577.75525)
      end
   end,
})

local Button = Tab:CreateButton({
   Name = "Yuki Fortress | Level 240+",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.CFrame = CFrame.new(3779.62646, 1440.41016, 2265.01685)
      end
   end,
})

-- World Boss TPs  ------------------------------------------------------------------------------------
local Section = Tab:CreateSection("World Boss Spawn Locations")

local Button = Tab:CreateButton({
   Name = "Mantis Boss",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.CFrame = CFrame.new(5248.64893, 727.586365, -2174.27515)
      end
   end,
})

local Button = Tab:CreateButton({
   Name = "Monk Boss",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.CFrame = CFrame.new(4064.35645, 634.277832, 77.6425781)
      end
   end,
})

local Button = Tab:CreateButton({
   Name = "EggJaw",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
          player.Character.HumanoidRootPart.CFrame = CFrame.new(6525.77441, 697.738342, 3276.10059)
      end
   end,
})




 ------------------------------------------------------------------------------------ Misc Tab ------------------------------------------------------------------------------------
 local Tab = Window:CreateTab("Misc") -- Title, Image
 local Section = Tab:CreateSection("Server Commands")

 local Button = Tab:CreateButton({
    Name = "Server Hop (Low Player)",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        
        local _place = game.PlaceId
        local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
        function ListServers(cursor)
          local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
          return Http:JSONDecode(Raw)
        end
        
        local Server, Next; repeat
          local Servers = ListServers(Next)
          Server = Servers.data[1]
          Next = Servers.nextPageCursor
        until Server
        
        TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
    end,
 })

 local Section = Tab:CreateSection("Credits:")
 local Button = Tab:CreateButton({
    Name = "Copy Discord Invite",
    Callback = function()
        setclipboard("https://discord.gg/valorant") -- Copies the Discord invite link to the clipboard
    end,
 })
 













Rayfield:LoadConfiguration()
