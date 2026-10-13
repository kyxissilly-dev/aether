local a=game:GetService("Players")local b=game:GetService("TweenService")local c=game:GetService("UserInputService")local d=game:GetService("RunService")local e=game:GetService("TextService")local f=a.LocalPlayer;local g={}g.__index=g;g.Version="0.6.0";local h={Window=Color3.fromRGB(18,18,19),Window2=Color3.fromRGB(22,22,23),Sidebar=Color3.fromRGB(17,17,18),Element=Color3.fromRGB(30,30,30),Element2=Color3.fromRGB(35,35,35),ElementHover=Color3.fromRGB(255,255,255),ElementHoverStroke=Color3.fromRGB(50,50,50),ElementTransparency=0,ElementStrokeTransparency=0,ElementStrokeHoverTransparency=0,Tab=Color3.fromRGB(50,50,50),TabBottom=Color3.fromRGB(35,35,35),TabStrokeTop=Color3.fromRGB(95,95,95),TabStrokeBottom=Color3.fromRGB(50,50,50),Stroke=Color3.fromRGB(35,35,35),StrokeSoft=Color3.fromRGB(62,62,67),Text=Color3.fromRGB(255,255,255),Secondary=Color3.fromRGB(178,178,178),Muted=Color3.fromRGB(112,112,119),Field=Color3.fromRGB(24,24,25),FieldHover=Color3.fromRGB(29,29,30),SliderBackground=Color3.fromRGB(47,47,47),SliderBackgroundHover=Color3.fromRGB(60,60,60),SliderHandle=Color3.fromRGB(255,255,255),SliderStroke=Color3.fromRGB(255,255,255),Accent=Color3.fromRGB(23,153,110),AccentStroke=Color3.fromRGB(32,201,144),AccentGlow=0.4,ToggleTrack=Color3.fromRGB(0,0,0),ToggleTrackTransparency=0.9,ToggleKnob=Color3.fromRGB(255,255,255),ToggleKnobOn=Color3.fromRGB(23,153,110),ToggleKnobOffTransparency=0.8,Danger=Color3.fromRGB(215,115,120),Warning=Color3.fromRGB(231,174,70),Success=Color3.fromRGB(75,190,125),Info=Color3.fromRGB(86,145,230),Shadow=Color3.fromRGB(20,20,20),Glow=Color3.fromRGB(255,255,255)}local i={Width=685,Height=450,TopbarHeight=64,RailWidth=219,RowHeight=38,RowCorner=14,RowSpacing=4,RailPadding=17,RowInset=15,RowPadding=10,RowContentSpacing=6,RowIconSize=20,FooterHeight=60,AvatarSize=34,ElementHeight=43,ElementInset=10,ElementContentInset=20,ActionReserve=118,SearchReserve=346}local j={Fast=TweenInfo.new(0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),Hover=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),Move=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),Reveal=TweenInfo.new(0.42,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)}local function k(a,b)local a=Instance.new(a)local c=b and b.Parent;for b,c in pairs(b or{})do if b~="Parent"then a[b]=c end end;if a:IsA("GuiObject")and(not b or b.BorderSizePixel==nil)then a.BorderSizePixel=0 end;if c then a.Parent=c end;return a end;local function l(a,b)return k("UICorner",{Parent=a,CornerRadius=UDim.new(0,b)})end;local function m(a,b,c,d)return k("UIStroke",{Parent=a,Color=b,Transparency=c or 0,Thickness=d or 1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border})end;local function n(a,b,c,d,e,f)local a,b=pcall(function()return k("UIShadow",{Parent=a,Color=b,BlurRadius=UDim.new(0,c or 20),Transparency=d==nil and 1 or d,Offset=e,Spread=f,ZIndex=-1})end)return a and b or nil end;local function o(a,c,d)if not a then return nil end;local a,b=pcall(b.Create,b,a,c,d)if not a or not b then warn("Aether tween error: "..tostring(b))return nil end;b:Play()return b end;local function b(a,...)if type(a)~="table"then return nil end;for b=1,select("#",...)do local a=a[select(b,...)];if a~=nil then return a end end end;local function p(a)local b=table.clone(h)if type(a)~="table"then return b end;for a,c in pairs(a)do if b[a]~=nil and typeof(b[a])==typeof(c)then b[a]=c end end;return b end;local function h(a)local b,c=pcall(Font.fromEnum,Enum.Font.BuilderSans)if b and c then return Font.new(c.Family,a or Enum.FontWeight.Medium,Enum.FontStyle.Normal)end;local b=Font.fromEnum(Enum.Font.Gotham)return Font.new(b.Family,a or Enum.FontWeight.Medium,Enum.FontStyle.Normal)end;local q=h(Enum.FontWeight.Medium)local r=h(Enum.FontWeight.SemiBold)local h=h(Enum.FontWeight.Regular)local s={close=83277910885129,minimise=108115485663409,minimize=108115485663409,maximise=88738500661569,maximize=88738500661569,settings=129180860773723,search=100604009889706,chevron=88479147175134,check=125626312718314,dot=91452555903853,colorpicker=91452555903853,banner=111263549366178,config=125823673784681,rayfield=80387863064905}local function t(a)if a==nil or a==0 or a==""then return""end;if type(a)=="number"then return"rbxassetid://"..tostring(a)end;if type(a)~="string"then return nil end;local b=string.lower(a)local b=s[b];if b then return"rbxassetid://"..tostring(b)end;if a:match("^%d+$")then return"rbxassetid://"..a end;local b=a:match("^rbxassetid://(%d+)$")if b then return"rbxassetid://"..b end;if a:sub(1,11)=="rbxasset://"or a:sub(1,11)=="rbxthumb://"then return a end;return a end;g.Icons=table.clone(s)function g.ResolveImage(a,b)local a=a==g and b or a;return t(a)end;local function s(a,b,c)local a=k("Frame",{Parent=a,Size=UDim2.fromOffset(c,c),BackgroundTransparency=1})local d=k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(math.floor(c*0.9),math.floor(c*0.56)),BackgroundTransparency=1})l(d,c)m(d,b,0.12,1.25)local b=k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(math.max(4,math.floor(c*0.23)),math.max(4,math.floor(c*0.23))),BackgroundColor3=b})l(b,c)return a end;local function u(a,b,c)local a=k("Frame",{Parent=a,Size=UDim2.fromOffset(c,c),BackgroundTransparency=1})local d=k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(c-2,c-2),BackgroundTransparency=1})l(d,c)m(d,b,0.16,1.2)local d=k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(math.floor(c*0.36),c-4),BackgroundTransparency=1})l(d,c)m(d,b,0.3,1)k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(c-5,1),BackgroundColor3=b,BackgroundTransparency=0.3})return a end;local function v(a,b,c)local a=k("Frame",{Parent=a,Size=UDim2.fromOffset(c,c),BackgroundTransparency=1})local d=k("Frame",{Parent=a,Position=UDim2.fromOffset(2,2),Size=UDim2.fromOffset(c-7,c-7),BackgroundTransparency=1})l(d,c)m(d,b,0.15,1.35)k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(1,-3,1,-3),Size=UDim2.fromOffset(math.floor(c*0.38),1),Rotation=45,BackgroundColor3=b,BackgroundTransparency=0.12})return a end;local function v(a,b,c,d)return k("TextLabel",{Parent=a,Size=UDim2.fromOffset(d,d),BackgroundTransparency=1,Text=string.upper(string.sub(tostring(b or"?"),1,1)),TextColor3=c,TextTransparency=0.15,TextSize=math.max(12,d-4),FontFace=q,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center})end;local function w(a,b,c,d,e)local f=type(b)=="string"and string.lower(b)or nil;if f=="eye"then return s(a,c,d)elseif f=="globe"then return u(a,c,d)end;local b=t(b)if b and b~=""then return k("ImageLabel",{Parent=a,Size=UDim2.fromOffset(d,d),BackgroundTransparency=1,Image=b,ImageColor3=c,ImageTransparency=0.04,ScaleType=Enum.ScaleType.Fit})end;return v(a,e,c,d)end;local function s(a,b)local a=k("Frame",{Parent=a,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1})local c=k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(12,1),Rotation=45,BackgroundColor3=b})local b=k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(12,1),Rotation=-45,BackgroundColor3=b})return a,c,b end;local function t(a,b)local a=k("Frame",{Parent=a,Size=UDim2.fromOffset(20,20),BackgroundTransparency=1})local c=k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(11,1),BackgroundColor3=b})local b=k("Frame",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(1,11),BackgroundColor3=b,BackgroundTransparency=1})return a,c,b end;local function u(a)local a=b(a,"parent","Parent")if a and typeof(a)=="Instance"then return a end;if typeof(gethui)=="function"then local a,b=pcall(gethui)if a and b then return b end end;if f then return f:WaitForChild("PlayerGui")end;return game:GetService("CoreGui")end;local function x(a)return string.format("#%02X%02X%02X",math.floor(a.R*255+0.5),math.floor(a.G*255+0.5),math.floor(a.B*255+0.5))end;local function y(a)a=tostring(a or""):gsub("#",""):gsub("%s","")if#a==3 then a=a:sub(1,1):rep(2)..a:sub(2,2):rep(2)..a:sub(3,3):rep(2)end;if#a~=6 or not a:match("^[%da-fA-F]+$")then return nil end;return Color3.fromRGB(tonumber(a:sub(1,2),16),tonumber(a:sub(3,4),16),tonumber(a:sub(5,6),16))end;local function z(a,b,c,d)a=tostring(a or"")if a==""then return 0 end;local f=Instance.new("GetTextBoundsParams")f.Text=a;f.Font=b;f.Size=c;f.Width=math.max(d,1)local b,e=pcall(e.GetTextBoundsAsync,e,f)f:Destroy()if b and e then return math.max(c,math.ceil(e.Y))end;local b=math.max(1,math.floor(d/math.max(c*0.52,1)))local a=math.max(1,math.ceil(#a/b))return math.ceil(a*c*1.2)end;local function e(a)local b=0;while b<6 do local a=a*10^b;if math.abs(a-math.round(a))<1e-9 then break end;b+=1 end;return b end;local function A(a,b,c,d)local c=a+math.round((d-a)/c)*c;return math.clamp(c,a,b)end;local B={}B.__index=B;local C={}C.__index=C;local D={}D.__index=D;local E={}E.__index=E;local F={}F.__index=F;local G={}G.__index=G;local H={}H.__index=H;local I={}I.__index=I;local J={}J.__index=J;local K={}K.__index=K;local L={}L.__index=L;local function M(a,b)a.name=tostring(b)a.searchName=string.lower(a.name)a.title.Text=a.name end;D.SetName=M;E.SetName=M;F.SetName=M;G.SetName=M;H.SetName=M;I.SetName=M;J.SetName=M;local function M(a,b)a._connections[#a._connections+1]=b;return b end;local function N(a,b,...)local c=table.pack(...)task.spawn(function()local b,c=pcall(b,table.unpack(c,1,c.n))if not b then warn("Aether "..a.." callback error: "..tostring(c))end end)end;local O={selected={background=0.4,stroke=0.5,content=0,shadow=0.8},hover={background=0.7,stroke=0.8,content=0.3,shadow=1},unselected={background=1,stroke=1,content=0.5,shadow=1}}local function P(a,b,c)local b=O[b]or O.unselected;local function d(a,b)if not a then return end;if not c then o(a,j.Hover,b)return end;for b,c in pairs(b)do a[b]=c end end;d(a.selector,{BackgroundTransparency=b.background})d(a.selectorStroke,{Transparency=b.stroke})d(a.selectorTitle,{TextTransparency=b.content})d(a.selectorShadow,{Transparency=b.shadow})d(a.selectorIcon,{GroupTransparency=b.content})end;function C:Select()local a=self.window;if a.selectedTab==self then return self end;local b=a.selectedTab;a.selectedTab=self;if b then b.page.Visible=false;P(b,"unselected",false)end;self.page.Visible=true;P(self,"selected",false)a:_applySearch(a.searchBox.Text)return self end;function C:_addElement(a)table.insert(self.elements,a)a.main.LayoutOrder=#self.elements*10;if self.window.selectedTab==self and self.window.searchBox and self.window.searchBox.Text~=""then self.window:_applySearch(self.window.searchBox.Text)end;return a end;function C:CreateSection(a)local a=type(a)=="string"and a or b(a,"name","Name")or"Section";local b=#self.elements>0 and 13 or 0;local c=k("Frame",{Parent=self.page,Size=UDim2.new(1,-40,0,20+b),BackgroundTransparency=1})local b=k("TextLabel",{Parent=c,Position=UDim2.fromOffset(0,b),Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Text=a,TextColor3=self.window.theme.Text,TextTransparency=0.42,TextSize=15,FontFace=q,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center})local a={main=c,label=b,name=a,isSection=true,searchName=""}function a:Set(a)self.name=tostring(a)self.label.Text=self.name end;return self:_addElement(a)end;local function O(a,c,d,e)local f=a.window;local g=b(d,"name","Name")or"Element";local b=b(d,"icon","Icon")e=e or i.ElementContentInset;local a=k("Frame",{Parent=a.page,Size=UDim2.new(1,-20,0,c),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=f.theme.ElementTransparency})l(a,12)local c=k("UIGradient",{Parent=a,Rotation=270,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,f.theme.Element),ColorSequenceKeypoint.new(0.9999,f.theme.Element2),ColorSequenceKeypoint.new(1,f.theme.Element2)})})local d=m(a,f.theme.Stroke,f.theme.ElementStrokeTransparency,1)local h=k("Frame",{Parent=a,Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,ZIndex=1})l(h,12)local e=math.max(40,f.size.X-i.RailWidth-i.ElementContentInset-e-20)local i=k("Frame",{Parent=a,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,i.ElementContentInset,0.5,0),Size=UDim2.fromOffset(e,20),BackgroundTransparency=1,ZIndex=4})k("UIListLayout",{Parent=i,FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,5)})local l;if b~=nil and b~=0 and b~=""then l=w(i,b,f.theme.Text,16,g)l.LayoutOrder=0 end;local b=k("TextLabel",{Parent=i,Size=UDim2.fromOffset(e-(l and 21 or 0),18),BackgroundTransparency=1,Text=g,TextColor3=f.theme.Text,TextTransparency=0,TextSize=16,FontFace=q,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=4})local e=k("TextButton",{Parent=a,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",TextTransparency=1,AutoButtonColor=false,Active=true,ZIndex=2})M(f,e.MouseEnter:Connect(function()o(d,j.Hover,{Transparency=f.theme.ElementStrokeHoverTransparency,Color=f.theme.ElementHoverStroke})o(h,j.Hover,{BackgroundTransparency=0.97})end))M(f,e.MouseLeave:Connect(function()o(d,j.Hover,{Transparency=f.theme.ElementStrokeTransparency,Color=f.theme.Stroke})o(h,j.Hover,{BackgroundTransparency=1})end))return{main=a,stroke=d,gradient=c,hover=h,content=i,title=b,interact=e,icon=l,name=g,searchName=string.lower(g)}end;local function Q(a,b,c)local b=b or c;local c=b;local d=1;while a.controls[b]do d+=1;b=c.."_"..d end;if b~=c then warn(string.format("Aether: duplicate flag '%s' renamed to '%s'",c,b))end;return b end;function C:CreateToggle(a)a=type(a)=="table"and a or{}local c=O(self,i.ElementHeight,a,77)local d=self.window;local e=b(a,"callback","Callback")or function()end;local f=string.lower(c.name:gsub("%s+","_"))local f=Q(d,b(a,"flag","Flag"),f)local a=b(a,"value","Value","currentValue","CurrentValue")==true;local b=k("Frame",{Parent=c.main,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=UDim2.fromOffset(50,21),BackgroundColor3=d.theme.ToggleTrack,BackgroundTransparency=d.theme.ToggleTrackTransparency,ZIndex=5})l(b,15)m(b,Color3.fromRGB(255,255,255),0.85,1)local g=k("Frame",{Parent=b,AnchorPoint=Vector2.new(0,0.5),Position=a and UDim2.new(1,-28,0.5,0)or UDim2.new(1,-47,0.5,0),Size=UDim2.fromOffset(25,17),BackgroundColor3=a and d.theme.Accent or d.theme.ToggleKnob,BackgroundTransparency=a and 0 or d.theme.ToggleKnobOffTransparency,ZIndex=8})l(g,99)local h=m(g,a and d.theme.AccentStroke or Color3.fromRGB(255,255,255),a and 0 or 0.7,1)local k=n(g,d.theme.Accent,20,a and d.theme.AccentGlow or 1)local b=setmetatable({window=d,tab=self,main=c.main,title=c.title,interact=c.interact,baseStroke=c.stroke,track=b,knob=g,knobStroke=h,knobGlow=k,name=c.name,searchName=c.searchName,flag=f,callback=e,value=a},D)d.controls[f]=b;d.Flags[f]=a;b:_render(true)M(d,c.interact.MouseButton1Click:Connect(function()o(c.main,TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,i.ElementHeight)})b:Set(not b.value)task.delay(0.09,function()if c.main.Parent then o(c.main,j.Hover,{Size=UDim2.new(1,-20,0,i.ElementHeight)})end end)end))return self:_addElement(b)end;function D:_render(a)local b=self.value;local c={Position=b and UDim2.new(1,-28,0.5,0)or UDim2.new(1,-47,0.5,0),BackgroundColor3=b and self.window.theme.Accent or self.window.theme.ToggleKnob,BackgroundTransparency=b and 0 or self.window.theme.ToggleKnobOffTransparency}local d={Color=b and self.window.theme.AccentStroke or Color3.fromRGB(255,255,255),Transparency=b and 0 or 0.7}if a then for a,b in pairs(c)do self.knob[a]=b end;for a,b in pairs(d)do self.knobStroke[a]=b end else o(self.knob,j.Hover,c)o(self.knobStroke,j.Hover,d)end;if self.knobGlow then self.knobGlow.Color=self.window.theme.Accent;if a then self.knobGlow.Transparency=b and self.window.theme.AccentGlow or 1 else o(self.knobGlow,j.Hover,{Transparency=b and self.window.theme.AccentGlow or 1})end end end;function D:Set(a,b)self.value=a==true;self.window.Flags[self.flag]=self.value;self:_render(false)if not b then N("toggle",self.callback,self.value)end;return self.value end;function D:Get()return self.value end;function C:CreateButton(a)a=type(a)=="table"and a or{}local c=O(self,i.ElementHeight,a,i.ElementContentInset)local a=b(a,"callback","Callback")or function()end;local b=k("TextLabel",{Parent=c.main,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-18,0.5,0),Size=UDim2.fromOffset(20,20),BackgroundTransparency=1,Text="›",TextColor3=self.window.theme.Secondary,TextTransparency=0.2,TextSize=24,FontFace=q,ZIndex=6})local d=setmetatable({window=self.window,tab=self,main=c.main,title=c.title,arrow=b,name=c.name,searchName=c.searchName,callback=a},E)M(self.window,c.interact.MouseButton1Click:Connect(function()o(b,j.Fast,{Position=UDim2.new(1,-13,0.5,0)})N("button",a)task.delay(0.1,function()if b.Parent then o(b,j.Hover,{Position=UDim2.new(1,-18,0.5,0)})end end)end))return self:_addElement(d)end;function E:Fire()N("button",self.callback)end;function C:CreateTextbox(a)a=type(a)=="table"and a or{}local c=O(self,51,a,210)local d=self.window;local e=b(a,"callback","Callback")or function()end;local f=b(a,"placeholder","Placeholder")or"Type here";local g=string.lower(c.name:gsub("%s+","_"))local g=Q(d,b(a,"flag","Flag"),g)local i=tostring(b(a,"value","Value","default","Default")or"")local n=b(a,"numeric","Numeric")==true;local a=b(a,"clearOnFocus","ClearOnFocus")==true;local b=k("Frame",{Parent=c.main,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-14,0.5,0),Size=UDim2.fromOffset(180,31),BackgroundColor3=d.theme.Field,BackgroundTransparency=0.08,Active=true,ZIndex=5})l(b,9)local l=m(b,d.theme.StrokeSoft,0.42,1)local a=k("TextBox",{Parent=b,Position=UDim2.fromOffset(10,0),Size=UDim2.new(1,-20,1,0),BackgroundTransparency=1,ClearTextOnFocus=a,Text=i,PlaceholderText=f,TextColor3=d.theme.Text,PlaceholderColor3=d.theme.Muted,TextSize=14,FontFace=h,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Active=true,ZIndex=6})local c=setmetatable({window=d,tab=self,main=c.main,title=c.title,name=c.name,searchName=c.searchName,flag=g,callback=e,value=i,field=b,fieldStroke=l,box=a,numeric=n},F)d.controls[g]=c;d.Flags[g]=i;M(d,a.Focused:Connect(function()o(b,j.Hover,{BackgroundColor3=d.theme.FieldHover})o(l,j.Hover,{Color=d.theme.AccentStroke,Transparency=0.15})end))M(d,a.FocusLost:Connect(function(e)o(b,j.Hover,{BackgroundColor3=d.theme.Field})o(l,j.Hover,{Color=d.theme.StrokeSoft,Transparency=0.42})local b=a.Text;if n and b~=""and tonumber(b)==nil then a.Text=c.value;return end;c:Set(b,false,e)end))return self:_addElement(c)end;C.CreateInput=C.CreateTextbox;function F:Set(a,b,c)a=tostring(a or"")if self.numeric and a~=""and tonumber(a)==nil then return self.value end;self.value=a;self.box.Text=a;self.window.Flags[self.flag]=a;if not b then N("textbox",self.callback,a,c==true)end;return a end;function F:Get()return self.value end;function C:CreateSlider(a)a=type(a)=="table"and a or{}local f=O(self,65,a,250)local g=self.window;local i=b(a,"callback","Callback")or function()end;local j=tonumber(b(a,"min","Min"))or 0;local p=tonumber(b(a,"max","Max"))or 100;local q=tonumber(b(a,"increment","Increment","step","Step"))or 1;local r=tostring(b(a,"suffix","Suffix")or"")local s=string.lower(f.name:gsub("%s+","_"))local s=Q(g,b(a,"flag","Flag"),s)if p<j then j,p=p,j end;if q<=0 then q=1 end;r=r:gsub("^%s+",""):gsub("%s+$","")local a=tonumber(b(a,"value","Value","currentValue","CurrentValue","default","Default"))if a==nil then a=j end;a=A(j,p,q,a)f.content.AnchorPoint=Vector2.new(0,0)f.content.Position=UDim2.fromOffset(20,16)f.content.Size=UDim2.fromOffset(170,18)local b=k("TextLabel",{Parent=f.main,Position=UDim2.fromOffset(20,35),Size=UDim2.fromOffset(170,16),BackgroundTransparency=1,Text="",TextColor3=g.theme.Text,TextTransparency=0.3,TextSize=15,FontFace=h,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,ZIndex=6})local h=k("Frame",{Parent=f.main,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=UDim2.fromOffset(222,14),BackgroundColor3=g.theme.SliderBackground,BackgroundTransparency=0,ZIndex=6})l(h,13)local t=k("Frame",{Parent=h,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=0,ZIndex=7})l(t,13)k("UIGradient",{Parent=t,Rotation=2,Offset=Vector2.new(0,0.5),Color=ColorSequence.new(g.theme.Accent),Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)})})local u=n(t,g.theme.Accent,20,math.max(0.55,g.theme.AccentGlow))local v=k("Frame",{Parent=t,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(1,0,0.5,0),Size=UDim2.fromOffset(35,20),BackgroundColor3=g.theme.SliderHandle,BackgroundTransparency=0,ZIndex=50})l(v,999)local l=m(v,g.theme.SliderStroke,1,1)local m=n(v,Color3.fromRGB(255,255,255),10,0.8)local n=k("TextButton",{Parent=h,Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text="",TextTransparency=1,AutoButtonColor=false,Active=true,ZIndex=60})local k=k("NumberValue",{Parent=f.main,Value=a})local e=setmetatable({window=g,tab=self,main=f.main,title=f.title,name=f.name,searchName=f.searchName,flag=s,callback=i,value=a,minimum=j,maximum=p,increment=q,suffix=r,decimals=e(q),content=f.content,valueLabel=b,displayValue=k,track=h,bar=h,hitbox=n,interact=n,progress=t,fill=t,progressGlow=u,fillGlow=u,handle=v,knob=v,handleStroke=l,handleGlow=m,dragging=false,dragInput=nil,_dragConnection=nil,_displayTween=nil,_layoutMode=nil},G)g.controls[s]=e;g.Flags[s]=a;M(g,k:GetPropertyChangedSignal("Value"):Connect(function()b.Text=e:_format(k.Value)end))local function a(a)local b=math.max(h.AbsoluteSize.X,1)local a=math.clamp((a-h.AbsolutePosition.X)/b,0,1)local a=j+a*(p-j)local a=A(j,p,q,a)if a==e.value then return end;e.value=a;g.Flags[s]=a;e:_render(false,TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),true)N("slider",i,a)end;function e:_currentPointerX()if self.dragInput then return self.dragInput.Position.X end;return c:GetMouseLocation().X end;function e:_setHeld(a)local b=a and Vector2.new(41,22)or Vector2.new(35,20)local c=TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)o(self.handle,c,{Size=UDim2.fromOffset(b.X,b.Y),BackgroundTransparency=a and 0.7 or 0})o(self.handleStroke,c,{Transparency=a and 0.6 or 1})self:_render(false,c,true)end;function e:_endDrag()if not self.dragging then return end;self.dragging=false;self.dragInput=nil;self:_setHeld(false)if self._dragConnection then self._dragConnection:Disconnect()self._dragConnection=nil end end;function e:_beginDrag(b)if self.dragging or self.window.destroyed then return end;self.dragging=true;self.dragInput=b.UserInputType==Enum.UserInputType.Touch and b or nil;self:_setHeld(true)a(self:_currentPointerX())if self._dragConnection then self._dragConnection:Disconnect()self._dragConnection=nil end;self._dragConnection=d.RenderStepped:Connect(function()if self.window.destroyed or not self.dragging or not self.main.Parent then self:_endDrag()return end;a(self:_currentPointerX())end)end;M(g,f.main.MouseEnter:Connect(function()if g.destroyed then return end;o(h,TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundColor3=g.theme.SliderBackgroundHover})end))M(g,f.main.MouseLeave:Connect(function()o(h,TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundColor3=g.theme.SliderBackground})end))M(g,n.InputBegan:Connect(function(a)if a.UserInputType~=Enum.UserInputType.MouseButton1 and a.UserInputType~=Enum.UserInputType.Touch then return end;e:_beginDrag(a)end))M(g,c.InputEnded:Connect(function(a)if not e.dragging then return end;if e.dragInput then if a==e.dragInput then e:_endDrag()end;return end;if a.UserInputType==Enum.UserInputType.MouseButton1 then e:_endDrag()end end))M(g,c.WindowFocusReleased:Connect(function()e:_endDrag()end))M(g,f.main:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()if not g.destroyed then e:_applyLayout()end end))e:_applyLayout()e:_render(true,nil,true)return self:_addElement(e)end;function G:_format(a)local a=string.format("%."..self.decimals.."f",a)if self.suffix~=""then return a.." "..self.suffix end;return a end;function G:_applyLayout()local a=self.main.AbsoluteSize.X;local a=a>0 and a<430 and"narrow"or"wide";if self._layoutMode==a then return end;self._layoutMode=a;if a=="narrow"then self.main.Size=UDim2.new(1,-20,0,70)self.content.AnchorPoint=Vector2.new(0,0)self.content.Position=UDim2.fromOffset(20,14)self.content.Size=UDim2.new(1,-150,0,18)self.valueLabel.AnchorPoint=Vector2.new(1,0)self.valueLabel.Position=UDim2.new(1,-20,0,14)self.valueLabel.Size=UDim2.fromOffset(105,18)self.valueLabel.TextXAlignment=Enum.TextXAlignment.Right;self.track.AnchorPoint=Vector2.new(0.5,1)self.track.Position=UDim2.new(0.5,0,1,-14)self.track.Size=UDim2.new(1,-30,0,14)else self.main.Size=UDim2.new(1,-20,0,65)self.content.AnchorPoint=Vector2.new(0,0)self.content.Position=UDim2.fromOffset(20,16)self.content.Size=UDim2.fromOffset(170,18)self.valueLabel.AnchorPoint=Vector2.new(0,0)self.valueLabel.Position=UDim2.fromOffset(20,35)self.valueLabel.Size=UDim2.fromOffset(170,16)self.valueLabel.TextXAlignment=Enum.TextXAlignment.Left;self.track.AnchorPoint=Vector2.new(1,0.5)self.track.Position=UDim2.new(1,-15,0.5,0)self.track.Size=UDim2.fromOffset(222,14)end end;function G:_render(a,b,c)local d=self.maximum-self.minimum;local d=d==0 and 0 or math.clamp((self.value-self.minimum)/d,0,1)local d=UDim2.new(d,0,1,0)if a then self.progress.Size=d else o(self.progress,b or TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=d})end;if self._displayTween then pcall(self._displayTween.Cancel,self._displayTween)self._displayTween=nil end;if a or c then self.displayValue.Value=self.value else self._displayTween=o(self.displayValue,TweenInfo.new(0.28,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Value=self.value})end end;function G:Set(a,b)a=tonumber(a)or self.minimum;a=A(self.minimum,self.maximum,self.increment,a)self.value=a;self.window.Flags[self.flag]=a;self:_render(false,TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),false)if not b then N("slider",self.callback,a)end;return a end;function G:Get()return self.value end;function G:_cleanup()self.dragging=false;self.dragInput=nil;if self._dragConnection then pcall(self._dragConnection.Disconnect,self._dragConnection)self._dragConnection=nil end;if self._displayTween then pcall(self._displayTween.Cancel,self._displayTween)self._displayTween=nil end end;function C:CreateDropdown(a)a=type(a)=="table"and a or{}local c=O(self,51,a,210)local e=self.window;local f=b(a,"callback","Callback")or function()end;local g=b(a,"values","Values","options","Options")or{}local i=string.lower(c.name:gsub("%s+","_"))local i=Q(e,b(a,"flag","Flag"),i)local a=b(a,"value","Value","default","Default")if a==nil and#g>0 then a=g[1]end;local b=k("TextButton",{Parent=c.main,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-14,0.5,0),Size=UDim2.fromOffset(180,31),BackgroundColor3=e.theme.Field,BackgroundTransparency=0.08,Text="",AutoButtonColor=false,ZIndex=12})l(b,9)local p=m(b,e.theme.StrokeSoft,0.42,1)local s=k("TextLabel",{Parent=b,Position=UDim2.fromOffset(10,0),Size=UDim2.new(1,-34,1,0),BackgroundTransparency=1,Text=tostring(a or"Select"),TextColor3=e.theme.Text,TextSize=14,FontFace=h,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=13})local q=k("TextLabel",{Parent=b,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-9,0.5,0),Size=UDim2.fromOffset(18,18),BackgroundTransparency=1,Text="⌄",TextColor3=e.theme.Secondary,TextSize=16,FontFace=q,ZIndex=13})local t=k("Frame",{Parent=e.screen,Size=UDim2.fromOffset(180,0),BackgroundColor3=e.theme.Window2,BackgroundTransparency=0.02,Visible=false,ClipsDescendants=true,ZIndex=500})l(t,11)m(t,e.theme.StrokeSoft,0.28,1)n(t,e.theme.Shadow,24,0.35)local m=k("ScrollingFrame",{Parent=t,Position=UDim2.fromOffset(5,5),Size=UDim2.new(1,-10,1,-10),BackgroundTransparency=1,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,ZIndex=501})local n=k("UIListLayout",{Parent=m,Padding=UDim.new(0,3),SortOrder=Enum.SortOrder.LayoutOrder})local c=setmetatable({window=e,tab=self,main=c.main,title=c.title,name=c.name,searchName=c.searchName,flag=i,callback=f,values=table.clone(g),value=a,field=b,fieldStroke=p,valueLabel=s,arrow=q,popup=t,list=m,listLayout=n,open=false,optionButtons={}},H)e.controls[i]=c;e.Flags[i]=a;function c:_positionPopup()local a=b.AbsolutePosition;t.Position=UDim2.fromOffset(a.X,a.Y+b.AbsoluteSize.Y+6)end;function c:_rebuild()for a,a in ipairs(self.optionButtons)do a:Destroy()end;table.clear(self.optionButtons)for a,b in ipairs(self.values)do local a=k("TextButton",{Parent=m,Size=UDim2.new(1,0,0,30),BackgroundColor3=e.theme.Element,BackgroundTransparency=1,Text=tostring(b),TextColor3=e.theme.Text,TextTransparency=b==self.value and 0 or 0.18,TextSize=14,FontFace=b==self.value and r or h,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,LayoutOrder=a,ZIndex=502})k("UIPadding",{Parent=a,PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10)})l(a,8)M(e,a.MouseEnter:Connect(function()o(a,j.Hover,{BackgroundTransparency=0.4})end))M(e,a.MouseLeave:Connect(function()o(a,j.Hover,{BackgroundTransparency=1})end))M(e,a.MouseButton1Click:Connect(function()self:Set(b)self:SetOpen(false)end))table.insert(self.optionButtons,a)end end;c:_rebuild()M(e,b.MouseButton1Click:Connect(function()c:SetOpen(not c.open)end))M(e,d.RenderStepped:Connect(function()if c.open and t.Visible and not e.destroyed then c:_positionPopup()end end))return self:_addElement(c)end;function H:SetOpen(a)a=a==true;self.open=a;if a then self.window:_closePopups(self)self:_positionPopup()local a=math.min(180,#self.values*33+10)self.popup.Size=UDim2.fromOffset(180,0)self.popup.Visible=true;o(self.popup,j.Hover,{Size=UDim2.fromOffset(180,a)})o(self.arrow,j.Hover,{Rotation=180})o(self.fieldStroke,j.Hover,{Color=self.window.theme.AccentStroke,Transparency=0.15})self.window._openPopup=self else o(self.arrow,j.Hover,{Rotation=0})o(self.fieldStroke,j.Hover,{Color=self.window.theme.StrokeSoft,Transparency=0.42})local a=o(self.popup,j.Fast,{Size=UDim2.fromOffset(180,0)})if self.window._openPopup==self then self.window._openPopup=nil end;if a then a.Completed:Once(function()if not self.open and self.popup.Parent then self.popup.Visible=false end end)else self.popup.Visible=false end end end;function H:Set(a,b)self.value=a;self.valueLabel.Text=tostring(a==nil and"Select"or a)self.window.Flags[self.flag]=a;self:_rebuild()if not b then N("dropdown",self.callback,a)end;return a end;function H:Get()return self.value end;function H:SetValues(a)self.values=type(a)=="table"and table.clone(a)or{}self:_rebuild()if self.value~=nil and not table.find(self.values,self.value)then self:Set(self.values[1],true)end end;function C:CreateColorPicker(a)a=type(a)=="table"and a or{}local e=O(self,51,a,228)local f=self.window;local g=b(a,"callback","Callback")or function()end;local i=string.lower(e.name:gsub("%s+","_"))local i=Q(f,b(a,"flag","Flag"),i)local a=b(a,"value","Value","default","Default")if typeof(a)~="Color3"then a=f.theme.Accent end;local b=k("TextButton",{Parent=e.main,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-14,0.5,0),Size=UDim2.fromOffset(198,31),BackgroundColor3=f.theme.Field,BackgroundTransparency=0.08,Text="",AutoButtonColor=false,ZIndex=12})l(b,9)local p=m(b,f.theme.StrokeSoft,0.42,1)local q=k("Frame",{Parent=b,Position=UDim2.fromOffset(7,6),Size=UDim2.fromOffset(19,19),BackgroundColor3=a,ZIndex=13})l(q,6)m(q,Color3.fromRGB(255,255,255),0.78,1)local r=k("TextBox",{Parent=b,Position=UDim2.fromOffset(34,0),Size=UDim2.new(1,-42,1,0),BackgroundTransparency=1,ClearTextOnFocus=false,Text=x(a),PlaceholderText="#FFFFFF",TextColor3=f.theme.Text,PlaceholderColor3=f.theme.Muted,TextSize=14,FontFace=h,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=14})local s=k("Frame",{Parent=f.screen,Size=UDim2.fromOffset(235,0),BackgroundColor3=f.theme.Window2,BackgroundTransparency=0.02,Visible=false,ClipsDescendants=true,ZIndex=520})l(s,12)m(s,f.theme.StrokeSoft,0.25,1)n(s,f.theme.Shadow,26,0.3)local n=k("Frame",{Parent=s,Position=UDim2.fromOffset(10,10),Size=UDim2.fromOffset(184,136),BackgroundColor3=Color3.fromHSV(0,1,1),Active=true,ZIndex=521})l(n,9)k("UIGradient",{Parent=n,Color=ColorSequence.new(Color3.new(1,1,1),Color3.new(1,1,1)),Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)})})local t=k("Frame",{Parent=n,Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=0,ZIndex=522})l(t,9)k("UIGradient",{Parent=t,Rotation=90,Color=ColorSequence.new(Color3.new(0,0,0),Color3.new(0,0,0)),Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)})})local t=k("Frame",{Parent=n,AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromOffset(11,11),BackgroundTransparency=1,ZIndex=524})l(t,99)m(t,Color3.new(1,1,1),0,1.5)local u=k("Frame",{Parent=s,Position=UDim2.fromOffset(204,10),Size=UDim2.fromOffset(21,136),Active=true,ZIndex=521})l(u,8)k("UIGradient",{Parent=u,Rotation=90,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),ColorSequenceKeypoint.new(0.1667,Color3.fromHSV(0.1667,1,1)),ColorSequenceKeypoint.new(0.3333,Color3.fromHSV(0.3333,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),ColorSequenceKeypoint.new(0.6667,Color3.fromHSV(0.6667,1,1)),ColorSequenceKeypoint.new(0.8333,Color3.fromHSV(0.8333,1,1)),ColorSequenceKeypoint.new(1,Color3.fromHSV(1,1,1))})})local v=k("Frame",{Parent=u,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0),Size=UDim2.new(1,6,0,3),BackgroundColor3=Color3.new(1,1,1),ZIndex=524})l(v,99)m(v,Color3.new(0,0,0),0.45,1)local h=k("TextLabel",{Parent=s,Position=UDim2.fromOffset(10,153),Size=UDim2.new(1,-20,0,22),BackgroundTransparency=1,Text="",TextColor3=f.theme.Secondary,TextSize=13,FontFace=h,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=521})local e=setmetatable({window=f,tab=self,main=e.main,title=e.title,name=e.name,searchName=e.searchName,flag=i,callback=g,value=a,field=b,fieldStroke=p,swatch=q,hexBox=r,popup=s,sv=n,svCursor=t,hue=u,hueCursor=v,rgbLabel=h,open=false,draggingSV=false,draggingHue=false},I)e.h,e.s,e.v=a:ToHSV()f.controls[i]=e;f.Flags[i]=a;function e:_positionPopup()local a=b.AbsolutePosition;s.Position=UDim2.fromOffset(a.X-37,a.Y+b.AbsoluteSize.Y+6)end;function e:_renderPicker()self.sv.BackgroundColor3=Color3.fromHSV(self.h,1,1)self.svCursor.Position=UDim2.fromScale(self.s,1-self.v)self.hueCursor.Position=UDim2.fromScale(0.5,self.h)self.swatch.BackgroundColor3=self.value;self.hexBox.Text=x(self.value)self.rgbLabel.Text=string.format("RGB  %d, %d, %d",math.floor(self.value.R*255+0.5),math.floor(self.value.G*255+0.5),math.floor(self.value.B*255+0.5))end;local function a(a)e.value=Color3.fromHSV(e.h,e.s,e.v)e.window.Flags[e.flag]=e.value;e:_renderPicker()if not a then N("color picker",e.callback,e.value)end end;local function g(b)e.s=math.clamp((b.X-n.AbsolutePosition.X)/math.max(n.AbsoluteSize.X,1),0,1)e.v=1-math.clamp((b.Y-n.AbsolutePosition.Y)/math.max(n.AbsoluteSize.Y,1),0,1)a(false)end;local function h(b)e.h=math.clamp((b.Y-u.AbsolutePosition.Y)/math.max(u.AbsoluteSize.Y,1),0,1)a(false)end;M(f,b.MouseButton1Click:Connect(function()if not r:IsFocused()then e:SetOpen(not e.open)end end))M(f,r.Focused:Connect(function()o(p,j.Hover,{Color=f.theme.AccentStroke,Transparency=0.15})end))M(f,r.FocusLost:Connect(function()local a=y(r.Text)if a then e:Set(a)else r.Text=x(e.value)end;if not e.open then o(p,j.Hover,{Color=f.theme.StrokeSoft,Transparency=0.42})end end))M(f,n.InputBegan:Connect(function(a)if a.UserInputType==Enum.UserInputType.MouseButton1 or a.UserInputType==Enum.UserInputType.Touch then e.draggingSV=true;g(a.Position)end end))M(f,u.InputBegan:Connect(function(a)if a.UserInputType==Enum.UserInputType.MouseButton1 or a.UserInputType==Enum.UserInputType.Touch then e.draggingHue=true;h(a.Position)end end))M(f,c.InputChanged:Connect(function(a)if f.destroyed then return end;if a.UserInputType~=Enum.UserInputType.MouseMovement and a.UserInputType~=Enum.UserInputType.Touch then return end;if e.draggingSV then g(a.Position)elseif e.draggingHue then h(a.Position)end end))M(f,c.InputEnded:Connect(function(a)if a.UserInputType==Enum.UserInputType.MouseButton1 or a.UserInputType==Enum.UserInputType.Touch then e.draggingSV=false;e.draggingHue=false end end))M(f,d.RenderStepped:Connect(function()if e.open and s.Visible and not f.destroyed then e:_positionPopup()end end))e:_renderPicker()return self:_addElement(e)end;function I:SetOpen(a)a=a==true;self.open=a;if a then self.window:_closePopups(self)self:_positionPopup()self.popup.Size=UDim2.fromOffset(235,0)self.popup.Visible=true;o(self.popup,j.Hover,{Size=UDim2.fromOffset(235,185)})o(self.fieldStroke,j.Hover,{Color=self.window.theme.AccentStroke,Transparency=0.15})self.window._openPopup=self else local a=o(self.popup,j.Fast,{Size=UDim2.fromOffset(235,0)})if not self.hexBox:IsFocused()then o(self.fieldStroke,j.Hover,{Color=self.window.theme.StrokeSoft,Transparency=0.42})end;if self.window._openPopup==self then self.window._openPopup=nil end;if a then a.Completed:Once(function()if not self.open and self.popup.Parent then self.popup.Visible=false end end)else self.popup.Visible=false end end end;function I:Set(a,b)if typeof(a)~="Color3"then return self.value end;self.value=a;self.h,self.s,self.v=a:ToHSV()self.window.Flags[self.flag]=a;self:_renderPicker()if not b then N("color picker",self.callback,a)end;return a end;function I:Get()return self.value end;function C:CreateKeybind(a)a=type(a)=="table"and a or{}local d=O(self,51,a,130)local e=self.window;local f=b(a,"callback","Callback")or function()end;local g=b(a,"changedCallback","ChangedCallback")or function()end;local h=string.lower(d.name:gsub("%s+","_"))local h=Q(e,b(a,"flag","Flag"),h)local a=b(a,"value","Value","default","Default")if typeof(a)~="EnumItem"or a.EnumType~=Enum.KeyCode then a=Enum.KeyCode.Unknown end;local b=k("TextButton",{Parent=d.main,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-14,0.5,0),Size=UDim2.fromOffset(100,31),BackgroundColor3=e.theme.Field,BackgroundTransparency=0.08,Text=a==Enum.KeyCode.Unknown and"None"or a.Name,TextColor3=e.theme.Text,TextSize=13,FontFace=q,AutoButtonColor=false,ZIndex=12})l(b,9)local i=m(b,e.theme.StrokeSoft,0.42,1)local d=setmetatable({window=e,tab=self,main=d.main,title=d.title,name=d.name,searchName=d.searchName,flag=h,callback=f,changedCallback=g,value=a,button=b,buttonStroke=i,listening=false},J)e.controls[h]=d;e.Flags[h]=a;M(e,b.MouseButton1Click:Connect(function()d.listening=true;b.Text="...";o(i,j.Hover,{Color=e.theme.AccentStroke,Transparency=0.15})end))M(e,c.InputBegan:Connect(function(a,b)if d._destroyed then return end;if d.listening then if a.UserInputType~=Enum.UserInputType.Keyboard then return end;d.listening=false;if a.KeyCode==Enum.KeyCode.Escape or a.KeyCode==Enum.KeyCode.Backspace then d:Set(Enum.KeyCode.Unknown)else d:Set(a.KeyCode)end;o(i,j.Hover,{Color=e.theme.StrokeSoft,Transparency=0.42})return end;if b or a.UserInputType~=Enum.UserInputType.Keyboard then return end;if d.value~=Enum.KeyCode.Unknown and a.KeyCode==d.value then N("keybind",f,a.KeyCode)end end))return self:_addElement(d)end;function J:Set(a,b)if typeof(a)~="EnumItem"or a.EnumType~=Enum.KeyCode then a=Enum.KeyCode.Unknown end;self.value=a;self.window.Flags[self.flag]=a;self.button.Text=a==Enum.KeyCode.Unknown and"None"or a.Name;if not b then N("keybind changed",self.changedCallback,a)end;return a end;function J:Get()return self.value end;function C:CreateLabel(a)local a=type(a)=="string"and a or b(a,"text","Text","name","Name")or"Label";local b=k("Frame",{Parent=self.page,Size=UDim2.new(1,-20,0,30),BackgroundTransparency=1})local c=k("TextLabel",{Parent=b,Position=UDim2.fromOffset(10,0),Size=UDim2.new(1,-20,1,0),BackgroundTransparency=1,Text=a,TextColor3=self.window.theme.Secondary,TextSize=14,FontFace=h,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextWrapped=true})local a=setmetatable({window=self.window,tab=self,main=b,label=c,name=a,searchName=string.lower(a)},K)return self:_addElement(a)end;function K:Set(a)self.name=tostring(a)self.searchName=string.lower(self.name)self.label.Text=self.name end;function C:CreateParagraph(a)a=type(a)=="table"and a or{Text=tostring(a or"")}local c=b(a,"title","Title","name","Name")or"";local a=b(a,"text","Text","content","Content")or"";local b=k("Frame",{Parent=self.page,Size=UDim2.new(1,-20,0,76),BackgroundColor3=self.window.theme.Element,BackgroundTransparency=0.15})l(b,12)m(b,self.window.theme.Stroke,0.2,1)local d=k("TextLabel",{Parent=b,Position=UDim2.fromOffset(15,10),Size=UDim2.new(1,-30,0,18),BackgroundTransparency=1,Text=c,TextColor3=self.window.theme.Text,TextSize=15,FontFace=r,TextXAlignment=Enum.TextXAlignment.Left,Visible=c~=""})local e=k("TextLabel",{Parent=b,Position=UDim2.fromOffset(15,c~=""and 31 or 10),Size=UDim2.new(1,-30,0,c~=""and 35 or 55),BackgroundTransparency=1,Text=a,TextColor3=self.window.theme.Secondary,TextTransparency=0.08,TextSize=13,FontFace=h,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true})local a=setmetatable({window=self.window,tab=self,main=b,title=d,body=e,name=c.." "..a,searchName=string.lower(c.." "..a)},L)return self:_addElement(a)end;function L:Set(a,b)if b==nil then b=a;a=""end;a=tostring(a or"")b=tostring(b or"")self.title.Text=a;self.title.Visible=a~="";self.body.Text=b;self.body.Position=UDim2.fromOffset(15,a~=""and 31 or 10)self.body.Size=UDim2.new(1,-30,0,a~=""and 35 or 55)self.name=a.." "..b;self.searchName=string.lower(self.name)end;function B:_closePopups(a)if self._openPopup and self._openPopup~=a and self._openPopup.SetOpen then self._openPopup:SetOpen(false)end end;function B:_applySearch(a)local b=self.selectedTab;if not b then return end;a=string.lower(tostring(a or""))for b,b in ipairs(b.elements)do local c=a=="";if not c and not b.isSection then c=string.find(b.searchName or"",a,1,true)~=nil end;b.main.Visible=c end end;function B:_updateDragArea()local a=self.searchOpen and i.SearchReserve or i.ActionReserve;self.dragArea.Size=UDim2.new(1,-a,1,0)end;function B:CreateTab(a)a=type(a)=="table"and a or{}local c=b(a,"name","Name")or"Tab";local a=b(a,"icon","Icon")local b=k("TextButton",{Parent=self.tabList,Size=UDim2.new(1,-i.RowInset*2,0,i.RowHeight),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Text="",TextTransparency=1,AutoButtonColor=false})l(b,i.RowCorner)local d=k("UIGradient",{Parent=b,Rotation=90,Color=ColorSequence.new(self.theme.Tab,self.theme.TabBottom)})local e=m(b,Color3.fromRGB(255,255,255),1,1)local f=k("UIGradient",{Parent=e,Rotation=90,Color=ColorSequence.new(self.theme.TabStrokeTop,self.theme.TabStrokeBottom)})local g=n(b,Color3.fromRGB(255,255,255),20,1,UDim2.new(0,0,0,-15),UDim2.new(0,10,0,-30))local h=k("Frame",{Parent=b,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,i.RowPadding,0.5,0),Size=UDim2.new(1,-i.RowPadding,0,24),BackgroundTransparency=1})k("UIListLayout",{Parent=h,FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,i.RowContentSpacing)})local j=k("CanvasGroup",{Parent=h,Size=UDim2.fromOffset(i.RowIconSize,i.RowIconSize),BackgroundTransparency=1,GroupTransparency=0.5,LayoutOrder=0})if a~=nil and a~=0 and a~=""then w(j,a,self.theme.Text,i.RowIconSize,c)else v(j,c,self.theme.Text,i.RowIconSize)end;local h=k("TextLabel",{Parent=h,Size=UDim2.fromOffset(120,16),AutomaticSize=Enum.AutomaticSize.XY,BackgroundTransparency=1,Text=c,TextColor3=self.theme.Text,TextTransparency=0.5,TextSize=16,FontFace=q,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,LayoutOrder=1})local i=k("ScrollingFrame",{Parent=self.pageHost,Size=UDim2.fromScale(1,1),BackgroundTransparency=1,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,Visible=false})k("UIPadding",{Parent=i,PaddingTop=UDim.new(0,17),PaddingBottom=UDim.new(0,17)})k("UIListLayout",{Parent=i,FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4)})local a=setmetatable({window=self,name=c,icon=a,selector=b,selectorStroke=e,selectorGradient=d,selectorStrokeGradient=f,selectorShadow=g,selectorIcon=j,selectorTitle=h,page=i,elements={}},C)table.insert(self.tabs,a)b.LayoutOrder=#self.tabs*10;M(self,b.MouseEnter:Connect(function()if self.selectedTab~=a then P(a,"hover",false)d.Rotation=-270;f.Rotation=-270;o(d,TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Rotation=90})o(f,TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Rotation=90})end end))M(self,b.MouseLeave:Connect(function()if self.selectedTab~=a then P(a,"unselected",false)end end))M(self,b.MouseButton1Click:Connect(function()self:_closePopups()a:Select()end))P(a,"unselected",true)if not self.selectedTab then a:Select()end;return a end;function B:GetFlag(a)return self.Flags[a]end;function B:SetFlag(a,b)local c=self.controls[a];if c and c.Set then return c:Set(b)end;self.Flags[a]=b;return b end;function B:Notify(a)a=type(a)=="table"and a or{Description=tostring(a or"Notification")}if self.destroyed then return nil end;local c=tostring(b(a,"title","Title")or"Notification")local d=tostring(b(a,"description","Description","content","Content","text","Text")or"")local e=string.lower(tostring(b(a,"type","Type")or"info"))local f=b(a,"icon","Icon")local a=tonumber(b(a,"duration","Duration"))if a==nil then a=math.clamp(#d*0.06+3,3,9)end;a=math.max(a,0.1)local b={info=self.theme.Info,success=self.theme.Success,warning=self.theme.Warning,error=self.theme.Danger,danger=self.theme.Danger}local g={info="i",success="✓",warning="!",error="×",danger="×"}local b=b[e]or self.theme.Info;local i=g[e]or"i";local j=f~=nil and f~=0 and f~="";local g=j or g[e]~=nil;local p=g and 222 or 260;local q=z(c,r,16,p)local s=d~=""and z(d,h,15,p)or 0;local t=q+(s>0 and 4+s or 0)local u=math.max(t,g and 24 or 0)+28;local u=u+8;self._notificationCount=(self._notificationCount or 0)+1;self._liveNotifications=self._liveNotifications or{}self._notificationRecords=self._notificationRecords or{}local v=k("Frame",{Parent=self.notificationList,Name="Notification",Size=UDim2.new(1,0,0,0),BackgroundTransparency=1,LayoutOrder=self._notificationCount,ZIndex=900})k("UIPadding",{Parent=v,PaddingTop=UDim.new(0,8)})local x=k("Frame",{Parent=v,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,360,0.5,0),Size=UDim2.new(1,0,1,0),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Active=true,ZIndex=901})l(x,18)k("UIGradient",{Parent=x,Rotation=270,Offset=Vector2.new(0,-0.1),Color=ColorSequence.new({ColorSequenceKeypoint.new(0,self.theme.Window),ColorSequenceKeypoint.new(0.9999,self.theme.Window2),ColorSequenceKeypoint.new(1,self.theme.Element)})})local l=m(x,self.theme.Text,1,1)local m=n(x,self.theme.Shadow,20,1)k("UIPadding",{Parent=x,PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20)})k("UIListLayout",{Parent=x,FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14)})local n;if g then n=k("CanvasGroup",{Parent=x,Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,GroupTransparency=1,LayoutOrder=1,ZIndex=902})if j then local a=w(n,f,self.theme.Text,24,c)a.AnchorPoint=Vector2.new(0.5,0.5)a.Position=UDim2.fromScale(0.5,0.5)else k("TextLabel",{Parent=n,Size=UDim2.fromScale(1,1),BackgroundTransparency=1,Text=i,TextColor3=b,TextSize=e=="success"and 18 or 17,FontFace=r,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,ZIndex=903})end end;local b=k("Frame",{Parent=x,Size=UDim2.fromOffset(p,t),BackgroundTransparency=1,LayoutOrder=2,ZIndex=902})k("UIListLayout",{Parent=b,FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4)})local c=k("TextLabel",{Parent=b,Size=UDim2.new(1,0,0,q),BackgroundTransparency=1,Text=c,TextColor3=self.theme.Text,TextSize=16,FontFace=r,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextTransparency=1,LayoutOrder=1,ZIndex=903})local e;if d~=""then e=k("TextLabel",{Parent=b,Size=UDim2.new(1,0,0,s),BackgroundTransparency=1,Text=d,TextColor3=self.theme.Text,TextSize=15,FontFace=h,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextTransparency=1,LayoutOrder=2,ZIndex=903})end;local b={Instance=v,Body=x,_connections={},_dismissed=false,_hovered=false}local function d(a,c)local a=a:Connect(c)table.insert(b._connections,a)return a end;local function f()for a,a in ipairs(b._connections)do pcall(a.Disconnect,a)end;table.clear(b._connections)end;local function g()if not self._liveNotifications then return end;local a=table.find(self._liveNotifications,b)if a then table.remove(self._liveNotifications,a)end end;local function h()if not self._notificationRecords then return end;local a=table.find(self._notificationRecords,b)if a then table.remove(self._notificationRecords,a)end end;local function i()b._dismissed=true;g()h()f()if v.Parent then v:Destroy()end end;local function j()if b._dismissed then return end;b._dismissed=true;g()if not v.Parent then f()return end;o(x,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=1})o(l,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Transparency=1})if m then o(m,TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Transparency=1})end;o(c,TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=1})if e then o(e,TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=1})end;if n then o(n,TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{GroupTransparency=1})end;o(x,TweenInfo.new(0.9,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-90,1,0)})local a=o(v,TweenInfo.new(0.9,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,0,0)})local function b()h()f()if v.Parent then v:Destroy()end end;if a then a.Completed:Once(b)else task.delay(0.92,b)end end;b.Close=j;b._destroyImmediately=i;table.insert(self._liveNotifications,b)table.insert(self._notificationRecords,b)while#self._liveNotifications>6 do local a=table.remove(self._liveNotifications,1)if a and a~=b and a.Close then task.spawn(a.Close)end end;d(x.MouseEnter,function()b._hovered=true end)d(x.MouseLeave,function()b._hovered=false end)d(x.InputBegan,function(a)if a.UserInputType==Enum.UserInputType.MouseButton1 or a.UserInputType==Enum.UserInputType.Touch then j()end end)task.spawn(function()if b._dismissed or self.destroyed or not v.Parent then return end;o(v,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,0,u)})o(x,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,0)})o(x,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0})o(l,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Transparency=0.95})if m then o(m,TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Transparency=0.6})end;o(c,TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0})task.wait(0.05)if b._dismissed or self.destroyed or not v.Parent then return end;if n then o(n,TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{GroupTransparency=0})end;task.wait(0.05)if b._dismissed or self.destroyed or not v.Parent then return end;if e then o(e,TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.35})end;local c=0;while c<a and not b._dismissed and not self.destroyed and v.Parent do local a=task.wait()if not b._hovered then c+=a end end;if not b._dismissed then j()end end)return b end;function B:Minimize(a)if a==nil then a=not self.minimized end;a=a==true;if self.minimized==a or self.animating or self.hidden then return end;self:_closePopups()self.minimized=a;self.animating=true;local b=(a and i.TopbarHeight-self.size.Y or self.size.Y-i.TopbarHeight)/2;local c=self.main.Position;local b=UDim2.new(c.X.Scale,c.X.Offset,c.Y.Scale,c.Y.Offset+b)if a then o(self.body,j.Fast,{GroupTransparency=1})task.delay(0.12,function()if self.main.Parent and self.minimized then self.body.Visible=false end end)o(self.main,j.Move,{Size=UDim2.fromOffset(self.size.X,i.TopbarHeight),Position=b})o(self.minimizeVLine,j.Hover,{BackgroundTransparency=0})else self.body.Visible=true;self.body.GroupTransparency=1;o(self.main,j.Move,{Size=UDim2.fromOffset(self.size.X,self.size.Y),Position=b})o(self.minimizeVLine,j.Hover,{BackgroundTransparency=1})task.delay(0.09,function()if self.main.Parent and not self.minimized then o(self.body,j.Reveal,{GroupTransparency=0})end end)end;task.delay(0.38,function()self.animating=false end)end;function B:Show()if self.destroyed or not self.hidden or self.animating then return end;self.animating=true;self.hidden=false;self.screen.Enabled=true;local a=self._restorePosition or UDim2.new(0.5,0,0.5,0)local b=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut)self.collapsedInteract.Visible=true;self.collapsedInteract.Active=true;o(self.collapsedFace,j.Fast,{GroupTransparency=1})local c=o(self.collapsedShell,b,{Size=UDim2.fromOffset(self.size.X,self.size.Y),Position=a})o(self.collapsedInteract,b,{Size=UDim2.fromOffset(self.size.X,self.size.Y),Position=a})o(self.collapsedShellCorner,b,{CornerRadius=UDim.new(0,18)})task.delay(0.22,function()if self.hidden or self.destroyed then return end;self.main.Position=a;self.main.Size=UDim2.fromOffset(self.size.X,self.size.Y)self.main.Visible=true;self.main.GroupTransparency=1;self.scale.Scale=1;self.topbar.Visible=true;self.body.Visible=true;self.topbar.GroupTransparency=0;self.body.GroupTransparency=0;o(self.main,j.Reveal,{GroupTransparency=0})o(self.shadow,j.Reveal,{Transparency=0.6})o(self.mainStroke,j.Reveal,{Transparency=0.6})o(self.collapsedShell,j.Reveal,{BackgroundTransparency=1})o(self.collapsedShellStroke,j.Reveal,{Transparency=1})o(self.collapsedShellShadow,j.Reveal,{Transparency=1})end)local function b()if self.destroyed or self.hidden then return end;self.main.Position=a;self.main.Size=UDim2.fromOffset(self.size.X,self.size.Y)self.main.Visible=true;self.main.GroupTransparency=0;self.collapsedShell.BackgroundTransparency=1;self.collapsedShell.Visible=false;self.collapsedFace.GroupTransparency=1;self.collapsedInteract.Visible=false;self.animating=false end;if c then c.Completed:Once(b)else task.delay(0.4,b)end end;function B:Hide()if self.destroyed or self.hidden or self.animating then return end;self:_closePopups()self.animating=true;self.hidden=true;if self.minimized then self.minimized=false;local a=self.main.Position;self.main.Position=UDim2.new(a.X.Scale,a.X.Offset,a.Y.Scale,a.Y.Offset+(self.size.Y-i.TopbarHeight)/2)self.minimizeVLine.BackgroundTransparency=1;self.main.Size=UDim2.fromOffset(self.size.X,self.size.Y)self.body.Visible=true;self.body.GroupTransparency=0 end;self._restorePosition=self.main.Position;self.screen.Enabled=true;if self.searchOpen then self.searchOpen=false;self.searchBox:ReleaseFocus()self.searchBox.Text="";self:_applySearch("")self.searchPill.Visible=false;self:_updateDragArea()end;local a=UDim2.fromOffset(185,50)local b=self._collapsedPosition or UDim2.new(0.5,0,0,45)self.collapsedShell.Visible=true;self.collapsedShell.Position=self.main.Position;self.collapsedShell.Size=self.main.Size;self.collapsedShell.BackgroundTransparency=1;self.collapsedShellCorner.CornerRadius=UDim.new(0,18)self.collapsedShellStroke.Transparency=1;if self.collapsedShellShadow then self.collapsedShellShadow.Transparency=1 end;self.collapsedFace.Visible=true;self.collapsedFace.GroupTransparency=1;self.collapsedInteract.Visible=true;self.collapsedInteract.Active=true;self.collapsedInteract.Position=self.main.Position;self.collapsedInteract.Size=self.main.Size;o(self.topbar,j.Fast,{GroupTransparency=1})o(self.body,j.Fast,{GroupTransparency=1})o(self.mainStroke,j.Fast,{Transparency=1})o(self.shadow,j.Fast,{Transparency=1})o(self.main,j.Fast,{GroupTransparency=1})o(self.collapsedShell,j.Fast,{BackgroundTransparency=0})o(self.collapsedShellStroke,j.Fast,{Transparency=0.6})o(self.collapsedShellShadow,j.Fast,{Transparency=0.6})local c=o(self.collapsedShell,j.Move,{Size=a,Position=b})o(self.collapsedInteract,j.Move,{Size=a,Position=b})o(self.collapsedShellCorner,j.Move,{CornerRadius=UDim.new(1,0)})task.delay(0.18,function()if not self.hidden or self.destroyed then return end;self.main.Visible=false;self.main.GroupTransparency=0;self.topbar.GroupTransparency=0;self.body.GroupTransparency=0;o(self.collapsedFace,j.Hover,{GroupTransparency=0})end)local function d()if self.destroyed or not self.hidden then return end;self.collapsedShell.Position=b;self.collapsedShell.Size=a;self.collapsedInteract.Position=b;self.collapsedInteract.Size=a;self.collapsedInteract.Visible=true;self.collapsedShellCorner.CornerRadius=UDim.new(1,0)self.collapsedInteract.Active=true;self.animating=false end;if c then c.Completed:Once(d)else task.delay(0.4,d)end end;function B:Toggle()if self.hidden then self:Show()else self:Hide()end end;function B:_cleanup()if self.controls then for a,a in pairs(self.controls)do if type(a)=="table"and a._cleanup then pcall(a._cleanup,a)end end end;if self._notificationRecords then local a=table.clone(self._notificationRecords)table.clear(self._notificationRecords)if self._liveNotifications then table.clear(self._liveNotifications)end;for a,a in ipairs(a)do if a and a._destroyImmediately then pcall(a._destroyImmediately)end end end;for a,a in ipairs(self._connections)do pcall(a.Disconnect,a)end;table.clear(self._connections)end;function B:Destroy()if self.destroyed then return end;self.destroyed=true;self:_cleanup()o(self.main,j.Fast,{GroupTransparency=1})o(self.scale,j.Fast,{Scale=0.96})o(self.shadow,j.Fast,{Transparency=1})o(self.collapsedShell,j.Fast,{BackgroundTransparency=1})o(self.collapsedShellStroke,j.Fast,{Transparency=1})o(self.collapsedShellShadow,j.Fast,{Transparency=1})o(self.collapsedFace,j.Fast,{GroupTransparency=1})if self.collapsedInteract then self.collapsedInteract.Visible=false end;task.delay(0.17,function()if self.screen then self.screen:Destroy()end end)end;function g:CreateWindow(d)d=type(d)=="table"and d or{}local e=b(d,"name","Name")or"Aether";local g=b(d,"subtitle","Subtitle")or"";local v=b(d,"icon","Icon")if v==nil then v="globe"end;local x=b(d,"size","Size")local y=i.Width;local z=i.Height;if typeof(x)=="Vector2"then y=math.max(560,math.floor(x.X))z=math.max(350,math.floor(x.Y))elseif typeof(x)=="UDim2"then if x.X.Offset>0 then y=math.max(560,x.X.Offset)end;if x.Y.Offset>0 then z=math.max(350,x.Y.Offset)end end;local p=p(b(d,"theme","Theme"))local u=u(d)local multiple=b(d,"allowMultiple","AllowMultiple")==true;local screenName=multiple and ("AetherGen2_"..game:GetService("HttpService"):GenerateGUID(false)) or "AetherGen2";if not multiple then local old=u:FindFirstChild("AetherGen2")if old then old:Destroy()end end;local u=k("ScreenGui",{Name=screenName,Parent=u,ResetOnSpawn=false,IgnoreGuiInset=true,ZIndexBehavior=Enum.ZIndexBehavior.Global,DisplayOrder=1000})local x=k("Frame",{Parent=u,AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-20,1,-20),Size=UDim2.fromOffset(300,800),BackgroundTransparency=1,ZIndex=890})local x=k("Frame",{Parent=x,AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ZIndex=890})k("UIListLayout",{Parent=x,FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)})local A=k("CanvasGroup",{Parent=u,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset(y,z),BackgroundColor3=p.Window,BackgroundTransparency=0,ClipsDescendants=true,GroupTransparency=1,ZIndex=1})local C=l(A,18)local D=m(A,p.Stroke,0.6,1)local E=n(A,p.Shadow,20,1)k("UIGradient",{Parent=A,Rotation=90,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,p.Window2),ColorSequenceKeypoint.new(0.23,p.Window),ColorSequenceKeypoint.new(1,p.Window)})})local F=k("Frame",{Parent=A,Size=UDim2.fromScale(1,1),BackgroundTransparency=1,ClipsDescendants=true,ZIndex=2})l(F,18)local G=k("UIScale",{Parent=A,Scale=0.94})local H=k("CanvasGroup",{Parent=F,Size=UDim2.new(1,0,0,i.TopbarHeight),BackgroundTransparency=1,GroupTransparency=0,ZIndex=20})local I=k("Frame",{Parent=H,Name="DragArea",Size=UDim2.new(1,-i.ActionReserve,1,0),BackgroundTransparency=1,Active=true,ZIndex=21})local J=k("Frame",{Parent=H,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(26,26),BackgroundTransparency=1,ZIndex=22})local J=w(J,v,p.Secondary,24,e)J.AnchorPoint=Vector2.new(0.5,0.5)J.Position=UDim2.fromScale(0.5,0.5)local r=k("TextLabel",{Parent=H,Position=UDim2.fromOffset(58,g~=""and 11 or 21),Size=UDim2.new(1,-190,0,21),BackgroundTransparency=1,Text=e,TextColor3=p.Text,TextSize=18,FontFace=r,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,ZIndex=22})local g=k("TextLabel",{Parent=H,Position=UDim2.fromOffset(58,32),Size=UDim2.new(1,-190,0,16),BackgroundTransparency=1,Text=g,TextColor3=p.Secondary,TextTransparency=0.35,TextSize=13,FontFace=h,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,Visible=g~="",ZIndex=22})k("Frame",{Parent=F,Position=UDim2.fromOffset(0,i.TopbarHeight-1),Size=UDim2.new(1,0,0,1),BackgroundColor3=p.StrokeSoft,BackgroundTransparency=0.68,ZIndex=19})local J=k("Frame",{Parent=H,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-14,0.5,0),Size=UDim2.fromOffset(98,30),BackgroundTransparency=1,ZIndex=24})k("UIListLayout",{Parent=J,FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Right,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,5)})local function K(a)return k("TextButton",{Parent=J,Size=UDim2.fromOffset(28,28),BackgroundTransparency=1,Text="",TextTransparency=1,AutoButtonColor=false,LayoutOrder=a,ZIndex=25})end;local L=K(1)local N=k("Frame",{Parent=L,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(18,18),BackgroundTransparency=1})w(N,"search",p.Secondary,16,"S")local N=K(2)local t,O,P=t(N,p.Secondary)t.AnchorPoint=Vector2.new(0.5,0.5)t.Position=UDim2.fromScale(0.5,0.5)local t=K(3)local s,K,Q=s(t,p.Secondary)s.AnchorPoint=Vector2.new(0.5,0.5)s.Position=UDim2.fromScale(0.5,0.5)local s=k("Frame",{Parent=u,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0,45),Size=UDim2.fromOffset(185,50),BackgroundColor3=p.Window,BackgroundTransparency=1,ClipsDescendants=true,Active=true,Visible=false,ZIndex=200})local R=l(s,99)local S=m(s,p.Stroke,0.6,1)local T=n(s,p.Shadow,20,0.6)k("UIGradient",{Parent=s,Rotation=90,Color=ColorSequence.new({ColorSequenceKeypoint.new(0,p.Window2),ColorSequenceKeypoint.new(0.23,p.Window),ColorSequenceKeypoint.new(1,p.Window)})})local U=k("CanvasGroup",{Parent=s,Size=UDim2.fromScale(1,1),BackgroundTransparency=1,GroupTransparency=1,ZIndex=210})local V=k("Frame",{Parent=U,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,16,0.5,0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,ZIndex=211})local v=w(V,v,p.Text,24,e)v.AnchorPoint=Vector2.new(0.5,0.5)v.Position=UDim2.fromScale(0.5,0.5)local v=k("Frame",{Parent=U,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,50,0.5,0),Size=UDim2.new(1,-60,0,32),BackgroundTransparency=1,ZIndex=211})k("UIListLayout",{Parent=v,Padding=UDim.new(0,1),VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder})local e=k("TextLabel",{Parent=v,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,Text=e,TextColor3=p.Text,TextSize=16,FontFace=q,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=212})local v=k("TextLabel",{Parent=v,Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,Text="Tap to show",TextColor3=p.Text,TextTransparency=0.5,TextSize=14,FontFace=q,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,ZIndex=212})local w=k("TextButton",{Parent=u,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0,45),Size=UDim2.fromOffset(185,50),BackgroundTransparency=1,Text="",TextTransparency=1,AutoButtonColor=false,Active=true,Selectable=false,Visible=false,ZIndex=10000})local F=k("CanvasGroup",{Parent=F,Position=UDim2.fromOffset(0,i.TopbarHeight),Size=UDim2.new(1,0,1,-i.TopbarHeight),BackgroundTransparency=1,GroupTransparency=0,ZIndex=3})local V=k("Frame",{Parent=F,Size=UDim2.new(0,i.RailWidth,1,0),BackgroundColor3=p.Sidebar,BackgroundTransparency=0.28,ZIndex=3})l(V,18)k("Frame",{Parent=F,Position=UDim2.fromOffset(i.RailWidth-1,0),Size=UDim2.new(0,1,1,0),BackgroundColor3=p.StrokeSoft,BackgroundTransparency=0.68,ZIndex=4})local W=k("ScrollingFrame",{Parent=V,Active=true,Size=UDim2.new(1,0,1,-i.FooterHeight),BackgroundTransparency=1,CanvasSize=UDim2.new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,ZIndex=5})k("UIPadding",{Parent=W,PaddingTop=UDim.new(0,i.RailPadding),PaddingBottom=UDim.new(0,i.RailPadding)})k("UIListLayout",{Parent=W,FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,i.RowSpacing)})local X=k("Frame",{Parent=V,AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,1),Size=UDim2.new(1,0,0,i.FooterHeight),BackgroundTransparency=1,ZIndex=6})local Y=k("Frame",{Parent=X,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,i.RowInset,0.5,0),Size=UDim2.new(1,-i.RowInset*2,0,i.AvatarSize),BackgroundTransparency=1,ZIndex=7})local Z=k("ImageLabel",{Parent=Y,Size=UDim2.fromOffset(i.AvatarSize,i.AvatarSize),BackgroundColor3=p.Element,BackgroundTransparency=0,Image="",ScaleType=Enum.ScaleType.Crop,ZIndex=8})l(Z,99)k("TextLabel",{Parent=Y,Position=UDim2.fromOffset(i.AvatarSize+10,0),Size=UDim2.new(1,-(i.AvatarSize+10),1,0),BackgroundTransparency=1,Text=f and f.DisplayName or"Player",TextColor3=p.Text,TextTransparency=0.04,TextSize=16,FontFace=q,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=8})local i=k("Frame",{Parent=F,Position=UDim2.fromOffset(i.RailWidth,0),Size=UDim2.new(1,-i.RailWidth,1,0),BackgroundTransparency=1,ZIndex=3})local q=k("Frame",{Parent=H,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-118,0.5,0),Size=UDim2.fromOffset(220,32),BackgroundColor3=p.Element,BackgroundTransparency=1,Visible=false,ZIndex=30})l(q,12)local l=m(q,Color3.fromRGB(255,255,255),1,1)local m=n(q,Color3.fromRGB(255,255,255),20,1)local h=k("TextBox",{Parent=q,Position=UDim2.fromOffset(14,0),Size=UDim2.new(1,-28,1,0),BackgroundTransparency=1,Text="",PlaceholderText="Search this page",TextColor3=p.Text,PlaceholderColor3=p.Secondary,TextTransparency=1,TextSize=15,FontFace=h,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ZIndex=31})local e=setmetatable({screen=u,main=A,mainCorner=C,mainStroke=D,scale=G,topbar=H,dragArea=I,actionContainer=J,body=F,sidebar=V,tabList=W,pageHost=i,profile=X,avatar=Z,title=r,subtitle=g,searchPill=q,searchPillStroke=l,searchPillGlow=m,searchBox=h,searchButton=L,minimizeButton=N,closeButton=t,minimizeLine=O,minimizeVLine=P,closeA=K,closeB=Q,collapsedShell=s,collapsedShellCorner=R,collapsedShellStroke=S,collapsedShellShadow=T,collapsedFace=U,collapsedInteract=w,collapsedTitle=e,collapsedSubtitle=v,shadow=E,notificationList=x,theme=p,size=Vector2.new(y,z),tabs={},controls={},Flags={},selectedTab=nil,minimized=false,hidden=false,animating=false,destroyed=false,_restorePosition=nil,_collapsedPosition=nil,_openPopup=nil,_liveNotifications={},_notificationRecords={},_notificationCount=0,searchOpen=false,_connections={}},B)u.Destroying:Connect(function()e.destroyed=true;e:_cleanup()end)local g=b(d,"showProfile","ShowProfile")if g==false then X.Visible=false;W.Size=UDim2.new(1,0,1,0)end;M(e,t.MouseEnter:Connect(function()o(K,j.Hover,{BackgroundColor3=p.Danger})o(Q,j.Hover,{BackgroundColor3=p.Danger})end))M(e,t.MouseLeave:Connect(function()o(K,j.Hover,{BackgroundColor3=p.Secondary})o(Q,j.Hover,{BackgroundColor3=p.Secondary})end))M(e,N.MouseButton1Click:Connect(function()e:Minimize()end))M(e,t.MouseButton1Click:Connect(function()e:Hide()end))M(e,L.MouseButton1Click:Connect(function()e.searchOpen=not e.searchOpen;e:_updateDragArea()if e.searchOpen then q.Visible=true;q.BackgroundTransparency=1;l.Transparency=1;h.TextTransparency=1;o(q,j.Hover,{BackgroundTransparency=0.92})o(l,j.Hover,{Transparency=0.86})o(m,j.Hover,{Transparency=0.92})o(h,j.Hover,{TextTransparency=0.3})task.defer(function()if h.Parent then h:CaptureFocus()end end)else h:ReleaseFocus()h.Text="";e:_applySearch("")o(q,j.Fast,{BackgroundTransparency=1})o(l,j.Fast,{Transparency=1})o(m,j.Fast,{Transparency=1})o(h,j.Fast,{TextTransparency=1})task.delay(0.16,function()if q.Parent and not e.searchOpen then q.Visible=false end end)end end))M(e,h:GetPropertyChangedSignal("Text"):Connect(function()e:_applySearch(h.Text)end))local g=false;local h=Vector2.zero;local i=A.Position;M(e,H.InputBegan:Connect(function(a,b)if b then return end;if a.UserInputType~=Enum.UserInputType.MouseButton1 and a.UserInputType~=Enum.UserInputType.Touch then return end;local a=a.Position;local b=J.AbsolutePosition;local c=J.AbsoluteSize;if a.X>=b.X and a.X<=b.X+c.X and a.Y>=b.Y and a.Y<=b.Y+c.Y then return end;if q.Visible then local b=q.AbsolutePosition;local c=q.AbsoluteSize;if a.X>=b.X and a.X<=b.X+c.X and a.Y>=b.Y and a.Y<=b.Y+c.Y then return end end;g=true;h=Vector2.new(a.X,a.Y)i=A.Position end))M(e,c.InputChanged:Connect(function(a)if not g or e.destroyed or e.hidden or e.animating then return end;if a.UserInputType~=Enum.UserInputType.MouseMovement and a.UserInputType~=Enum.UserInputType.Touch then return end;local a=Vector2.new(a.Position.X,a.Position.Y)-h;A.Position=UDim2.new(i.X.Scale,i.X.Offset+a.X,i.Y.Scale,i.Y.Offset+a.Y)end))M(e,c.InputEnded:Connect(function(a)if a.UserInputType==Enum.UserInputType.MouseButton1 or a.UserInputType==Enum.UserInputType.Touch then g=false end end))M(e,c.WindowFocusReleased:Connect(function()g=false end))local g=false;local h=false;local i=Vector2.zero;local k=s.Position;M(e,w.InputBegan:Connect(function(a)if not e.hidden or e.animating then return end;if a.UserInputType~=Enum.UserInputType.MouseButton1 and a.UserInputType~=Enum.UserInputType.Touch then return end;g=true;h=false;i=Vector2.new(a.Position.X,a.Position.Y)k=s.Position end))M(e,c.InputChanged:Connect(function(a)if not g or not e.hidden or e.animating then return end;if a.UserInputType~=Enum.UserInputType.MouseMovement and a.UserInputType~=Enum.UserInputType.Touch then return end;local a=Vector2.new(a.Position.X,a.Position.Y)-i;if a.Magnitude>=5 then h=true end;if h then local a=UDim2.new(k.X.Scale,k.X.Offset+a.X,k.Y.Scale,k.Y.Offset+a.Y)s.Position=a;w.Position=a;e._collapsedPosition=a end end))M(e,c.InputEnded:Connect(function(a)if a.UserInputType~=Enum.UserInputType.MouseButton1 and a.UserInputType~=Enum.UserInputType.Touch then return end;if g then g=false;if not h and e.hidden and not e.animating then e:Show()end end end))M(e,w.MouseEnter:Connect(function()if e.hidden and not e.animating then o(S,j.Hover,{Transparency=0.38})o(T,j.Hover,{Transparency=0.48})end end))M(e,w.MouseLeave:Connect(function()o(S,j.Hover,{Transparency=0.6})o(T,j.Hover,{Transparency=0.6})end))M(e,c.InputBegan:Connect(function(a)if a.UserInputType~=Enum.UserInputType.MouseButton1 then return end;if not e._openPopup then return end;local b=e._openPopup.popup;local c=e._openPopup.field;local a=Vector2.new(a.Position.X,a.Position.Y)local function d(b)local c=b.AbsolutePosition;local b=b.AbsoluteSize;return a.X>=c.X and a.X<=c.X+b.X and a.Y>=c.Y and a.Y<=c.Y+b.Y end;if not d(b)and not d(c)then e:_closePopups()end end))if f then task.spawn(function()local a,b=pcall(function()return a:GetUserThumbnailAsync(f.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)end)if a and Z.Parent then Z.Image=b end end)end;local a=b(d,"toggleKeybind","ToggleKeybind")if typeof(a)=="EnumItem"and a.EnumType==Enum.KeyCode then M(e,c.InputBegan:Connect(function(b,c)if not c and b.KeyCode==a then e:Toggle()end end))end;A.Position=UDim2.new(0.5,0,0.5,10)o(A,j.Reveal,{GroupTransparency=0,Position=UDim2.new(0.5,0,0.5,0)})o(G,j.Reveal,{Scale=1})o(E,j.Reveal,{Transparency=0.6})self._lastWindow=e;return e end;function g:Notify(a)if self._lastWindow and not self._lastWindow.destroyed then return self._lastWindow:Notify(a)end;warn("Aether: create a window before calling Aether:Notify")return nil end;
g.Version = "0.7.0"

local HttpService = game:GetService("HttpService")

local function opt(cfg, ...)
    return b(cfg, ...)
end

local function register(tab, ctrl, flag, value)
    if flag then
        flag = Q(tab.window, flag, flag)
        ctrl.flag = flag
        tab.window.controls[flag] = ctrl
        tab.window.Flags[flag] = value
    end
    return tab:_addElement(ctrl)
end

local function makeFlag(tab, cfg, name)
    local key = opt(cfg, "flag", "Flag")
    if key == nil or key == "" then
        key = name:lower():gsub("[^%w]+", "_"):gsub("^_+", ""):gsub("_+$", "")
    end
    return tostring(key)
end

local function plainValues(values)
    local out = {}
    if type(values) == "table" then
        for _, v in ipairs(values) do
            out[#out + 1] = tostring(v)
        end
    end
    return out
end

local function fire(label, callback, ...)
    if type(callback) == "function" then N(label, callback, ...) end
end

local oldAddElement = C._addElement
local function decorate(ctrl)
    if ctrl._aetherDecorated then return ctrl end
    ctrl._aetherDecorated = true

    function ctrl:SetVisible(visible)
        self._hiddenByUser = visible == false
        self.window:_applySearch(self.window.searchBox.Text)
        return self
    end

    function ctrl:IsVisible()
        return not self._hiddenByUser and self.main.Visible
    end

    function ctrl:Destroy()
        if self._destroyed then return end
        self._destroyed = true
        if self._cleanup then self:_cleanup() end
        if self.SetOpen then self:SetOpen(false) end
        if self.popup then self.popup:Destroy() end
        if self.window._openPopup == self then self.window._openPopup = nil end
        if self.flag and self.window.controls[self.flag] == self then
            self.window.controls[self.flag] = nil
            self.window.Flags[self.flag] = nil
        end
        local items = self.tab.elements
        local index = table.find(items, self)
        if index then table.remove(items, index) end
        if self.main then self.main:Destroy() end
        self.window:_applySearch(self.window.searchBox.Text)
    end
end

function C:_addElement(ctrl)
    ctrl.window = ctrl.window or self.window
    ctrl.tab = ctrl.tab or self
    decorate(ctrl)
    return oldAddElement(self, ctrl)
end

local function searchItems(items, term)
    local any = false
    for _, ctrl in ipairs(items) do
        local visible
        if ctrl._group then
            local found = searchItems(ctrl.elements, term)
            visible = term == "" or found or ctrl.searchName:find(term, 1, true) ~= nil
            local expanded = visible and (ctrl.expanded or term ~= "")
            ctrl.content.AutomaticSize = expanded and Enum.AutomaticSize.Y or Enum.AutomaticSize.None
            ctrl.content.Size = UDim2.new(1, 0, 0, 0)
            ctrl.content.Visible = expanded
        else
            visible = term == "" or (not ctrl.isSection and (ctrl.searchName or ""):find(term, 1, true) ~= nil)
        end
        ctrl.main.Visible = visible and not ctrl._hiddenByUser
        any = any or ctrl.main.Visible
    end
    return any
end

function B:_applySearch(query)
    if not self.selectedTab then return end
    searchItems(self.selectedTab.elements, tostring(query or ""):lower())
end

function C:CreateSeparator(cfg)
    local title = type(cfg) == "string" and cfg or opt(cfg, "name", "Name", "text", "Text")
    local row = k("Frame", {
        Parent = self.page,
        Size = UDim2.new(1, -20, 0, title and 32 or 20),
        BackgroundTransparency = 1,
    })
    k("Frame", {
        Parent = row,
        Position = UDim2.new(0, 10, 0.5, 0),
        Size = UDim2.new(1, -20, 0, 1),
        BackgroundColor3 = self.window.theme.StrokeSoft,
        BackgroundTransparency = 0.35,
    })
    if title and title ~= "" then
        local label = k("TextLabel", {
            Parent = row,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 18, 0.5, 0),
            Size = UDim2.fromOffset(math.max(80, #title * 8 + 14), 24),
            BackgroundColor3 = self.window.theme.Window2,
            Text = tostring(title),
            TextColor3 = self.window.theme.Secondary,
            TextSize = 13,
            FontFace = q,
            TextXAlignment = Enum.TextXAlignment.Center,
        })
        l(label, 6)
    end
    local ctrl = { window = self.window, tab = self, main = row, name = tostring(title or "Separator"), searchName = "", isSection = true }
    return self:_addElement(ctrl)
end

function C:CreateSpacer(cfg)
    local height = type(cfg) == "number" and cfg or tonumber(opt(cfg, "height", "Height")) or 12
    local row = k("Frame", {
        Parent = self.page,
        Size = UDim2.new(1, -20, 0, math.clamp(height, 0, 500)),
        BackgroundTransparency = 1,
    })
    return self:_addElement({ window = self.window, tab = self, main = row, name = "Spacer", searchName = "", isSection = true })
end

function C:CreateGroup(cfg)
    cfg = type(cfg) == "string" and { name = cfg } or cfg or {}
    local name = tostring(opt(cfg, "name", "Name") or "Group")
    local theme = self.window.theme
    local outer = k("Frame", {
        Parent = self.page,
        Size = UDim2.new(1, -20, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = theme.Element,
    })
    l(outer, 12)
    m(outer, theme.Stroke, 0.15)
    k("UIListLayout", { Parent = outer, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 5) })

    local header = k("TextButton", {
        Parent = outer,
        Size = UDim2.new(1, 0, 0, 43),
        Text = name,
        TextColor3 = theme.Text,
        TextSize = 15,
        FontFace = r,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        AutoButtonColor = false,
        LayoutOrder = 1,
    })
    k("UIPadding", { Parent = header, PaddingLeft = UDim.new(0, 18), PaddingRight = UDim.new(0, 12) })
    local arrow = k("TextLabel", {
        Parent = header,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -14, 0.5, 0),
        Size = UDim2.fromOffset(20, 20),
        BackgroundTransparency = 1,
        Text = "⌄",
        TextColor3 = theme.Secondary,
        TextSize = 18,
        FontFace = q,
    })
    local content = k("Frame", {
        Parent = outer,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
    })
    k("UIListLayout", {
        Parent = content,
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 4),
    })
    k("UIPadding", { Parent = content, PaddingBottom = UDim.new(0, 9) })

    local group = {
        _group = true, window = self.window, tab = self, page = content,
        content = content, header = header, arrow = arrow, main = outer,
        elements = {}, name = name, searchName = name:lower(),
        expanded = opt(cfg, "expanded", "Expanded") ~= false,
    }
    setmetatable(group, { __index = C })

    function group:_addElement(ctrl)
        ctrl.window = ctrl.window or self.window
        ctrl.tab = self
        decorate(ctrl)
        table.insert(self.elements, ctrl)
        ctrl.main.LayoutOrder = #self.elements * 10
        if ctrl.flag and self.window._defaultFlags and self.window._defaultFlags[ctrl.flag] == nil then
            local value = ctrl.Get and ctrl:Get() or ctrl.value
            self.window._defaultFlags[ctrl.flag] = type(value) == "table" and table.clone(value) or value
        end
        if self.window.searchBox.Text ~= "" then
            self.window:_applySearch(self.window.searchBox.Text)
        end
        return ctrl
    end

    function group:SetExpanded(value)
        self.expanded = value == true
        self.arrow.Rotation = self.expanded and 0 or -90
        self.window:_applySearch(self.window.searchBox.Text)
        return self
    end

    function group:Toggle()
        return self:SetExpanded(not self.expanded)
    end

    function group:_cleanup()
        for idx = #self.elements, 1, -1 do
            local child = self.elements[idx]
            if child.Destroy then child:Destroy() end
        end
    end

    function group:SetName(value)
        self.name = tostring(value)
        self.searchName = self.name:lower()
        self.header.Text = self.name
        return self
    end

    M(self.window, header.MouseButton1Click:Connect(function() group:Toggle() end))
    self:_addElement(group)
    group:SetExpanded(group.expanded)
    return group
end

C.CreateGroupbox = C.CreateGroup
C.CreateCollapsible = C.CreateGroup

function C:CreateMultiDropdown(cfg)
    cfg = cfg or {}
    local base = O(self, 51, cfg, 210)
    local win = self.window
    local values = plainValues(opt(cfg, "values", "Values", "options", "Options") or {})
    local callback = opt(cfg, "callback", "Callback")
    local max = tonumber(opt(cfg, "maxSelections", "MaxSelections", "max", "Max"))
    local field = k("TextButton", {
        Parent = base.main,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -14, 0.5, 0),
        Size = UDim2.fromOffset(180, 31),
        BackgroundColor3 = win.theme.Field,
        BackgroundTransparency = 0.08,
        Text = "",
        AutoButtonColor = false,
        ZIndex = 12,
    })
    l(field, 9)
    m(field, win.theme.StrokeSoft, 0.42)
    local display = k("TextLabel", {
        Parent = field,
        Position = UDim2.fromOffset(10, 0),
        Size = UDim2.new(1, -36, 1, 0),
        BackgroundTransparency = 1,
        Text = "None",
        TextColor3 = win.theme.Text,
        TextSize = 14,
        FontFace = h,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 13,
    })
    k("TextLabel", {
        Parent = field,
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(18, 18),
        Text = "⌄",
        TextColor3 = win.theme.Secondary,
        TextSize = 16,
        FontFace = q,
        BackgroundTransparency = 1,
        ZIndex = 13,
    })
    local popup = k("Frame", {
        Parent = win.screen,
        Size = UDim2.fromOffset(190, 0),
        BackgroundColor3 = win.theme.Window2,
        ClipsDescendants = true,
        Visible = false,
        ZIndex = 500,
    })
    l(popup, 11)
    m(popup, win.theme.StrokeSoft, 0.25)
    local list = k("ScrollingFrame", {
        Parent = popup,
        Position = UDim2.fromOffset(5, 5),
        Size = UDim2.new(1, -10, 1, -10),
        BackgroundTransparency = 1,
        CanvasSize = UDim2.new(),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = win.theme.Accent,
        ZIndex = 501,
    })
    k("UIListLayout", { Parent = list, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 3) })

    local ctrl = {
        window = win, tab = self, main = base.main, title = base.title,
        name = base.name, searchName = base.searchName, popup = popup, field = field,
        display = display, list = list, values = values, value = {},
        callback = callback, maxSelections = max, open = false,
        _options = {}, _optionConnections = {},
    }

    function ctrl:_display()
        self.display.Text = #self.value == 0 and "None" or table.concat(self.value, ", ")
        for _, option in ipairs(self._options) do
            local selected = table.find(self.value, option.name) ~= nil
            option.label.Text = selected and "✓  " .. option.name or "     " .. option.name
            option.label.TextColor3 = selected and self.window.theme.AccentStroke or self.window.theme.Text
            option.label.FontFace = selected and r or h
        end
    end

    function ctrl:_rebuild()
        for _, conn in ipairs(self._optionConnections) do conn:Disconnect() end
        table.clear(self._optionConnections)
        for _, item in ipairs(self._options) do item.button:Destroy() end
        table.clear(self._options)
        for idx, name in ipairs(self.values) do
            local button = k("TextButton", {
                Parent = self.list,
                Size = UDim2.new(1, -4, 0, 30),
                BackgroundColor3 = self.window.theme.Element,
                BackgroundTransparency = 0.8,
                Text = "",
                AutoButtonColor = false,
                LayoutOrder = idx,
                ZIndex = 502,
            })
            l(button, 7)
            local label = k("TextLabel", {
                Parent = button,
                Position = UDim2.fromOffset(9, 0),
                Size = UDim2.new(1, -18, 1, 0),
                BackgroundTransparency = 1,
                Text = name,
                TextSize = 14,
                TextColor3 = self.window.theme.Text,
                TextXAlignment = Enum.TextXAlignment.Left,
                ZIndex = 503,
            })
            table.insert(self._options, { name = name, button = button, label = label })
            table.insert(self._optionConnections, button.MouseButton1Click:Connect(function()
                local nextValue = table.clone(self.value)
                local at = table.find(nextValue, name)
                if at then
                    table.remove(nextValue, at)
                elseif not self.maxSelections or #nextValue < self.maxSelections then
                    table.insert(nextValue, name)
                end
                self:Set(nextValue)
            end))
        end
        self:_display()
    end

    function ctrl:Set(value, silent)
        local wanted = {}
        if type(value) == "table" then
            for key, entry in pairs(value) do
                local name = type(key) == "number" and entry or (entry and key or nil)
                if name then wanted[tostring(name)] = true end
            end
        end
        local selected = {}
        for _, name in ipairs(self.values) do
            if wanted[name] and (not self.maxSelections or #selected < self.maxSelections) then
                selected[#selected + 1] = name
            end
        end
        self.value = selected
        self.window.Flags[self.flag] = table.clone(selected)
        self:_display()
        if not silent then fire("multi dropdown", self.callback, table.clone(selected)) end
        return table.clone(selected)
    end

    function ctrl:Get() return table.clone(self.value) end

    function ctrl:SetValues(newValues)
        self.values = plainValues(newValues)
        self:_rebuild()
        self:Set(self.value, true)
    end

    function ctrl:SetOpen(open)
        self.open = open == true
        if self.open then
            self.window:_closePopups(self)
            self.popup.Size = UDim2.fromOffset(190, math.min(226, #self.values * 33 + 10))
            self.popup.Visible = true
            self.window._openPopup = self
            self:_position()
            self._moveConn = d.RenderStepped:Connect(function() self:_position() end)
        else
            if self._moveConn then self._moveConn:Disconnect(); self._moveConn = nil end
            self.popup.Visible = false
            if self.window._openPopup == self then self.window._openPopup = nil end
        end
    end

    function ctrl:_position()
        local pos = self.field.AbsolutePosition
        local camera = workspace.CurrentCamera
        local screen = camera and camera.ViewportSize or Vector2.new(1920, 1080)
        local y = pos.Y + self.field.AbsoluteSize.Y + 6
        if y + self.popup.AbsoluteSize.Y > screen.Y then
            y = pos.Y - self.popup.AbsoluteSize.Y - 6
        end
        self.popup.Position = UDim2.fromOffset(math.clamp(pos.X, 0, math.max(0, screen.X - 190)), math.max(0, y))
    end

    function ctrl:SetName(name)
        self.name = tostring(name)
        self.searchName = self.name:lower()
        self.title.Text = self.name
    end

    function ctrl:_cleanup()
        self:SetOpen(false)
        for _, conn in ipairs(self._optionConnections) do conn:Disconnect() end
        table.clear(self._optionConnections)
    end

    ctrl:_rebuild()
    local original = opt(cfg, "value", "Value", "default", "Default") or {}
    local flag = makeFlag(self, cfg, base.name)
    register(self, ctrl, flag, {})
    ctrl:Set(original, true)
    if win._defaultFlags then win._defaultFlags[ctrl.flag] = ctrl:Get() end
    M(win, field.MouseButton1Click:Connect(function() ctrl:SetOpen(not ctrl.open) end))
    return ctrl
end

C.CreateMultiSelect = C.CreateMultiDropdown

function C:CreateTextArea(cfg)
    cfg = cfg or {}
    local win = self.window
    local base = O(self, math.max(100, tonumber(opt(cfg, "height", "Height")) or 128), cfg, 20)
    local callback = opt(cfg, "callback", "Callback")
    local text = tostring(opt(cfg, "value", "Value", "default", "Default") or "")
    local frame = k("Frame", {
        Parent = base.main,
        Position = UDim2.fromOffset(15, 38),
        Size = UDim2.new(1, -30, 1, -50),
        BackgroundColor3 = win.theme.Field,
        ZIndex = 5,
    })
    l(frame, 9)
    m(frame, win.theme.StrokeSoft, 0.42)
    local input = k("TextBox", {
        Parent = frame,
        Position = UDim2.fromOffset(9, 7),
        Size = UDim2.new(1, -18, 1, -14),
        BackgroundTransparency = 1,
        Text = text,
        PlaceholderText = tostring(opt(cfg, "placeholder", "Placeholder") or "Type here"),
        TextColor3 = win.theme.Text,
        PlaceholderColor3 = win.theme.Muted,
        TextSize = 14,
        FontFace = h,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        MultiLine = true,
        ClearTextOnFocus = opt(cfg, "clearOnFocus", "ClearOnFocus") == true,
        ZIndex = 6,
    })
    local ctrl = {
        window = win, tab = self, main = base.main, title = base.title,
        name = base.name, searchName = base.searchName, field = frame,
        box = input, value = text, callback = callback,
    }

    function ctrl:Set(value, silent, enterPressed)
        self.value = tostring(value or "")
        self.box.Text = self.value
        self.window.Flags[self.flag] = self.value
        if not silent then fire("text area", self.callback, self.value, enterPressed == true) end
        return self.value
    end

    function ctrl:Get() return self.value end
    function ctrl:SetName(name)
        self.name = tostring(name)
        self.searchName = self.name:lower()
        self.title.Text = self.name
    end

    register(self, ctrl, makeFlag(self, cfg, base.name), text)
    M(win, input.FocusLost:Connect(function(enterPressed) ctrl:Set(input.Text, false, enterPressed) end))
    return ctrl
end

C.CreateMultilineInput = C.CreateTextArea

function C:CreateProgressBar(cfg)
    cfg = cfg or {}
    local win = self.window
    local base = O(self, 65, cfg, 150)
    local min = tonumber(opt(cfg, "min", "Min")) or 0
    local max = tonumber(opt(cfg, "max", "Max")) or 100
    if max <= min then max = min + 1 end
    local initial = math.clamp(tonumber(opt(cfg, "value", "Value")) or min, min, max)
    local track = k("Frame", {
        Parent = base.main,
        Position = UDim2.new(0, 17, 1, -23),
        Size = UDim2.new(1, -34, 0, 9),
        BackgroundColor3 = win.theme.SliderBackground,
        ZIndex = 5,
    })
    l(track, 7)
    local fill = k("Frame", {
        Parent = track,
        Size = UDim2.fromScale((initial - min) / (max - min), 1),
        BackgroundColor3 = win.theme.Accent,
        ZIndex = 6,
    })
    l(fill, 7)
    local amount = k("TextLabel", {
        Parent = base.main,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -18, 0, 10),
        Size = UDim2.fromOffset(80, 22),
        TextColor3 = win.theme.Secondary,
        TextSize = 13,
        FontFace = q,
        TextXAlignment = Enum.TextXAlignment.Right,
        BackgroundTransparency = 1,
    })
    local ctrl = {
        window = win, tab = self, main = base.main, title = base.title,
        name = base.name, searchName = base.searchName, value = initial,
        minimum = min, maximum = max, fill = fill, valueLabel = amount,
        callback = opt(cfg, "callback", "Callback"),
    }
    function ctrl:Set(value, silent)
        self.value = math.clamp(tonumber(value) or self.minimum, self.minimum, self.maximum)
        local alpha = (self.value - self.minimum) / (self.maximum - self.minimum)
        o(self.fill, j.Hover, { Size = UDim2.fromScale(alpha, 1) })
        self.valueLabel.Text = string.format("%.0f%%", alpha * 100)
        self.window.Flags[self.flag] = self.value
        if not silent then fire("progress", self.callback, self.value) end
        return self.value
    end
    function ctrl:Get() return self.value end
    function ctrl:SetName(value)
        self.name = tostring(value)
        self.searchName = self.name:lower()
        self.title.Text = self.name
    end
    register(self, ctrl, makeFlag(self, cfg, base.name), initial)
    ctrl:Set(initial, true)
    return ctrl
end

function C:CreateImage(cfg)
    cfg = type(cfg) == "string" and { image = cfg } or cfg or {}
    local height = math.max(40, tonumber(opt(cfg, "height", "Height")) or 140)
    local theme = self.window.theme
    local row = k("Frame", {
        Parent = self.page,
        Size = UDim2.new(1, -20, 0, height),
        BackgroundColor3 = theme.Element,
    })
    l(row, 11)
    local img = k("ImageLabel", {
        Parent = row,
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Image = g.ResolveImage(opt(cfg, "image", "Image", "source", "Source")) or "",
        ScaleType = opt(cfg, "scaleType", "ScaleType") or Enum.ScaleType.Fit,
    })
    l(img, 11)
    local ctrl = {
        window = self.window, tab = self, main = row, image = img,
        name = tostring(opt(cfg, "name", "Name") or "Image"),
    }
    ctrl.searchName = ctrl.name:lower()
    function ctrl:Set(value)
        self.image.Image = g.ResolveImage(value) or ""
    end
    function ctrl:Get() return self.image.Image end
    function ctrl:SetName(name)
        self.name = tostring(name)
        self.searchName = self.name:lower()
    end
    return self:_addElement(ctrl)
end

local function configEncode(value, seen)
    local kind = typeof(value)
    if kind == "Color3" then
        return { __aetherType = "Color3", r = value.R, g = value.G, b = value.B }
    elseif kind == "EnumItem" then
        return { __aetherType = "EnumItem", enum = tostring(value.EnumType):match("[^.]+$") or "KeyCode", name = value.Name }
    elseif type(value) == "table" then
        if seen[value] then return nil end
        seen[value] = true
        local result = {}
        for key, v in pairs(value) do
            if type(key) == "string" or type(key) == "number" then
                result[key] = configEncode(v, seen)
            end
        end
        seen[value] = nil
        return result
    elseif kind == "string" or kind == "number" or kind == "boolean" then
        return value
    end
    return nil
end

local function configDecode(value)
    if type(value) ~= "table" then return value end
    if value.__aetherType == "Color3" then
        return Color3.new(tonumber(value.r) or 0, tonumber(value.g) or 0, tonumber(value.b) or 0)
    elseif value.__aetherType == "EnumItem" then
        local ok, item = pcall(function() return Enum[value.enum][value.name] end)
        return ok and item or nil
    end
    local result = {}
    for key, v in pairs(value) do result[key] = configDecode(v) end
    return result
end

function B:ExportConfig()
    return HttpService:JSONEncode(configEncode(self.Flags, {}))
end

function B:ImportConfig(json, silent)
    local ok, values = pcall(HttpService.JSONDecode, HttpService, json)
    if not ok or type(values) ~= "table" then return false, "Invalid config JSON" end
    self:SetFlags(configDecode(values), silent)
    return true
end

function B:GetFlags()
    local out = {}
    for key, value in pairs(self.Flags) do
        out[key] = type(value) == "table" and table.clone(value) or value
    end
    return out
end

function B:SetFlags(values, silent)
    if type(values) ~= "table" then return false end
    for key, value in pairs(values) do
        local ctrl = self.controls[key]
        if ctrl and ctrl.Set then ctrl:Set(value, silent == true)
        else self.Flags[key] = value end
    end
    return true
end

function B:ResetFlags(silent)
    for key, value in pairs(self._defaultFlags or {}) do
        local ctrl = self.controls[key]
        local val = type(value) == "table" and table.clone(value) or value
        if ctrl and ctrl.Set then ctrl:Set(val, silent == true)
        else self.Flags[key] = val end
    end
end

function B:GetControl(flag)
    return self.controls[flag]
end

function B:GetTab(name)
    for _, tab in ipairs(self.tabs) do
        if tab == name or tab.name == name then return tab end
    end
end

function B:SelectTab(name)
    local tab = self:GetTab(name)
    if tab then tab:Select() end
    return tab
end

function B:SetTitle(value)
    self.title.Text = tostring(value)
    return self
end

function B:SetSubtitle(value)
    self.subtitle.Text = tostring(value)
    return self
end

function B:SetSearch(text)
    self.searchBox.Text = tostring(text or "")
    self:_applySearch(self.searchBox.Text)
    return self
end

function B:SetSize(size)
    local kind = typeof(size)
    if kind == "UDim2" then size = Vector2.new(size.X.Offset, size.Y.Offset) end
    if typeof(size) ~= "Vector2" then return self end
    self.size = Vector2.new(math.max(560, size.X), math.max(350, size.Y))
    if not self.hidden then
        self.main.Size = UDim2.fromOffset(self.size.X, self.minimized and i.TopbarHeight or self.size.Y)
    end
    return self
end

function C:SetName(value)
    self.name = tostring(value)
    self.selectorTitle.Text = self.name
    return self
end

function C:Destroy()
    local win = self.window
    if win.selectedTab == self then
        win.selectedTab = nil
    end
    for idx = #self.elements, 1, -1 do
        local ctrl = self.elements[idx]
        if ctrl.Destroy then ctrl:Destroy() end
    end
    if self.selector then self.selector:Destroy() end
    if self.page then self.page:Destroy() end
    local index = table.find(win.tabs, self)
    if index then table.remove(win.tabs, index) end
    if not win.selectedTab and win.tabs[1] then win.tabs[1]:Select() end
end

local oldCreateTab = B.CreateTab
function B:CreateTab(cfg)
    local tab = oldCreateTab(self, cfg)
    return tab
end

B.CreatePage = B.CreateTab

-- Familiar names are aliases, not emulations of third-party libraries.
C.AddSection = C.CreateSection
C.AddToggle = C.CreateToggle
C.AddButton = C.CreateButton
C.AddSlider = C.CreateSlider
C.AddDropdown = C.CreateDropdown
C.AddColorPicker = C.CreateColorPicker
C.AddKeybind = C.CreateKeybind
C.AddInput = C.CreateInput
C.AddTextbox = C.CreateTextbox
C.AddLabel = C.CreateLabel
C.AddParagraph = C.CreateParagraph
C.AddMultiDropdown = C.CreateMultiDropdown
C.AddTextArea = C.CreateTextArea
C.AddGroup = C.CreateGroup
C.AddProgressBar = C.CreateProgressBar
C.AddSeparator = C.CreateSeparator
C.AddSpacer = C.CreateSpacer
C.AddImage = C.CreateImage
C.AddRadio = C.CreateRadioGroup
C.CreateCheckbox = C.CreateToggle
C.CreateSwitch = C.CreateToggle


function C:CreateRadioGroup(cfg)
    cfg = cfg or {}
    local win = self.window
    local values = plainValues(opt(cfg, "values", "Values", "options", "Options") or {})
    local horizontal = #values <= 3
    local height = horizontal and 91 or (47 + #values * 34)
    local base = O(self, height, cfg, 20)
    local callback = opt(cfg, "callback", "Callback")
    local choices = k("Frame", {
        Parent = base.main,
        Position = UDim2.fromOffset(14, 38),
        Size = UDim2.new(1, -28, 0, horizontal and 39 or #values * 34),
        BackgroundTransparency = 1,
    })
    k("UIListLayout", {
        Parent = choices,
        FillDirection = horizontal and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical,
        Padding = UDim.new(0, 5),
    })

    local ctrl = {
        window = win, tab = self, main = base.main, title = base.title,
        name = base.name, searchName = base.searchName, values = values,
        value = opt(cfg, "value", "Value", "default", "Default") or values[1],
        callback = callback, _buttons = {}, _connections = {},
    }

    function ctrl:_render()
        for _, item in ipairs(self._buttons) do
            local selected = item.name == self.value
            item.button.BackgroundColor3 = selected and self.window.theme.Accent or self.window.theme.Field
            item.button.BackgroundTransparency = selected and 0.7 or 0
            item.button.TextColor3 = selected and self.window.theme.Text or self.window.theme.Secondary
        end
    end

    function ctrl:_rebuild()
        for _, conn in ipairs(self._connections) do conn:Disconnect() end
        table.clear(self._connections)
        for _, item in ipairs(self._buttons) do item.button:Destroy() end
        table.clear(self._buttons)
        local newHorizontal = #self.values <= 3
        choices:FindFirstChildOfClass("UIListLayout").FillDirection = newHorizontal and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical
        self.main.Size = UDim2.new(1, -20, 0, newHorizontal and 91 or 47 + #self.values * 34)
        choices.Size = UDim2.new(1, -28, 0, newHorizontal and 39 or #self.values * 34)
        for idx, name in ipairs(self.values) do
            local button = k("TextButton", {
                Parent = choices,
                Size = newHorizontal and UDim2.new(1 / math.max(#self.values, 1), -4, 0, 35) or UDim2.new(1, 0, 0, 29),
                BackgroundColor3 = win.theme.Field,
                Text = name,
                TextColor3 = win.theme.Secondary,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextSize = 14,
                FontFace = q,
                LayoutOrder = idx,
                AutoButtonColor = false,
                ZIndex = 6,
            })
            l(button, 8)
            table.insert(self._buttons, { name = name, button = button })
            table.insert(self._connections, button.MouseButton1Click:Connect(function() self:Set(name) end))
        end
        self:_render()
    end

    function ctrl:Set(value, silent)
        if not table.find(self.values, value) then return self.value end
        self.value = value
        self.window.Flags[self.flag] = value
        self:_render()
        if not silent then fire("radio group", self.callback, value) end
        return value
    end

    function ctrl:Get() return self.value end
    function ctrl:SetValues(newValues)
        self.values = plainValues(newValues)
        if not table.find(self.values, self.value) then self.value = self.values[1] end
        self:_rebuild()
        self.window.Flags[self.flag] = self.value
    end
    function ctrl:SetName(name)
        self.name = tostring(name)
        self.searchName = self.name:lower()
        self.title.Text = self.name
    end
    function ctrl:_cleanup()
        for _, conn in ipairs(self._connections) do conn:Disconnect() end
        table.clear(self._connections)
    end

    if not table.find(ctrl.values, ctrl.value) then ctrl.value = ctrl.values[1] end
    register(self, ctrl, makeFlag(self, cfg, base.name), ctrl.value)
    ctrl:_rebuild()
    return ctrl
end

C.CreateRadio = C.CreateRadioGroup
C.AddRadioGroup = C.CreateRadioGroup

function B:Confirm(cfg)
    cfg = cfg or {}
    if self.destroyed then return nil end
    local callback = opt(cfg, "callback", "Callback", "onConfirm", "OnConfirm")
    local cancel = opt(cfg, "onCancel", "OnCancel")
    local width = math.clamp(tonumber(opt(cfg, "width", "Width")) or 420, 300, 600)
    local veil = k("TextButton", {
        Parent = self.screen,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 0.35,
        Text = "",
        AutoButtonColor = false,
        ZIndex = 700,
    })
    local panel = k("Frame", {
        Parent = veil,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(width, 200),
        BackgroundColor3 = self.theme.Window2,
        ZIndex = 701,
    })
    l(panel, 16)
    m(panel, self.theme.StrokeSoft, 0.3)
    k("TextLabel", {
        Parent = panel,
        Position = UDim2.fromOffset(20, 14),
        Size = UDim2.new(1, -40, 0, 28),
        BackgroundTransparency = 1,
        Text = tostring(opt(cfg, "title", "Title") or "Confirm"),
        TextColor3 = self.theme.Text,
        TextSize = 19,
        FontFace = r,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 702,
    })
    k("TextLabel", {
        Parent = panel,
        Position = UDim2.fromOffset(20, 50),
        Size = UDim2.new(1, -40, 0, 75),
        BackgroundTransparency = 1,
        Text = tostring(opt(cfg, "description", "Description", "text", "Text") or "Are you sure?"),
        TextColor3 = self.theme.Secondary,
        TextSize = 15,
        FontFace = h,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        ZIndex = 702,
    })
    local accept = k("TextButton", {
        Parent = panel,
        Position = UDim2.new(0.5, 4, 1, -56),
        Size = UDim2.new(0.5, -24, 0, 38),
        BackgroundColor3 = self.theme.Accent,
        Text = tostring(opt(cfg, "confirmText", "ConfirmText") or "Confirm"),
        TextColor3 = self.theme.Text,
        TextSize = 15,
        FontFace = q,
        ZIndex = 702,
    })
    l(accept, 9)
    local decline = k("TextButton", {
        Parent = panel,
        Position = UDim2.new(0, 20, 1, -56),
        Size = UDim2.new(0.5, -24, 0, 38),
        BackgroundColor3 = self.theme.Element2,
        Text = tostring(opt(cfg, "cancelText", "CancelText") or "Cancel"),
        TextColor3 = self.theme.Text,
        TextSize = 15,
        FontFace = q,
        ZIndex = 702,
    })
    l(decline, 9)
    local dialog = { Instance = veil, _closed = false }
    function dialog:Close()
        if self._closed then return end
        self._closed = true
        veil:Destroy()
    end
    M(self, accept.MouseButton1Click:Connect(function()
        if dialog._closed then return end
        dialog:Close()
        fire("confirm", callback)
    end))
    M(self, decline.MouseButton1Click:Connect(function()
        if dialog._closed then return end
        dialog:Close()
        fire("cancel", cancel)
    end))
    return dialog
end

B.CreateDialog = B.Confirm

local previousWindow = g.CreateWindow
function g:CreateWindow(cfg)
    cfg = cfg or {}
    local win = previousWindow(self, cfg)
    win._defaultFlags = {}
    return win
end

local oldRegister = C._addElement
function C:_addElement(ctrl)
    local item = oldRegister(self, ctrl)
    if item.flag and self.window._defaultFlags and self.window._defaultFlags[item.flag] == nil then
        local v = item.Get and item:Get() or item.value
        self.window._defaultFlags[item.flag] = type(v) == "table" and table.clone(v) or v
    end
    return item
end

return g
