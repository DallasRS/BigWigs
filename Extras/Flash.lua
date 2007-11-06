﻿assert(BigWigs, "BigWigs not found!")

----------------------------
--      Localization      --
----------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsFlashNShake")
local display = nil
local flash = nil
local shaker = nil
local shakeOnUpdate -- defined later on
local shaking = nil
local oldpoints = nil
local SHAKE_DURATION = 0.4
local SHAKE_X = 10
local SHAKE_Y = 10

L:RegisterTranslations("enUS", function() return {
	["FlashNShake"] = true,
	["Flash'N'Shake"] = true,
	["Shake and/or Flash the screen blue when something important happens that directly affects you."] = true,
	
	["Flash"] = true,
	["Toggle Flash on or off."] = true,
	
	["Shake"] = true,
	["Toggle Shake on or off."] = true,

	["Test"] = true,
	["Perform a Flash test."] = true,
} end)

L:RegisterTranslations("koKR", function() return {
	["Flash"] = "번쩍임",
	["Toggle Flash on or off."] = "번쩍임을 켜거나 끕니다.",

	["Test"] = "테스트",
	["Perform a Flash test."] = "번쩍임 테스트를 실행합니다.",
} end)

L:RegisterTranslations("frFR", function() return {
	["Flash"] = "Flash",
	["Toggle Flash on or off."] = "Fais flasher ou non l'écran.",

	["Test"] = "Test",
	["Perform a Flash test."] = "Effectue un test du flash.",
} end)

L:RegisterTranslations("zhCN", function() return {
	["Flash"] = "屏幕闪烁通知",
	["Toggle Flash on or off."] = "启用或禁用屏幕闪烁通知。",

	["Test"] = "测试",
	["Perform a Flash test."] = "进行屏幕闪烁通知测试。",
} end)
----------------------------------
--      Module Declaration      --
----------------------------------

local mod = BigWigs:NewModule("Flash")
mod.revision = tonumber(("$Revision$"):sub(12, -3))
mod.defaultDB = {
	flash = false,
	shake = false,
}
mod.external = true
mod.consoleCmd = L["FlashNShake"]
mod.consoleOptions = {
	type = "group",
	name = L["Flash'N'Shake"],
	desc = L["Shake and/or Flash the screen blue when something important happens that directly affects you."],
	args = {
		[L["Flash"]] = {
			type = "toggle",
			name = L["Flash"],
			desc = L["Toggle Flash on or off."],
			get = function() return mod.db.profile.flash end,
			set = function(v)
				mod.db.profile.flash = v
			end,
		},
		[L["Shake"]] = {
			type = "toggle",
			name = L["Shake"],
			desc = L["Toggle Shake on or off."],
			get = function() return mod.db.profile.shake end,
			set = function(v)
				mod.db.profile.shake = v
			end,
		},		
		[L["Test"]] = {
			type = "execute",
			name = L["Test"],
			desc = L["Perform a Flash test."],
			handler = mod,
			func = "BigWigs_Test",
		},
	}
}

------------------------------
--      Initialization      --
------------------------------

function mod:OnEnable()
	self:RegisterEvent("BigWigs_Message")
end

------------------------------
--      Event Handlers      --
------------------------------

function mod:BigWigs_Message(msg, color)
	if color and color == "Personal" then
		if self.db.profile.flash then
			if not display then --frame creation
				display = CreateFrame("Frame", "BWFlash", UIParent)
				flash = UIFrameFlash
				display:SetFrameStrata("BACKGROUND")
				display:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",})
				display:SetBackdropColor(0,0,1,0.55)
				display:SetPoint("CENTER", UIPARENT, "CENTER")
				display:SetWidth(2000)
				display:SetHeight(2000)
				display:Hide()
			end
	
			flash(BWFlash, 0.2, 0.2, 0.8, false)
		end
		if self.db.profile.shake then
			if not shaker then
				shaker = CreateFrame("Frame", "BWSHaker", UIParent)
				shaker:Hide()
				shaker:SetScript("OnUpdate", shakeOnUpdate )
			end
			self:StartShake()
		end
	end
end

function mod:BigWigs_Test()
	self:TriggerEvent("BigWigs_Message", L["Test"], "Personal", true)
end

-----------------
-- shaking innards
-----------------

function mod:StartShake()
	if not shaking then
		-- store old worldframe positions, we need them all, people have frame modifiers for it etc.
		local nrpoints = WorldFrame:GetNumPoints()
		if not oldpoints then oldpoints = { points = {} } end -- initialize if we don't have it yet
		oldpoints.nrpoints = nrpoints
		for i=1,nrpoints do
			oldpoints.points[i] = oldpoints.points[i] or {}  -- recycle or initialize
			local point = oldpoints.points[i]
			point.point, point.rframe, point.rpoint, point.xoff, point.yoff = WorldFrame:GetPoint(i)
		end
		shaking = SHAKE_DURATION -- don't think we want to make this a setting.
		shaker:Show()
	end
end

function shakeOnUpdate( frame, elapsed )

	shaking = shaking - elapsed
	local xoff,yoff = 0,0
	if shaking <= 0 then -- stop shaking
		shaking = nil
		shaker:Hide()
	else
		xoff = math.random(-SHAKE_X,SHAKE_X)
		yoff = math.random(-SHAKE_Y,SHAKE_Y)
	end
	WorldFrame:ClearAllPoints()
	for i, point in pairs( oldpoints.points ) do
		WorldFrame:SetPoint( point.point, point.rframe, point.rpoint, point.xoff + xoff, point.yoff + yoff )
	end
end
