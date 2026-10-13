# Aether Gen2 v0.7.0

A universal Roblox Luau UI library with backwards-compatible 0.6.0 methods and additional reusable UI controls, layout tools, and configuration APIs.

This release is supplied as a **complete standalone Luau source**: `AetherGen2_v0.7.0.luau`. It does **not** change any remote GitHub file automatically. Host the new file or load it locally to use version 0.7.0.

## Compatibility

Existing methods continue to work:

- `Aether:CreateWindow(config)` and `Aether:Notify(config)`
- `Window:CreateTab(config)`, `Window:GetFlag(flag)`, `Window:SetFlag(flag, value)`, `Window:Notify(config)`, `Window:Minimize()`, `Window:Hide()`, `Window:Show()`, `Window:Toggle()`, `Window:Destroy()`
- `Tab:CreateSection()`, `CreateToggle()`, `CreateButton()`, `CreateInput()/CreateTextbox()`, `CreateSlider()`, `CreateDropdown()`, `CreateColorPicker()`, `CreateKeybind()`, `CreateLabel()`, `CreateParagraph()`
- Stateful controls' `:Get()`, `:Set(value, silent?)`, and the original callback conventions.

Option keys support the lowercase/capitalized forms shown in examples. The new `Add*` aliases have the same arguments as corresponding `Create*` methods; they are **not** drop-in emulations of unrelated UI libraries.

## New controls

### Multi-select dropdown

```lua
local filters = tab:CreateMultiDropdown({
    name = "Filters",
    flag = "filters",
    values = {"Players", "Friends", "NPCs"},
    value = {"Players"},
    maxSelections = 2, -- optional
    callback = function(selected)
        print(table.concat(selected, ", "))
    end,
})

filters:Get() -- returns a separate copy of the selected array
filters:Set({"Players", "NPCs"})
filters:Set({Friends = true, NPCs = true}, true) -- silent
filters:SetValues({"Players", "NPCs", "Bots"})
filters:SetOpen(false)
```

`CreateMultiSelect` and `AddMultiDropdown` are aliases. Selection is stored as an array of strings in `Window.Flags` and exported config JSON.

### Collapsible group

```lua
local group = tab:CreateGroup({name = "Movement", expanded = true})
group:CreateToggle({name = "Enabled", flag = "moveEnabled"})
group:CreateSlider({name = "Speed", flag = "moveSpeed", min = 0, max = 100, value = 16})

group:SetExpanded(false)
group:Toggle()
group:SetName("Movement settings")
```

Groups can contain other groups and the normal tab controls. `CreateGroupbox` and `CreateCollapsible` are aliases. Searching the tab temporarily expands groups containing matches.

### Multi-line text input

```lua
local notes = tab:CreateTextArea({
    name = "Notes",
    flag = "notes",
    height = 140,
    placeholder = "Write notes here...",
    value = "",
    callback = function(text, enterPressed)
        print(text, enterPressed)
    end,
})

notes:Set("Updated text")
print(notes:Get())
```

`CreateMultilineInput` and `AddTextArea` are aliases.

### Progress bar

```lua
local progress = tab:CreateProgressBar({
    name = "Loading",
    flag = "loading",
    min = 0,
    max = 100,
    value = 0,
})
progress:Set(75)
```

This is a *display* control. Use `CreateSlider` for user-adjustable numeric values.

### Radio group

```lua
local quality = tab:CreateRadioGroup({
    name = "Quality",
    flag = "quality",
    values = {"Low", "Medium", "High"},
    value = "High",
    callback = function(value) print(value) end,
})
quality:Set("Medium")
quality:SetValues({"Auto", "Manual"})
```

Up to three options display in a horizontal row; more display vertically. `CreateRadio` and `AddRadioGroup` are aliases.

### Non-interactive elements

```lua
tab:CreateSeparator("Appearance")
tab:CreateSpacer(12)
tab:CreateImage({image = "rbxassetid://123456789", height = 120})
```

`CreateImage()` returns an element with `Set(imageIdOrUri)` and `Get()`.

## Window management

```lua
local win = Aether:CreateWindow({
    name = "Example",
    size = Vector2.new(760, 510),
    allowMultiple = true, -- opt in to multiple independent windows
})
local tab = win:CreatePage({name = "Main", icon = "globe"})

win:GetTab("Main")
win:SelectTab("Main")
win:GetControl("quality")
win:SetTitle("Updated title")
win:SetSubtitle("New subtitle")
win:SetSearch("quality")
win:SetSize(Vector2.new(800, 560))
tab:SetName("General")
```

The existing default still replaces any prior `AetherGen2` window under the same parent. Set `allowMultiple = true` to create an independent window with a unique ScreenGui name. To clean up a window, call `win:Destroy()`.

`Tab:Destroy()` removes that tab and its controls and selects another tab when available.

## Control utilities

Controls created through tab/group methods also support:

```lua
local t = tab:CreateToggle({name = "Feature", flag = "feature"})
t:SetVisible(false)
t:SetVisible(true)
print(t:IsVisible())
t:Destroy()
```

These methods are independent of the toggle value. `Destroy()` unregisters a control's flag, removes its UI and closes associated popups. Destroying a full window remains the recommended way to clean up an entire interface.

## Configuration JSON

```lua
local data = win:ExportConfig()
print(data)

local ok, err = win:ImportConfig(data, true) -- true = silent, do not run control callbacks
if not ok then warn(err) end

local copy = win:GetFlags()
win:SetFlags({feature = true, moveSpeed = 45})
win:ResetFlags(true)
```

These methods encode Color3 and Enum keybind values with type markers so values can round-trip through JSON. Importing unknown flags stores them without creating controls. The library does not require exploit file APIs; if you want to persist the JSON, save the string through whatever storage layer your application uses.

## Confirmation dialog

```lua
win:Confirm({
    title = "Reset settings?",
    description = "This restores all defaults.",
    confirmText = "Reset",
    cancelText = "Keep",
    callback = function() win:ResetFlags() end,
    onCancel = function() print("Cancelled") end,
})
```

`CreateDialog` is an alias for `Confirm`. The returned handle exposes `:Close()` and `Instance`.

## Other method aliases

`CreateCheckbox`, `CreateSwitch` are aliases of `CreateToggle`.
`Window:CreatePage` is an alias of `Window:CreateTab`.
`AddToggle`, `AddButton`, `AddSlider`, `AddDropdown`, `AddColorPicker`, `AddKeybind`, `AddInput`, `AddTextbox`, `AddSection`, `AddLabel`, `AddParagraph`, `AddGroup`, `AddMultiDropdown`, `AddTextArea`, `AddProgressBar`, `AddRadio`, `AddSeparator`, `AddSpacer`, and `AddImage` correspond to their `Create*` methods.

## Notes and limitations

- Built for Roblox Luau and Roblox UI instances. Static syntax checks were performed on the extension; interactive in-game rendering and input behavior were not verified in Roblox Studio in this environment.
- Config import/export handles ordinary flag state, Color3, and Enum items. It is not a general arbitrary-Lua-object serializer.
- This is a source update, not a modification of your GitHub repository or existing scripts that load its old URL.
- Native Roblox ScreenGui/input/runtime constraints still apply. Test mobile sizing and any special executor environment separately.
