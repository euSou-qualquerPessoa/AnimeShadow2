    local vu2 = loadstring(game:HttpGet([[https://raw.githubusercontent.com/AkatsukiHub1/Akatsuki-UI/refs/heads/main/README.md]]))()
    local v3 = vu2
    local v4 = vu2.MakeWindow(v3, {
        'DesplockHub : Anime Shadow 2',
        'by Plock4444',
        'DesplockHub Anime Shadow2. json',
    })
    local v5 = {
        Discord = v4:MakeTab({
            'Discord',
            'Info',
        }),
        Main = v4:MakeTab({
            'Main',
            'Home',
        }),
        Stars = v4:MakeTab({
            'Stars',
            'Star',
        }),
        Trait = v4:MakeTab({
            'Traits',
            'PalmTree',
        }),
        Trials = v4:MakeTab({
            'Gamemodes',
            'Clock',
        }),
        Teams = v4:MakeTab({
            'Teams',
            'Hand',
        }),
        Items = v4:MakeTab({
            'Quests/Items',
            'Swords',
        }),
        Teleport = v4:MakeTab({
            'Teleport',
            'Locate',
        }),
        Misc = v4:MakeTab({
            'Misc',
            'Settings',
        }),
    }

    v4:AddMinimizeButton({
        Button = {
            Image = 'rbxassetid://128390918606914',
            BackgroundTransparency = 0,
        },
        Corner = {
            CornerRadius = UDim.new(0, 6),
        },
    })
    v5.Main:AddSection({
        'Auto Farm',
    })
    v5.Misc:AddSection({
        'Misc',
    })
    v5.Teams:AddSection({
        'Teams',
    })
    v5.Stars:AddSection({
        'Auto Roll',
    })
    v5.Trials:AddSection({
        'Auto Attack',
    })
    v5.Items:AddSection({
        'Quests',
    })
    v5.Teleport:AddSection({
        'Teleports',
    })
    v5.Misc:AddDropdown({
        Name = 'UI Size',
        Options = {
            'Normal',
            'Small',
        },
        Default = 'Normal',
        Callback = function(p6)
            vu2:SetScale(p6 == 'Small' and 900 or (p6 == 'Normal' and 450 or 450))
        end,
    })
    game:GetService('ReplicatedStorage')
    game:GetService('TweenService')

    local vu7 = game:GetService('RunService')
    local v8 = game:GetService('Players')

    game:GetService('VirtualInputManager')

    local vu9 = game:GetService('GuiService')

    game:GetService('UserInputService')

    local vu10 = v8.LocalPlayer

    local function v16(p11)
        getgenv().no_clip = p11

        while getgenv().no_clip do
            if vu10.Character then
                local v12 = next
                local v13, v14 = vu10.Character:GetDescendants()

                while true do
                    local v15

                    v14, v15 = v12(v13, v14)

                    if v14 == nil then
                        break
                    end
                    if v15:IsA('BasePart') and v15.CanCollide then
                        v15.CanCollide = false
                    end
                end
            end

            vu7.Stepped:Wait()
        end
    end

    local vu17 = - 1

    v5.Misc:AddSlider({
        'Walk Speed',
        16,
        200,
        1,
        34,
        function(p18)
            local v19 = (vu10.Character or vu10.CharacterAdded:Wait()):WaitForChild('Humanoid')

            vu17 = p18

            while vu17 == p18 and (v19 and v19.Health > 0) do
                v19.WalkSpeed = p18

                task.wait()
            end
        end,
    })
    v5.Misc:AddToggle({
        'Noclip',
        false,
        v16,
    })

    local vu20 = false

    local function v22(p21)
        vu20 = p21

        while vu20 do
            game:GetService('VirtualInputManager'):SendKeyEvent(true, 'CapsLock', false, game)
            game:GetService('VirtualInputManager'):SendKeyEvent(false, 'CapsLock', false, game)
            task.wait(10)
        end
    end

    v5.Misc:AddToggle({
        'Anti-Afk',
        true,
        v22,
    })
    v5.Misc:AddToggle({
        Name = 'Disable 3D Render',
        Default = false,
        Callback = function(p23)
            if p23 then
                local v24 = Instance.new('ScreenGui')

                v24.Name = 'BlackScreen'
                v24.IgnoreGuiInset = true
                v24.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                v24.DisplayOrder = - 1

                local v25 = Instance.new('Frame')

                v25.Size = UDim2.new(1, 0, 1, 0)
                v25.BackgroundColor3 = Color3.new(0, 0, 0)
                v25.BorderSizePixel = 0
                v25.Parent = v24

                local v26 = {
                    game:GetService('CoreGui'),
                    game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui'),
                }
                local v27, v28, v29 = ipairs(v26)

                while true do
                    local v30

                    v29, v30 = v27(v28, v29)

                    if v29 == nil then
                        break
                    end

                    v24:Clone().Parent = v30
                end

                game:GetService('RunService'):Set3dRenderingEnabled(false)

                settings().Rendering.QualityLevel = 1
                game:GetService('Lighting').GlobalShadows = false
                getgenv().BlackScreenGuis = v26
            else
                if getgenv().BlackScreenGuis then
                    local v31, v32, v33 = ipairs(getgenv().BlackScreenGuis)

                    while true do
                        local v34

                        v33, v34 = v31(v32, v33)

                        if v33 == nil then
                            break
                        end

                        local v35 = v34:FindFirstChild('BlackScreen')

                        if v35 then
                            v35:Destroy()
                        end
                    end

                    getgenv().BlackScreenGuis = nil
                end

                game:GetService('RunService'):Set3dRenderingEnabled(true)

                settings().Rendering.QualityLevel = 10
                game:GetService('Lighting').GlobalShadows = true
            end
        end,
    })
    v5.Misc:AddButton({
        'Rejoin',
        function()
            if vu10 and vu10.Character and vu10.Character:FindFirstChild('HumanoidRootPart') then
                game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, vu10)
            else
                warn('Jogador ou personagem n\u{c3}\u{a3}o encontrado para teletransportar.')
            end
        end,
    })

    vu9.AutoSelectGuiEnabled = false

    local function _()
        local v36 = game.Players.LocalPlayer

        if not v36 then
            return false
        end

        local v37 = v36:WaitForChild('PlayerGui')
        local v38, v39, v40 = ipairs(v37:GetChildren())

        while true do
            local v41

            v40, v41 = v38(v39, v40)

            if v40 == nil then
                break
            end
            if v41:IsA('ScreenGui') then
                local v42, v43, v44 = ipairs(v41:GetDescendants())

                while true do
                    local v45

                    v44, v45 = v42(v43, v44)

                    if v44 == nil then
                        break
                    end
                    if v45:IsA('GuiObject') and (v45.Selectable and v45.Visible) then
                        vu9.SelectedObject = v45

                        return true
                    end
                end
            end
        end

        return false
    end

    local vu46 = false

    v5.Items:AddToggle({
        Name = 'Auto Claim Daily Rewards',
        Default = false,
        Callback = function(p47)
            vu46 = p47

            if vu46 then
                for v48 = 1, 7 do
                    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack({
                        'General',
                        'DailyRewards',
                        'Claim',
                        v48,
                    }))
                    task.wait(0.2)
                end
            end
        end,
    })
    task.spawn(function()
        while true do
            if vu46 then
                for v49 = 1, 7 do
                    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack({
                        'General',
                        'DailyRewards',
                        'Claim',
                        v49,
                    }))
                    task.wait(0.2)
                end
            end

            task.wait(3600)
        end
    end)

    local v50 = v5.Discord

    v50:AddDiscordInvite({
        Name = 'Desplock hub | Community',
        Description = [[Join our discord community to receive information about the next update]],
        Logo = 'rbxassetid://131723242350068',
        Invite = '131723242350068',
    })
    v50:AddSection('')
    v50:AddParagraph({
        'Mentions:\n Honorable Mention: RealRedz ',
    })

    local vu51 = ''
    local vu52 = false

    v5.Teams:AddDropdown({
        Name = 'Trial Team',
        Default = 'None',
        Options = {
            'Team 1',
            'Team 2',
            'Team 3',
            'Team 4',
            'Team 5',
            'Team 6',
            'Team 7',
        },
        Callback = function(p53)
            if typeof(p53) ~= 'string' or p53 == '' then
                vu51 = ''
            else
                vu51 = p53
                vu52 = false
            end
        end,
    })

    local vu54 = ''
    local vu55 = false

    v5.Teams:AddDropdown({
        Name = 'Tower Team',
        Default = 'None',
        Options = {
            'Team 1',
            'Team 2',
            'Team 3',
            'Team 4',
            'Team 5',
            'Team 6',
            'Team 7',
        },
        Callback = function(p56)
            if typeof(p56) ~= 'string' or p56 == '' then
                vu54 = ''
            else
                vu54 = p56
                vu55 = false
            end
        end,
    })

    local vu57 = ''
    local vu58 = false

    v5.Teams:AddDropdown({
        Name = 'Dungeon Team',
        Default = 'None',
        Options = {
            'Team 1',
            'Team 2',
            'Team 3',
            'Team 4',
            'Team 5',
            'Team 6',
            'Team 7',
        },
        Callback = function(p59)
            if typeof(p59) ~= 'string' or p59 == '' then
                vu57 = ''
            else
                vu57 = p59
                vu58 = false
            end
        end,
    })

    local vu60 = ''
    local vu61 = false

    v5.Teams:AddDropdown({
        Name = 'Raid Team',
        Default = 'None',
        Options = {
            'Team 1',
            'Team 2',
            'Team 3',
            'Team 4',
            'Team 5',
            'Team 6',
            'Team 7',
        },
        Callback = function(p62)
            if typeof(p62) ~= 'string' or p62 == '' then
                vu60 = ''
            else
                vu60 = p62
                vu61 = false
            end
        end,
    })

    local vu63 = ''
    local vu64 = false

    v5.Teams:AddDropdown({
        Name = 'Roll Team',
        Default = 'None',
        Options = {
            'Team 1',
            'Team 2',
            'Team 3',
            'Team 4',
            'Team 5',
            'Team 6',
            'Team 7',
        },
        Callback = function(p65)
            if typeof(p65) ~= 'string' or p65 == '' then
                vu63 = ''
            else
                vu63 = p65
                vu64 = false
            end
        end,
    })

    local vu66 = {
        ['Team 1'] = 'Team1',
        ['Team 2'] = 'Team2',
        ['Team 3'] = 'Team3',
        ['Team 4'] = 'Team4',
        ['Team 5'] = 'Team5',
        ['Team 6'] = 'Team6',
        ['Team 7'] = 'Team7',
    }

    game:GetService('RunService').RenderStepped:Connect(function()
        local v67 = game.Players.LocalPlayer
        local v68 = v67.Character

        if v68 then
            v68 = v67.Character:FindFirstChild('HumanoidRootPart')
        end
        if v68 and vu51 ~= '' then
            local v69 = workspace.Server.Trial.Room.TrialRoom

            if v69 then
                v69 = v69:FindFirstChildWhichIsA('BasePart', true)
            end
            if v69 then
                if (v68.Position - v69.Position).Magnitude > 250 then
                    vu52 = false
                else
                    local v70 = not vu52 and vu66[vu51]

                    if v70 then
                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer('General', 'Shadows', 'Equip_Team', v70)

                        vu52 = true
                    end
                end
            end
        else
            return
        end
    end)
    game:GetService('RunService').RenderStepped:Connect(function()
        local v71 = game.Players.LocalPlayer
        local v72 = v71.Character

        if v72 then
            v72 = v71.Character:FindFirstChild('HumanoidRootPart')
        end
        if v72 and vu54 ~= '' then
            local v73 = Vector3.new(6742, 2579, - 554)

            if (v72.Position - v73).Magnitude > 250 then
                vu55 = false
            else
                local v74 = not vu55 and vu66[vu54]

                if v74 then
                    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer('General', 'Shadows', 'Equip_Team', v74)

                    vu55 = true
                end
            end
        end
    end)
    game:GetService('RunService').RenderStepped:Connect(function()
        local v75 = game.Players.LocalPlayer
        local v76 = v75.Character

        if v76 then
            v76 = v75.Character:FindFirstChild('HumanoidRootPart')
        end
        if v76 and vu57 ~= '' then
            local v77 = Vector3.new(- 2401, 828, - 6446)

            if (v76.Position - v77).Magnitude > 1000 then
                vu58 = false
            else
                local v78 = not vu58 and vu66[vu57]

                if v78 then
                    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer('General', 'Shadows', 'Equip_Team', v78)

                    vu58 = true
                end
            end
        end
    end)
    game:GetService('RunService').RenderStepped:Connect(function()
        local v79 = game.Players.LocalPlayer
        local v80 = v79.Character

        if v80 then
            v80 = v79.Character:FindFirstChild('HumanoidRootPart')
        end
        if v80 and vu60 ~= '' then
            local v81 = Vector3.new(2311, - 32, - 5932)

            if (v80.Position - v81).Magnitude > 250 then
                vu61 = false
            else
                local v82 = not vu61 and vu66[vu60]

                if v82 then
                    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer('General', 'Shadows', 'Equip_Team', v82)

                    vu61 = true
                end
            end
        end
    end)
    game:GetService('RunService').RenderStepped:Connect(function()
        local v83 = game.Players.LocalPlayer
        local v84 = v83.Character

        if v84 then
            v84 = v83.Character:FindFirstChild('HumanoidRootPart')
        end

        local v85 = workspace.Server.Stars:GetChildren()

        if v84 and vu63 ~= '' then
            local v86, v87, v88 = ipairs(v85)

            while true do
                local v89

                v88, v89 = v86(v87, v88)

                if v88 == nil then
                    break
                end

                local v90 = v89:FindFirstChild('Star')

                if v90 then
                    local v91, v92, v93 = ipairs(v90:GetChildren())

                    while true do
                        local v94

                        v93, v94 = v91(v92, v93)

                        if v93 == nil then
                            break
                        end

                        local v95 = v94:IsA('BasePart') and v94 and v94 or v94:FindFirstChildWhichIsA('BasePart', true)

                        if v95 and (v84.Position - v95.Position).Magnitude <= 500 then
                            local v96 = not vu64 and vu66[vu63]

                            if v96 then
                                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer('General', 'Shadows', 'Equip_Team', v96)

                                vu64 = true
                            end

                            return
                        end
                    end
                end
            end

            vu64 = false
        end
    end)

    local vu97 = game.Players.LocalPlayer
    local v98 = workspace:WaitForChild('Server'):WaitForChild('Fast_Travel')
    local v99, v100, v101 = ipairs(v98:GetChildren())

    while true do
        local vu102

        v101, vu102 = v99(v100, v101)

        if v101 == nil then
            break
        end

        local v103, v104, v105 = ipairs(vu102:GetChildren())
        local v106 = {}

        while true do
            local v107, v108 = v103(v104, v105)

            if v107 == nil then
                break
            end

            v105 = v107

            if v108.Name ~= 'Portal' and (v108.Name ~= 'Teleport' and v108:FindFirstChild('Teleport')) then
                table.insert(v106, v108.Name)
            end
        end

        v5.Teleport:AddDropdown({
            Name = vu102.Name .. ':',
            MultiSelect = false,
            Default = {},
            Options = v106,
            Callback = function(pu109)
                if typeof(pu109) == 'string' and pu109 ~= '' then
                    local v110 = {
                        'General',
                        'Portal',
                        'Teleport',
                        vu102.Name,
                    }

                    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack(v110))
                    task.delay(1, function()
                        local v111 = vu102:FindFirstChild(pu109)

                        if v111 and v111:FindFirstChild('Teleport') then
                            (vu97.Character or vu97.CharacterAdded:Wait()):PivotTo(v111.Teleport.CFrame)
                        end
                    end)
                end
            end,
        })
    end

    local vu112 = game:GetService('ReplicatedStorage')
    local vu113 = game:GetService('Players').LocalPlayer
    local vu114 = {}
    local vu115 = {}
    local vu116 = 70
    local vu117 = 'Normal'

    local function vu123()
        if (vu113.Character or vu113.CharacterAdded:Wait()):FindFirstChild('HumanoidRootPart') then
            local v118, v119, v120 = ipairs(workspace.Client.Enemies:GetChildren())
            local v121 = {}

            while true do
                local v122

                v120, v122 = v118(v119, v120)

                if v120 == nil then
                    break
                end
                if v122:IsA('Model') and v122:FindFirstChild('HumanoidRootPart') then
                    v121[v122.Name .. ' [' .. v120 .. ']'] = {
                        Name = v122.Name,
                        Index = v120,
                    }
                end
            end

            vu115 = v121
        end
    end
    local function vu140(p124)
        if p124 and table.find(vu114, p124) then
            vu123()

            local v125 = vu115[p124]

            if v125 then
                local v126 = v125.Name
                local v127 = v125.Index
                local v128 = (vu113.Character or vu113.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart')

                while table.find(vu114, p124) do
                    local vu129 = false

                    local function v130()
                        vu129 = true
                    end

                    local v131, v132, v133 = pairs(workspace.Server.Enemies:GetChildren())
                    local v134 = vu129
                    local v135 = nil

                    while true do
                        local v136

                        v133, v136 = v131(v132, v133)

                        if v133 == nil then
                            break
                        end

                        local v137 = v136:GetChildren()[v127]

                        if v137 and v137.Name == v126 then
                            v130()

                            v135 = v137
                        end
                    end

                    if not v135 or v135:GetAttribute('Health') <= 0 then
                        return 'dead'
                    end

                    local v138 = workspace.Client.Enemies:GetChildren()[v127]

                    if v138 then
                        v138 = v138:FindFirstChild('HumanoidRootPart')
                    end
                    if not v138 then
                        v130()
                    end

                    local v139 = (v128.Position - v138.Position).Magnitude

                    if vu116 >= v139 then
                        if vu117 == 'Teleport To Mob' and 10 < v139 then
                            v128.CFrame = CFrame.new(v138.Position + v138.CFrame.RightVector * 5)
                        end

                        vu112.Remotes.Bridge:FireServer('Shadows', 'Attack', 'Attack_All', 'World', v135)
                        task.wait(0.1)
                    else
                        task.wait(0.3)
                    end
                    if v134 then
                        break
                    end
                end

                return 'completed'
            end
        end
    end
    local function vu151()
        vu123()

        local v141, v142, v143 = ipairs(vu114)

        while true do
            local v144

            v143, v144 = v141(v142, v143)

            if v143 == nil then
                break
            end

            local v145 = vu115[v144]

            if v145 then
                local v146, v147, v148 = pairs(workspace.Server.Enemies:GetChildren())

                while true do
                    local v149

                    v148, v149 = v146(v147, v148)

                    if v148 == nil then
                        break
                    end

                    local v150 = v149:GetChildren()[v145.Index]

                    if v150 and (v150.Name == v145.Name and v150:GetAttribute('Health') > 0) then
                        return v144
                    end
                end
            end
        end

        return nil
    end

    function RefreshEnemies()
        vu123()

        local v152 = (vu113.Character or vu113.CharacterAdded:Wait()):FindFirstChild('HumanoidRootPart')

        if v152 then
            local v153, v154, v155 = pairs(vu115)
            local v156 = {}

            while true do
                local v157

                v155, v157 = v153(v154, v155)

                if v155 == nil then
                    break
                end

                local v158 = workspace.Client.Enemies:GetChildren()[v157.Index]

                if v158 then
                    v158 = v158:FindFirstChild('HumanoidRootPart')
                end
                if v158 and (v152.Position - v158.Position).Magnitude <= vu116 then
                    table.insert(v156, v155)
                end
            end

            table.sort(v156, function(p159, p160)
                local v161 = p159:match('^(.-) %[') or p159
                local v162 = p160:match('^(.-) %[') or p160

                if v161 == v162 then
                    return (tonumber(p159:match('%[(%d+)%]')) or 0) < (tonumber(p160:match('%[(%d+)%]')) or 0)
                else
                    return v161 < v162
                end
            end)
            EnemiesDropdown:Set(v156)
        end
    end

    EnemiesDropdown = v5.Main:AddDropdown({
        Name = 'Auto Farm Mobs',
        MultiSelect = true,
        Default = {},
        Options = {},
        Description = 'Attacks mobs within range',
        Callback = function(p163)
            vu114 = {}

            local v164, v165, v166 = pairs(p163)

            while true do
                local v167

                v166, v167 = v164(v165, v166)

                if v166 == nil then
                    break
                end
                if v167 then
                    table.insert(vu114, v166)
                end
            end

            if # vu114 == 0 then
                vu112.Remotes.Bridge:FireServer('Shadows', 'Attack', 'Retreat_All')
            end
        end,
    })

    v5.Main:AddButton({
        Name = 'Refresh Enemies',
        Callback = RefreshEnemies,
    })
    RefreshEnemies()
    task.spawn(function()
        while true do
            while # vu114 > 0 do
                local v168 = vu151()

                if v168 then
                    if vu140(v168) == 'dead' then
                        task.wait(0.1)
                    end
                else
                    task.wait(1)
                end
            end

            task.wait(0.5)
        end
    end)
    v5.Main:AddSection({
        'Auto Farm Settings',
    })
    v5.Main:AddDropdown({
        Name = 'Method',
        MultiSelect = false,
        Default = {
            'Normal',
        },
        Options = {
            'Normal',
            'Teleport To Mob',
        },
        Callback = function(p169)
            vu117 = p169
            vu116 = p169 == 'Teleport To Mob' and 500 or 70

            RefreshEnemies()
        end,
    })

    local vu170 = true

    v5.Main:AddToggle({
        Name = 'Auto Click',
        Default = true,
        Callback = function(p171)
            vu170 = p171
        end,
    })
    task.spawn(function()
        while true do
            if vu170 then
                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack({
                    'Shadows',
                    'Attack',
                    'Click',
                }))
            end

            task.wait(0.5)
        end
    end)

    local vu172 = game:GetService('ReplicatedStorage')
    local vu173 = game:GetService('Players').LocalPlayer
    local vu174 = false

    v5.Trials:AddToggle({
        Name = 'Auto Farm Nearest Mob (All Modes)',
        Default = false,
        Callback = function(p175)
            vu174 = p175

            if not p175 then
                vu172.Remotes.Bridge:FireServer('Shadows', 'Attack', 'Retreat_All')
            end
        end,
    })

    local function vu178(p176)
        local v177 = p176:IsA('BasePart') and p176:GetAttribute('Health')

        if v177 then
            v177 = p176:GetAttribute('Health') > 0
        end

        return v177
    end
    local function vu192(p179, p180)
        local v181 = p180:GetChildren()
        local v182, v183, v184 = ipairs(v181)
        local v185 = {}

        while true do
            local v186

            v184, v186 = v182(v183, v184)

            if v184 == nil then
                break
            end
            if v186:IsA('Folder') then
                local v187 = v186:GetChildren()
                local v188, v189, v190 = ipairs(v187)

                while true do
                    local v191

                    v190, v191 = v188(v189, v190)

                    if v190 == nil then
                        break
                    end
                    if vu178(v191) then
                        table.insert(v185, {
                            Part = v191,
                            Mode = p179,
                            EnemyFolder = v186.Name,
                            Index = v190,
                        })
                    end
                end
            elseif vu178(v186) then
                table.insert(v185, {
                    Part = v186,
                    Mode = p179,
                    EnemyFolder = p180.Name,
                    Index = v184,
                })
            end
        end

        return v185
    end
    local function vu218()
        local v193 = (vu173.Character or vu173.CharacterAdded:Wait()):FindFirstChild('HumanoidRootPart')

        if v193 then
            local v194 = {}
            local v195 = {
                Name = 'Trial',
            }
            local v196 = workspace.Server:FindFirstChild('Trial')

            if v196 then
                v196 = workspace.Server.Trial:FindFirstChild('Enemies')
            end

            v195.Folder = v196

            local v197 = {
                Name = 'Raid',
            }
            local v198 = workspace.Server:FindFirstChild('Raid')

            if v198 then
                v198 = workspace.Server.Raid:FindFirstChild('Enemies')
            end

            v197.Folder = v198

            local v199 = {
                Name = 'Tower',
            }
            local v200 = workspace.Server:FindFirstChild('Tower')

            if v200 then
                v200 = workspace.Server.Tower:FindFirstChild('Enemies')
            end

            v199.Folder = v200

            local v201 = {
                Name = 'SummerTower',
            }
            local v202 = workspace.Server:FindFirstChild('SummerTower')

            if v202 then
                v202 = workspace.Server.SummerTower:FindFirstChild('Enemies')
            end

            v201.Folder = v202

            local v203 = {
                Name = 'Dungeon',
            }
            local v204 = workspace.Server:FindFirstChild('Dungeon')

            if v204 then
                v204 = workspace.Server.Dungeon:FindFirstChild('Enemies')
            end

            v203.Folder = v204

            __set_list(v194, 1, {
                v195,
                v197,
                v199,
                v201,
                v203,
            })

            local v205 = math.huge
            local v206, v207, v208 = ipairs(v194)
            local v209 = nil

            while true do
                local v210

                v208, v210 = v206(v207, v208)

                if v208 == nil then
                    break
                end
                if v210.Folder then
                    local v211 = vu192(v210.Name, v210.Folder)
                    local v212, v213, v214 = ipairs(v211)

                    while true do
                        local v215

                        v214, v215 = v212(v213, v214)

                        if v214 == nil then
                            break
                        end

                        local v216 = v215.Part
                        local v217 = (v193.Position - v216.Position).Magnitude

                        if v217 < v205 then
                            v209 = v215
                            v205 = v217
                        end
                    end
                end
            end

            if v209 then
                vu172.Remotes.Bridge:FireServer('Shadows', 'Attack', 'Attack_All', v209.Mode, v209.Part)
            end
        end
    end

    task.spawn(function()
        while true do
            if vu174 then
                vu218()
            end

            task.wait(1)
        end
    end)
    v5.Items:AddToggle({
        Name = 'Auto Claim Afk Rewards',
        Default = false,
        Callback = function(p219)
            autoClaimAfkRewardsEnabled = p219

            if p219 then
                task.spawn(function()
                    while autoClaimAfkRewardsEnabled do
                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack({
                            'General',
                            'Afk Rewards',
                            'Collect',
                        }))
                        task.wait(180)
                    end
                end)
            end
        end,
    })
    v5.Trials:AddSection({
        'Gamemodes Timer',
    })

    local _ = game:GetService('Players').LocalPlayer
    local vu220 = v5.Trials:AddParagraph({
        'Time Trial',
        'Loading...',
    })
    local vu221 = 'N/A'

    spawn(function()
        while true do
            local v222, v223 = pcall(function()
                return workspace:WaitForChild('Server'):WaitForChild('Trial'):WaitForChild('Lobby'):WaitForChild('Timer'):WaitForChild('BillboardGui'):WaitForChild('TextLabel').Text
            end)
            local v224 = not v222 and 'N/A' or v223

            vu221 = v224

            vu220:Set(v224)
            task.wait(1)
        end
    end)
    game:GetService('Players')

    local vu225 = v5.Trials:AddParagraph({
        'Raid',
        'Loading...',
    })
    local vu226 = 'N/A'

    spawn(function()
        while true do
            local v227, v228 = pcall(function()
                return workspace:WaitForChild('Server'):WaitForChild('Raid'):WaitForChild('Timer'):WaitForChild('BillboardGui'):WaitForChild('TextLabel').Text
            end)
            local v229 = not v227 and 'N/A' or v228

            vu226 = v229

            vu225:Set(v229)
            task.wait(1)
        end
    end)
    game:GetService('Players')

    local vu230 = v5.Trials:AddParagraph({
        'Dungeon',
        'Loading...',
    })
    local vu231 = 'N/A'

    spawn(function()
        while true do
            local v232, v233 = pcall(function()
                return workspace:WaitForChild('Server'):WaitForChild('Dungeon'):WaitForChild('Timer'):WaitForChild('BillboardGui'):WaitForChild('TextLabel').Text
            end)
            local v234 = not v232 and 'N/A' or v233

            vu231 = v234

            vu230:Set(v234)
            task.wait(1)
        end
    end)
    v5.Trials:AddSection({
        'Auto Farm Gamemodes',
    })

    local v235 = game:GetService('Players')
    local vu236 = game:GetService('Workspace')
    local vu237 = game:GetService('ReplicatedStorage')
    local vu238 = v235.LocalPlayer
    local vu239 = '...'
    local vu240 = false
    local vu241 = nil
    local vu242 = nil
    local vu243 = nil
    local vu244 = false
    local vu245 = nil
    local vu246 = false
    local vu247 = false
    local vu248 = 5
    local vu249 = v5.Trials:AddParagraph({
        'Current Wave',
        'None',
    })
    local vu250 = nil

    local function vu252(p251)
        return p251:FindFirstChildWhichIsA('TextLabel') or (p251:FindFirstChildWhichIsA('TextBox') or p251:FindFirstChildWhichIsA('TextButton'))
    end
    local function vu253()
        return (vu238.Character or vu238.CharacterAdded:Wait()):FindFirstChild('HumanoidRootPart')
    end
    local function vu257(pu254)
        if vu242 and vu241 then
            vu237.Remotes.Bridge:FireServer('General', 'Portal', 'Teleport', vu242)
            task.delay(4, function()
                local v255 = vu253()

                if v255 then
                    v255.CFrame = CFrame.new(vu241)
                end
                if pu254 then
                    pu254()
                end
            end)
        elseif vu241 then
            local v256 = vu253()

            if v256 then
                v256.CFrame = CFrame.new(vu241)
            end
            if pu254 then
                pu254()
            end
        elseif pu254 then
            pu254()
        end
    end
    local function vu266(p258)
        local v259 = {
            Trial = {
                'Server',
                'Trial',
                'Lobby',
                'Timer',
                'BillboardGui',
                'TextLabel',
            },
            Raid = {
                'Server',
                'Raid',
                'Timer',
                'BillboardGui',
                'TextLabel',
            },
            Dungeon = {
                'Server',
                'Dungeon',
                'Timer',
                'BillboardGui',
                'TextLabel',
            },
        }
        local v260 = ({
            ['Time Trial'] = 'Trial',
            Raid = 'Raid',
            Dungeon = 'Dungeon',
        })[p258]

        if not v260 then
            return 'N/A'
        end

        local v261 = vu236
        local v262, v263, v264 = ipairs(v259[v260])

        while true do
            local v265

            v264, v265 = v262(v263, v264)

            if v264 == nil then
                break
            end

            v261 = v261:FindFirstChild(v265)

            if not v261 then
                return 'N/A'
            end
        end

        return v261.Text
    end

    local vu267 = Vector3.new(2263, 15, - 2271)
    local vu268 = 100

    local function vu270()
        local v269 = vu253()

        if v269 then
            v269 = (v269.Position - vu267).Magnitude < vu268
        end

        return v269
    end
    local function vu276(p271)
        local v272, v273, v274 = ipairs({
            'Raid',
            'Trial',
            'Dungeon',
            'Tower',
        })

        while true do
            local v275

            v274, v275 = v272(v273, v274)

            if v274 == nil then
                break
            end

            vu237.Remotes.Bridge:FireServer('Gamemodes', v275, 'Leave')
            task.wait(0.1)
        end

        vu244 = false
        vu246 = false

        if vu243 then
            vu243:Disconnect()

            vu243 = nil
        end

        vu249:Set('None')
        vu257(p271)
    end
    local function vu278()
        if not vu247 then
            vu247 = true

            task.spawn(function()
                local v277 = 1810

                while 0 < v277 and vu247 do
                    task.wait(1)

                    v277 = v277 - 1
                end

                if vu247 then
                    vu276()

                    vu247 = false
                end
            end)
        end
    end
    local function vu284(pu279)
        if vu243 then
            vu243:Disconnect()
        end

        vu244 = true
        vu246 = true

        task.delay(5, function()
            vu246 = false
        end)

        if pu279 == 'Dungeon' then
            vu249:Set('Dungeon: In Progress')
            vu278()
        else
            task.spawn(function()
                repeat
                    local v280, v281 = pcall(function()
                        return vu238.PlayerGui.UI.HUD[pu279].Frame.Wave
                    end)

                    task.wait(1)
                until v280 and (v281 and vu244)

                while vu244 and (v280 and v281) do
                    if not vu246 then
                        local v282 = vu252(v281)

                        if v282 then
                            local v283 = v282.Text

                            vu249:Set(string.lower(pu279) .. ' wave: ' .. v283)

                            if vu245 and tostring(v283):match('%d+') == tostring(vu245) then
                                vu276(function()
                                    if vu240 and vu239 == 'Tower' then
                                        task.wait(vu248)
                                        vu250()
                                    end
                                end)

                                break
                            end
                        else
                            if pu279 == 'Tower' and vu244 then
                                vu276(function()
                                    if vu240 and vu239 == 'Tower' then
                                        task.wait(vu248)
                                        vu250()
                                    end
                                end)

                                break
                            end

                            vu249:Set(string.lower(pu279) .. ' wave: None')
                        end
                    end

                    task.wait(0.5)
                end

                vu249:Set('None')
            end)
        end
    end

    vu250 = function()
        local v285 = {
            ['Time Trial'] = 'Trial',
            Raid = 'Raid',
            Tower = 'Tower',
            Dungeon = 'Dungeon',
        }
        local v286 = vu239 == 'Tower' and 'Create' or 'Join'
        local v287 = v285[vu239] or vu239

        vu237.Remotes.Bridge:FireServer('Gamemodes', v287, v286)

        local v288 = v285[vu239]

        if v288 then
            vu284(v288)
        else
            vu249:Set('None')
        end
    end

    v5.Trials:AddDropdown({
        Name = 'Select Gamemode',
        Options = {
            'Time Trial',
            'Raid',
            'Dungeon',
            'Tower',
        },
        MultiSelect = false,
        Default = '...',
        Callback = function(p289)
            vu239 = p289
        end,
    })
    v5.Trials:AddToggle({
        Name = 'Auto Farm Gamemode',
        Default = false,
        Callback = function(p290)
            vu240 = p290

            if p290 then
                vu241 = (vu238.Character or vu238.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart').Position
                vu242 = nil

                local v291 = vu236:FindFirstChild('Server')

                if v291 then
                    v291 = vu236.Server:FindFirstChild('Stars')
                end

                local v292 = math.huge
                local v293 = nil

                if v291 and vu241 then
                    local v294, v295, v296 = pairs(v291:GetChildren())

                    while true do
                        local v297

                        v296, v297 = v294(v295, v296)

                        if v296 == nil then
                            break
                        end

                        local v298 = v297:FindFirstChild('Star')
                        local v299 = nil

                        if v298 then
                            if v298:IsA('BasePart') then
                                v299 = v298.Position
                            elseif v298:IsA('Model') then
                                if v298.PrimaryPart then
                                    v299 = v298.PrimaryPart.Position
                                else
                                    local v300 = v298:FindFirstChildWhichIsA('BasePart')

                                    if v300 then
                                        v299 = v300.Position
                                    end
                                end
                            end
                        end
                        if v299 then
                            local v301 = (v299 - vu241).Magnitude

                            if v301 < v292 then
                                v293 = v297.Name
                                v292 = v301
                            end
                        end
                    end
                end
                if v293 then
                    vu242 = v293
                end
                if vu239 == 'Tower' then
                    vu276(function()
                        vu250()
                    end)
                end
            else
                vu244 = false
                vu246 = false
                vu247 = false

                if vu243 then
                    vu243:Disconnect()

                    vu243 = nil
                end

                vu241 = nil
                vu242 = nil

                vu249:Set('None')
            end
        end,
    })
    v5.Trials:AddTextBox({
        Name = 'Stop in Wave:',
        Description = 'choose the wave you want to leave',
        PlaceholderText = 'ex: 10',
        Callback = function(p302)
            vu245 = tostring(p302)
        end,
    })

    local function vu321()
        if vu240 then
            local v303 = vu253()

            if v303 then
                if vu270() then
                    vu249:Set('None')
                    vu257(function()
                        if vu240 and vu239 == 'Tower' then
                            task.wait(vu248)
                            vu250()
                        end
                    end)
                else
                    local v304 = {}
                    local v305 = vu236.Server:FindFirstChild('Raid')

                    if v305 then
                        v305 = vu236.Server.Raid:FindFirstChild('Enemies')
                    end

                    local v306 = vu236.Server:FindFirstChild('Trial')

                    if v306 then
                        v306 = vu236.Server.Trial:FindFirstChild('Enemies')
                    end

                    local v307 = vu236.Server:FindFirstChild('Dungeon')

                    if v307 then
                        v307 = vu236.Server.Dungeon:FindFirstChild('Enemies')
                    end

                    __set_list(v304, 1, {
                        v305,
                        v306,
                        v307
                    })

                    local v308 = math.huge
                    local v309, v310, v311 = ipairs(v304)
                    local v312 = nil

                    while true do
                        local v313

                        v311, v313 = v309(v310, v311)

                        if v311 == nil then
                            break
                        end
                        if v313 then
                            local v314, v315, v316 = pairs(v313:GetChildren())

                            while true do
                                local v317

                                v316, v317 = v314(v315, v316)

                                if v316 == nil then
                                    break
                                end
                                if v317:IsA('BasePart') then
                                    local v318 = (v317.Position - v303.Position).Magnitude

                                    if v318 <= 1100 then
                                        if v318 < v308 then
                                            v312 = v317
                                            v308 = v318
                                        end
                                    end
                                end
                            end
                        end
                    end

                    if v312 then
                        local v319 = (v303.Position - v312.Position).Unit:Cross(Vector3.new(0, 1, 0)).Unit * 5
                        local v320 = v312.Position + v319 + Vector3.new(0, 3, 0)

                        v303.CFrame = CFrame.new(v320)
                    end
                end
            else
                return
            end
        else
            return
        end
    end

    task.spawn(function()
        while true do
            repeat
                task.wait(0.1)
            until vu240 and (vu239 ~= '...' and (vu239 ~= 'Tower' and vu266(vu239) == 'STARTS AT: 00:10'))

            vu276(function()
                vu250()
            end)
        end
    end)
    task.spawn(function()
        while true do
            repeat
                task.wait(1)
            until vu240

            vu321()
        end
    end)
    task.spawn(function()
        while true do
            repeat
                task.wait(0.5)
            until vu240 and vu270()

            vu249:Set('None')
        end
    end)

    local vu322 = v5.Stars:AddParagraph({
        'Pity',
        'Loading...',
    })
    local vu323 = v5.Stars:AddParagraph({
        'Current Coins',
        'Loading...',
    })
    local v324 = vu238
    local vu325 = vu238.WaitForChild(v324, 'PlayerGui'):WaitForChild('UI'):WaitForChild('HUD'):WaitForChild('Star_Summon'):WaitForChild('Frame'):WaitForChild('Pity'):WaitForChild('Title')
    local v326 = vu238
    local vu327 = vu238.WaitForChild(v326, 'PlayerGui'):WaitForChild('UI'):WaitForChild('HUD'):WaitForChild('Left_Area'):WaitForChild('Frame'):WaitForChild('Currency'):WaitForChild('Frame'):WaitForChild('Coins'):WaitForChild('Container'):WaitForChild('Value')
    local vu328 = 0
    local vu329 = math.huge
    local vu330 = false
    local vu331 = nil
    local vu332 = 0

    local function vu335(p333)
        local v334 = tostring(p333):gsub(',', '')

        return tonumber(v334) or 0
    end

    spawn(function()
        while true do
            local v336 = (vu325.Text or ''):gsub('%[', ''):gsub('%]', '')

            vu322:Set(v336)

            local v337, v338 = v336:match('(%d+)%s*/%s*(%d+)')

            if v337 and v338 then
                vu328 = tonumber(v337)
                vu329 = tonumber(v338)
            else
                vu328 = 0
                vu329 = math.huge
            end

            local v339 = vu327.Text or '0'

            vu323:Set(v339)

            local v340 = vu335(v339)

            if vu331 == nil then
                vu332 = 0
            elseif v340 ~= vu331 then
                vu332 = tick()
            end

            vu331 = v340

            task.wait(1)
        end
    end)

    local v341 = game:GetService('Players')

    game:GetService('ReplicatedStorage')

    local vu342 = v341.LocalPlayer
    local vu343 = false
    local vu344 = nil
    local vu345 = 'None'
    local vu346 = math.huge
    local vu347 = false
    local vu348 = false
    local vu349 = v5.Stars:AddParagraph({
        'Nearest Star',
        vu345 .. ' (Distance: --)',
    })

    v5.Stars:AddToggle({
        Name = 'Auto Roll',
        Default = false,
        Callback = function(p350)
            vu343 = p350

            if p350 then
                task.delay(0.5, function()
                    local v351 = game:GetService('VirtualInputManager')

                    v351:SendKeyEvent(true, 'R', false, game)
                    v351:SendKeyEvent(false, 'R', false, game)
                end)
            else
                vu344 = nil
            end
        end,
    })
    v5.Stars:AddToggle({
        Name = 'Stop Roll at Pity',
        Default = false,
        Callback = function(p352)
            vu330 = p352
        end,
    })

    local function vu354(p353)
        if p353:IsA('BasePart') then
            return p353
        elseif p353:IsA('Model') then
            return p353:FindFirstChild('HumanoidRootPart') or (p353:FindFirstChildWhichIsA('BasePart') or p353.PrimaryPart)
        else
            return nil
        end
    end
    local function vu356()
        local v355 = vu330

        if v355 then
            v355 = vu329 - vu328 <= 50
        end

        return v355
    end

    task.spawn(function()
        while true do
            local v357 = vu342.Character
            local v358 = v357 and v357:FindFirstChild('HumanoidRootPart')

            if v358 then
                local v359 = workspace:FindFirstChild('Server')

                if v359 then
                    v359 = workspace.Server:FindFirstChild('Stars')
                end
                if not v359 then
                end

                local v360 = math.huge
                local v361, v362, v363 = ipairs(v359:GetChildren())
                local v364 = 'None'
                local v365 = nil

                while true do
                    local v366

                    v363, v366 = v361(v362, v363)

                    if v363 == nil then
                        break
                    end

                    local v367 = v366:FindFirstChild('Star')

                    if v367 then
                        local v368 = vu354(v367)

                        if v368 then
                            local v369 = (v358.Position - v368.Position).Magnitude

                            if v369 < v360 then
                                v364 = v366.Name
                                v365 = v368
                                v360 = v369
                            end
                        end
                    end
                end

                if v364 ~= vu345 or v360 ~= vu346 then
                    vu345 = v364
                    vu346 = v360

                    vu349:Set(vu345 .. ' (Distance: ' .. math.floor(vu346) .. ' studs)')
                end

                vu344 = v365
            end

            task.wait(0.1)
        end
    end)
    task.spawn(function()
        while true do
            if vu343 and vu344 then
                local v370 = vu342.Character
                local v371 = v370 and v370:FindFirstChild('HumanoidRootPart')

                if v371 then
                    if (v371.Position - vu344.Position).Magnitude >= 500 then
                        vu347 = false
                        vu348 = false
                    else
                        if not vu347 then
                            vu347 = true
                            vu348 = false
                        end
                        if not (vu356() or vu348) then
                            task.delay(1, function()
                                local v372 = game:GetService('VirtualInputManager')

                                v372:SendKeyEvent(true, 'R', false, game)
                                v372:SendKeyEvent(false, 'R', false, game)
                            end)

                            vu348 = true
                        end
                    end
                end
            end

            task.wait(0.2)
        end
    end)
    task.spawn(function()
        while true do
            local v373 = vu343 and (vu344 and vu342.Character)

            if v373 then
                local v374 = v373:FindFirstChild('HumanoidRootPart')

                if v374 and (v374.Position - vu344.Position).Magnitude < 500 then
                    local v375 = vu356() and Vector3.new(60, 0, 0) or Vector3.new(3, - 1, 0)

                    v374.CFrame = CFrame.new(vu344.Position + v375)
                end
            end

            task.wait(0.2)
        end
    end)
    v5.Items:AddToggle({
        Name = 'Auto open Gifts',
        Default = false,
        Callback = function(p376)
            autoOpenGifts = p376

            if p376 then
                task.spawn(function()
                    while autoOpenGifts do
                        local v377 = tick()

                        while tick() - v377 < 10 do
                            game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack({
                                'General',
                                'Mystery_Box',
                                'Open',
                                'MysteryBox',
                            }))
                            game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack({
                                'General',
                                'Mystery_Box',
                                'Open',
                                'SmallBox',
                            }))

                            local v378, v379, v380 = ipairs(workspace.Client.Debris:GetChildren())

                            while true do
                                local v381

                                v380, v381 = v378(v379, v380)

                                if v380 == nil then
                                    break
                                end

                                local v382 = {
                                    'General',
                                    'Mystery_Box',
                                    'Collect',
                                    v381.Name,
                                }

                                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack(v382))
                            end

                            task.wait(0.1)
                        end

                        task.wait(1200)
                    end
                end)
            end
        end,
    })

    local vu383 = game:GetService('Players').LocalPlayer
    local vu384 = v5.Trait:AddParagraph({
        'Current Traits Shards',
        'Loading...',
    })

    task.spawn(function()
        while true do
            local vu385 = nil
            local _, _ = pcall(function()
                local v386 = vu383.PlayerGui:FindFirstChild('UI') and (vu383.PlayerGui.UI:FindFirstChild('Frames') and vu383.PlayerGui.UI.Frames:FindFirstChild('Inventory')) and (vu383.PlayerGui.UI.Frames.Inventory:FindFirstChild('Frame') and vu383.PlayerGui.UI.Frames.Inventory.Frame:FindFirstChild('List') and (vu383.PlayerGui.UI.Frames.Inventory.Frame.List:FindFirstChild('TraitShard') and vu383.PlayerGui.UI.Frames.Inventory.Frame.List.TraitShard:FindFirstChild('Frame')))

                if v386 then
                    v386 = vu383.PlayerGui.UI.Frames.Inventory.Frame.List.TraitShard.Frame:FindFirstChild('ItemAmount')
                end

                vu385 = v386
            end)

            if vu385 and vu385.Text then
                vu384:Set(vu385.Text)
            else
                vu384:Set('None')
            end

            task.wait(0.2)
        end
    end)

    local vu387 = game:GetService('Players').LocalPlayer
    local vu388 = v5.Trait:AddParagraph({
        'Current Talents Capsules',
        'Loading...',
    })

    task.spawn(function()
        while true do
            local v390, v391 = pcall(function()
                local v389 = vu387.PlayerGui:FindFirstChild('UI') and (vu387.PlayerGui.UI:FindFirstChild('Frames') and vu387.PlayerGui.UI.Frames:FindFirstChild('Inventory')) and (vu387.PlayerGui.UI.Frames.Inventory:FindFirstChild('Frame') and vu387.PlayerGui.UI.Frames.Inventory.Frame:FindFirstChild('List') and (vu387.PlayerGui.UI.Frames.Inventory.Frame.List:FindFirstChild('TalentCapsule') and vu387.PlayerGui.UI.Frames.Inventory.Frame.List.TalentCapsule:FindFirstChild('Frame')))

                if v389 then
                    v389 = vu387.PlayerGui.UI.Frames.Inventory.Frame.List.TalentCapsule.Frame:FindFirstChild('ItemAmount')
                end

                return v389
            end)

            if v390 and (v391 and v391.Text) then
                vu388:Set(v391.Text)
            else
                vu388:Set('None')
            end

            task.wait(0.2)
        end
    end)
    v5.Trait:AddSection({
        "GUI's",
    })
    v5.Stars:AddToggle({
        Name = 'Hide Stars',
        Default = false,
        Callback = function(pu392)
            local v393 = game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('Star_View')
            local v394 = v393:WaitForChild('Frame'):WaitForChild('Frame')
            local vu395 = v393:WaitForChild('Stop')

            v394.Visible = not pu392

            if pu392 then
                task.spawn(function()
                    while pu392 and vu395.Parent do
                        vu395.Visible = true

                        task.wait(0.1)
                    end
                end)
            else
                vu395.Visible = true
            end
        end,
    })

    local vu396 = true

    v5.Trait:AddButton({
        Name = 'Open Trait GUI',
        Callback = function()
            if vu396 then
                vu396 = false

                local v397 = game:GetService('VirtualInputManager')
                local v398 = workspace.CurrentCamera
                local _ = game:GetService('Players').LocalPlayer
                local v399 = Vector3.new(- 1815, 4, 1851)
                local v400 = math.huge
                local v401, v402, v403 = ipairs(workspace:GetDescendants())
                local v404 = nil

                while true do
                    local v405

                    v403, v405 = v401(v402, v403)

                    if v403 == nil then
                        break
                    end
                    if v405:IsA('ProximityPrompt') and v405.Parent:IsA('BasePart') then
                        local v406 = (v405.Parent.Position - v399).Magnitude

                        if v406 < v400 then
                            v404 = v405
                            v400 = v406
                        end
                    end
                end

                if v404 then
                    local v407 = v404.MaxActivationDistance

                    v404.MaxActivationDistance = 999999

                    local v408 = v398.CFrame
                    local v409 = v398.CameraType
                    local v410 = v404.Parent.Position + Vector3.new(0, 2, 5)

                    v398.CameraType = Enum.CameraType.Scriptable
                    v398.CFrame = CFrame.lookAt(v410, v410 + Vector3.new(0, 0, - 1))

                    task.wait(0.01)
                    v397:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.1)
                    v397:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                    task.wait(0.1)

                    v404.MaxActivationDistance = v407
                    v398.CameraType = v409
                    v398.CFrame = v408
                else
                    warn('No ProximityPrompt found near target position.')
                end

                task.delay(2, function()
                    vu396 = true
                end)
            end
        end,
    })

    local vu411 = true

    v5.Trait:AddButton({
        Name = 'Open Talents GUI',
        Callback = function()
            if vu411 then
                vu411 = false

                local v412 = game:GetService('VirtualInputManager')
                local v413 = workspace.CurrentCamera
                local _ = game:GetService('Players').LocalPlayer
                local v414 = Vector3.new(- 1296, 5, 653)
                local v415 = math.huge
                local v416, v417, v418 = ipairs(workspace:GetDescendants())
                local v419 = nil

                while true do
                    local v420

                    v418, v420 = v416(v417, v418)

                    if v418 == nil then
                        break
                    end
                    if v420:IsA('ProximityPrompt') and v420.Parent:IsA('BasePart') then
                        local v421 = (v420.Parent.Position - v414).Magnitude

                        if v421 < v415 then
                            v419 = v420
                            v415 = v421
                        end
                    end
                end

                if v419 then
                    local v422 = v419.MaxActivationDistance

                    v419.MaxActivationDistance = 999999

                    local v423 = v413.CFrame
                    local v424 = v413.CameraType
                    local v425 = v419.Parent.Position + Vector3.new(0, 2, 5)

                    v413.CameraType = Enum.CameraType.Scriptable
                    v413.CFrame = CFrame.lookAt(v425, v425 + Vector3.new(0, 0, - 1))

                    task.wait(0.01)
                    v412:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.1)
                    v412:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                    task.wait(0.1)

                    v419.MaxActivationDistance = v422
                    v413.CameraType = v424
                    v413.CFrame = v423
                else
                    warn('No ProximityPrompt found near target position.')
                end

                task.delay(2, function()
                    vu411 = true
                end)
            end
        end,
    })

    local vu426 = true

    v5.Trait:AddButton({
        Name = 'Open Ascension GUI',
        Callback = function()
            if vu426 then
                vu426 = false

                local v427 = game:GetService('VirtualInputManager')
                local v428 = workspace.CurrentCamera
                local _ = game:GetService('Players').LocalPlayer
                local v429 = Vector3.new(- 709, 5, 1214)
                local v430 = math.huge
                local v431, v432, v433 = ipairs(workspace:GetDescendants())
                local v434 = nil

                while true do
                    local v435

                    v433, v435 = v431(v432, v433)

                    if v433 == nil then
                        break
                    end
                    if v435:IsA('ProximityPrompt') and v435.Parent:IsA('BasePart') then
                        local v436 = (v435.Parent.Position - v429).Magnitude

                        if v436 < v430 then
                            v434 = v435
                            v430 = v436
                        end
                    end
                end

                if v434 then
                    local v437 = v434.MaxActivationDistance

                    v434.MaxActivationDistance = 999999

                    local v438 = v428.CFrame
                    local v439 = v428.CameraType
                    local v440 = v434.Parent.Position + Vector3.new(0, 2, 5)

                    v428.CameraType = Enum.CameraType.Scriptable
                    v428.CFrame = CFrame.lookAt(v440, v440 + Vector3.new(0, 0, - 1))

                    task.wait(0.01)
                    v427:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.1)
                    v427:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                    task.wait(0.1)

                    v434.MaxActivationDistance = v437
                    v428.CameraType = v439
                    v428.CFrame = v438
                else
                    warn('No ProximityPrompt found near target position.')
                end

                task.delay(2, function()
                    vu426 = true
                end)
            end
        end,
    })

    local v441 = game:GetService('Players')
    local vu442 = game:GetService('ReplicatedStorage')
    local vu443 = game:GetService('Workspace')
    local vu444 = v441.LocalPlayer
    local vu445 = false
    local vu446 = nil

    local function vu447()
        return (vu444.Character or vu444.CharacterAdded:Wait()):FindFirstChild('HumanoidRootPart')
    end
    local function vu449(p448)
        vu442:WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack({
            'General',
            'Portal',
            'Teleport',
            p448,
        }))
        task.wait(1)
    end
    local function vu468()
        while vu445 do
            local vu450 = false

            local function v451()
                vu450 = true
            end

            local v452 = vu443:FindFirstChild('Server')

            if v452 then
                v452 = vu443.Server:FindFirstChild('Collectibles')
            end
            if v452 then
                local v453 = v452:GetChildren()
                local v454, v455, v456 = ipairs(v453)

                while true do
                    local v457

                    v456, v457 = v454(v455, v456)

                    if v456 == nil then
                        break
                    end
                    if not vu445 then
                        v451()
                    end

                    local v458 = v457.Name

                    vu449(v458)

                    local v459 = v457:GetChildren()

                    table.sort(v459, function(p460, p461)
                        return (tonumber(p460.Name) or 0) < (tonumber(p461.Name) or 0)
                    end)

                    local v462 = vu447()
                    local v463, v464, v465 = ipairs(v459)

                    while true do
                        local v466

                        v465, v466 = v463(v464, v465)

                        if v465 == nil then
                            break
                        end
                        if not vu445 then
                            v451()
                        end
                        if v462 then
                            if v466:IsA('BasePart') then
                                v462.CFrame = CFrame.new(v466.Position + Vector3.new(0, 5, 0))
                            elseif v466:FindFirstChildWhichIsA('BasePart') then
                                local v467 = v466:FindFirstChildWhichIsA('BasePart')

                                v462.CFrame = CFrame.new(v467.Position + Vector3.new(0, 5, 0))
                            end
                        end

                        task.wait(0.6)

                        if vu445 then
                            vu442:WaitForChild('Remotes'):WaitForChild('Bridge'):FireServer(unpack({
                                'General',
                                'Collectibles',
                                'Collect',
                                v458,
                                v466,
                            }))
                            task.wait(0.5)
                        end
                    end
                end

                task.wait(1)
            else
                task.wait(1)
            end
            if vu450 then
                break
            end
        end
    end

    v5.Items:AddToggle({
        Name = 'Auto Collect All Collectibles',
        Default = false,
        Callback = function(p469)
            vu445 = p469

            if p469 then
                vu446 = task.spawn(vu468)
            elseif vu446 then
                task.cancel(vu446)

                vu446 = nil
            end
        end,
    })
