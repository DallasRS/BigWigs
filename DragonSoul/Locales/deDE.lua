﻿local L = BigWigs:NewBossLocale("Morchok", "deDE")
if not L then return end
if L then
	L.engage_trigger = "Ihr versucht, eine Lawine aufzuhalten. Ich werde Euch begraben."

	L.crush = "Rüstung zerschmettern"
	L.crush_desc = "Nur für Tanks. Zählt die Stapel von Rüstung zerschmettern und zeigt eine Timerleiste an."
	L.crush_message = "%2$dx Rüstung zerschmettern auf %1$s"

	L.blood = "Blut"

	L.explosion = "Explosion"
end

L = BigWigs:NewBossLocale("Warlord Zon'ozz", "deDE")
if L then
	L.engage_trigger = "Zzof Shuul'wah. Thoq fssh N'Zoth!"

	L.ball = "Leere der Apokalypse"
	L.ball_desc = "Leere der Apokalypse, welche von den Spielern und abprallt und den Boss schwächt."

	L.bounce = "Abprallen der Leerenkugel"
	L.bounce_desc = "Zählt, wie häufig die Leerenkugel abprallt."

	L.darkness = "Tentakel Disco Party!"
	L.darkness_desc = "Diese Phase beginnt, sobald die Leerenkugel auf den Boss trifft."

	L.shadows = "Schatten"
end

L = BigWigs:NewBossLocale("Yor'sahj the Unsleeping", "deDE")
if L then
	L.engage_trigger = "Iilth qi'uothk shn'ma yeh'glu Shath'Yar! H'IWN IILTH!"

	L.bolt_desc = "Nur für Tanks. Zählt die Stapel von Leerenblitz und zeigt eine Timerleiste an."
	L.bolt_message = "%2$dx Blitz auf %1$s"

	L.blue = "|cFF0080FFBlau|r"
	L.green = "|cFF088A08Grünn|r"
	L.purple = "|cFF9932CDViolett|r"
	L.yellow = "|cFFFFA901Gelb|r"
	L.black = "|cFF424242Schwarz|r"
	L.red = "|cFFFF0404Rot|r"

	L.blobs = "Kugeln"
	L.blobs_bar = "Nächste Kugeln"
	L.blobs_desc = "Die Kugeln spawnen und bewegen sich auf den Boss zu"
end

L = BigWigs:NewBossLocale("Hagara the Stormbinder", "deDE")
if L then
	L.engage_trigger = "Ihr legt euch mit der Sturmbinderin an! Ich werde euch alle vernichten."

	L.lightning_or_frost = "Blitz oder Frost"
	L.ice_next = "Eisphase"
	L.lightning_next = "Blitzphase"

	L.assault_desc = "Nur für Tanks. "..select(2, EJ_GetSectionInfo(4159))

	L.nextphase = "Nächste Phase"
	L.nextphase_desc = "Warnungen für die nächste Phase"
end

L = BigWigs:NewBossLocale("Ultraxion", "deDE")
if L then
	L.engage_trigger = "Jetzt ist die Stunde des Zwielichts!"

	L.warmup = "Warmup"
	L.warmup_desc = "Zeit bis zum Starten des Bosskampfes."
	L.warmup_trigger = "Ich bin der Anfang des Endes, der Schatten, der die Sonne verdunkelt"

	L.crystal = "Buff-Kristalle"
	L.crystal_desc = "Zeigt Timer für die verschiedenen Buff-Kristalle der NPCs an."
	L.crystal_red = "Roter Kristall"
	L.crystal_green = "Grüner Kristall"
	L.crystal_blue = "Blauer Kristall"

	L.twilight = "Zwielicht"
	L.cast = "Zwielicht Zauberleiste"
	L.cast_desc = "Zeigt eine 5 (Normal) oder 3 (Heroisch) sekündige Leiste, wenn Stunde des Zwielichts gewirkt wird."

	L.lightself = "Schwindendes Licht auf Dir"
	L.lightself_desc = "Zeigt eine Leiste mit der verbleibenden Zeit, bis schwindendes Licht Dich explodieren lässt."
	L.lightself_bar = "<Du Explodierst>"

	L.lighttank = "Schwindendes Licht auf Tanks"
	L.lighttank_desc = "Nur für Tanks. Wenn ein Tank von schwindendem Licht betroffen ist, werden eine Timerleiste sowie Flash & Shake für die Explosion angezeigt."
	L.lighttank_bar = "<%s Explodiert>"
	L.lighttank_message = "Explodierender Tank"
end

L = BigWigs:NewBossLocale("Warmaster Blackhorn", "deDE")
if L then
	L.harpooning = "Harpune"

	L.rush = "Klingenansturm"

	L.sunder = "Rüstung zerreißen"
	L.sunder_desc = "Nur für Tanks. Zählt die Stapel von Rüstung zerreißen und zeigt eine Timerleiste an."
	L.sunder_message = "%2$dx Rüstung zerreißen auf %1$s"

	L.sapper_trigger = "Ein Drache stürzt herab, um einen Zwielichtpionier auf dem Deck abzusetzen!"
	L.sapper = "Pionier"
	L.sapper_desc = "Der Pionier (Schurke) spawnt und fügt dem Schiff Schaden zu."

	L.stage2_trigger = "Scheint, als ob ich mich selbst drum kümmern muss. Gut!"
end

L = BigWigs:NewBossLocale("Spine of Deathwing", "deDE")
if L then
	L.left_start = "gleich nach links rollen"
	L.right_start = "gleich nach rechts rollen"
	L.left = "rollt nach links"
	L.right = "rollt nach rechts"
	L.not_hooked = "DU bist >NICHT< befestigt!"
	L.roll_message = "Er rollt, rollt, rollt!"
	L.level_trigger = "stabilisiert sich"
	L.level_message = "Wieder ausgeglichen!"

	L.exposed = "Rüstung freigelegt"
end

L = BigWigs:NewBossLocale("Madness of Deathwing", "deDE")
if L then
	L.engage_trigger = "Ihr habt NICHTS erreicht. Ich werde Eure Welt in STÜCKE reißen."

	L.impale_desc = "Nur für Tanks. "..select(2,EJ_GetSectionInfo(4114))

	L.bolt_explode = "<Blitz Explodiert>"
end

