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
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

  -- Main Tab
  local MainTab = Window:CreateTab("OrdisHubFrfr", 4483362458) -- Title, Image
  local Section = Tab:CreateSection("Main Stuff")
  
  local Button = Tab:CreateButton({
    Name = "ServerHop",
    Callback = function()
        local Player = game.Players.LocalPlayer    
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        
        local _place,_id = game.PlaceId, game.JobId
        -- Asc for lowest player count, Desc for highest player count
        local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=10"
        function ListServers(cursor)
           local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
           return Http:JSONDecode(Raw)
        end
        
        time_to_wait = 120 --seconds
        
        -- choose a random server and join every 2 minutes
        while wait(time_to_wait) do
           --freeze player before teleporting to prevent synapse crash?
           Player.Character.HumanoidRootPart.Anchored = true
           local Servers = ListServers()
           local Server = Servers.data[math.random(1,#Servers.data)]
           TPS:TeleportToPlaceInstance(_place, Server.id, Player)
        end
    end,
 })






  local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image