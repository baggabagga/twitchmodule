local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local vocation = {}
local playerDestX = 142;
local playerDestY = 383;
local playerDestZ = 7;

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local function greetCallback(cid)
	local player = Player(cid)
	local level = player:getLevel()
	if level < 800 then
		npcHandler:say("CHILD! COME BACK WHEN YOU HAVE GROWN UP!", cid)
		return false
	end
	return true
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	local vocationId = player:getVocation():getId()
	local vocationNames = {
		[1] = "guardian",
		[2] = "warrior",
		[3] = "rogue",
		[4] = "ranger",
		[5] = "hunter",
		[6] = "mage",
		[7] = "ritualist",
		[8] = "mender",
		[9] = "sentinel",
		[10] = "juggernaut",
		[11] = "templar",
		[12] = "avenger",
		[13] = "challenger",
		[14] = "vanguard",
		[15] = "assassin",
		[16] = "wayfarer",
		[17] = "corsair",
		[18] = "sharpshooter",
		[19] = "artillerist",
		[20] = "strider",
		[21] = "wrangler",
		[22] = "trapper",
		[23] = "beastslayer",
		[24] = "wizard",
		[25] = "sorcerer",
		[26] = "elementalist",
		[27] = "necromancer",
		[28] = "plaguedoctor",
		[29] = "shaman",
		[30] = "cleric",
		[31] = "druid",
		[32] = "priest",
		[33] = "placeholder1",
		[34] = "placeholder2"
	}

	if msgcontains(msg, "spec") and npcHandler.topic[cid] == 0 then
		if vocationId < 9 then
			npcHandler:say('Are you ready to face your destiny ' .. vocationNames[vocationId] .. '?', cid)
		else
			npcHandler:say("Do you wish to change specialization?", cid)
		end
		npcHandler.topic[cid] = 1
	elseif npcHandler.topic[cid] == 1 then
		if msgcontains(msg, "yes") then
			if vocationId < 9 then
				npcHandler:say('Which specialization do you wish to pursue: {' .. string.upper(vocationNames[3 * vocationId + 6]) .. '}, {' .. string.upper(vocationNames[3 * vocationId + 7]) .. '} OR {' .. string.upper(vocationNames[3 * vocationId + 8]) .. '}?', cid)
			elseif table.contains({9, 12, 15, 18, 21, 24, 27, 30}, vocationId) then
				npcHandler:say('Which specialization do you wish to pursue: {' .. string.upper(vocationNames[vocationId + 1]) .. '} OR {' .. string.upper(vocationNames[vocationId + 2]) .. '}?', cid)
			elseif table.contains({10, 13, 16, 19, 22, 25, 28, 31}, vocationId) then
				npcHandler:say('Which specialization do you wish to pursue: {' .. string.upper(vocationNames[vocationId - 1]) .. '} OR {' .. string.upper(vocationNames[vocationId + 1]) .. '}?', cid)
			elseif table.contains({11, 14, 17, 20, 23, 26, 29, 32}, vocationId) then
				npcHandler:say('Which specialization do you wish to pursue: {' .. string.upper(vocationNames[vocationId - 2]) .. '} OR {' .. string.upper(vocationNames[vocationId - 1]) .. '}?', cid)
			end
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("Hmm.", cid)
		end
	elseif npcHandler.topic[cid] == 2 then
		if vocationId < 9 then
			if msgcontains(msg, vocationNames[3 * vocationId + 6]) then
				npcHandler:say(''.. string.upper(vocationNames[3 * vocationId + 6]) .. '! ARE YOU SURE?', cid)
				npcHandler.topic[cid] = 3
				vocation[cid] = 3 * vocationId + 6
			elseif msgcontains(msg, vocationNames[3 * vocationId + 7]) then
				npcHandler:say(''.. string.upper(vocationNames[3 * vocationId + 7]) .. '! ARE YOU SURE?', cid)
				npcHandler.topic[cid] = 3
				vocation[cid] = 3 * vocationId + 7
			elseif msgcontains(msg, vocationNames[3 * vocationId + 8]) then
				npcHandler:say(''.. string.upper(vocationNames[3 * vocationId + 8]) .. '! ARE YOU SURE?', cid)
				npcHandler.topic[cid] = 3
				vocation[cid] = 3 * vocationId + 8
			else
				for k,v in pairs(vocationNames) do
					if msgcontains(msg, v) then
						npcHandler:say("You can't pursue that specialization.", cid)
						return true
					end
				end
				npcHandler:say("Not a valid specialization. What specialization did you want to pursue again?", cid)			
			end
		elseif msgcontains(msg, vocationNames[vocationId + 1]) and table.contains({9, 10, 12, 13, 15, 16, 18, 19, 21, 22, 24, 25, 27, 28, 30, 31}, vocationId) then
			npcHandler:say(''.. string.upper(vocationNames[vocationId + 1]) .. '! ARE YOU SURE?', cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = vocationId + 1
		elseif msgcontains(msg, vocationNames[vocationId + 2]) and table.contains({9, 12, 15, 18, 21, 24, 27, 30}, vocationId) then
			npcHandler:say(''.. string.upper(vocationNames[vocationId + 2]) .. '! ARE YOU SURE?', cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = vocationId + 2
		elseif msgcontains(msg, vocationNames[vocationId - 1]) and table.contains({10, 11, 13, 14, 16, 17, 19, 20, 22, 23, 25, 26, 28, 29, 31, 32}, vocationId) then
			npcHandler:say(''.. string.upper(vocationNames[vocationId - 1]) .. '! ARE YOU SURE?', cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = vocationId - 1
		elseif msgcontains(msg, vocationNames[vocationId - 2]) and table.contains({11, 14, 17, 20, 23, 26, 29, 32}, vocationId) then
			npcHandler:say(''.. string.upper(vocationNames[vocationId - 2]) .. '! ARE YOU SURE?', cid)
			npcHandler.topic[cid] = 3
			vocation[cid] = vocationId - 2
		else
			for k,v in pairs(vocationNames) do
				if msgcontains(msg, v) then
					npcHandler:say("You can't pursue that specialization.", cid)
					return true
				end
			end
			npcHandler:say("Not a valid specialization. What specialization did you want to pursue again?", cid)			
		end
	elseif npcHandler.topic[cid] == 3 then
		if msgcontains(msg, "yes") then
			npcHandler:say("SO BE IT!", cid)
			local areaME = {
				[1] = Position(playerDestX, 	playerDestY, 		playerDestZ),
				[2] = Position(playerDestX - 1, playerDestY + 1, 	playerDestZ),
				[3] = Position(playerDestX, 	playerDestY + 1, 	playerDestZ),
				[4] = Position(playerDestX + 1, playerDestY + 1, 	playerDestZ),
				[5] = Position(playerDestX + 1, playerDestY, 		playerDestZ),
				[6] = Position(playerDestX + 1, playerDestY - 1,	playerDestZ),
				[7] = Position(playerDestX, 	playerDestY - 1, 	playerDestZ),
				[8] = Position(playerDestX - 1,	playerDestY - 1, 	playerDestZ),
				[9] = Position(playerDestX - 1,	playerDestY, 		playerDestZ)
			}
			local vocID = vocation[cid]
			player:setVocation(Vocation(vocID))
			npcHandler:releaseFocus(cid)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:teleportTo(areaME[1])
			
			if table.contains({26}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_ICETORNADO)
				end
			elseif table.contains({24}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_THUNDER)
				end
			elseif table.contains({15, 28}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_POISONAREA)
				end
			elseif table.contains({27, 29}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_MORTAREA)
				end
			elseif table.contains({17, 22, 25}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
				end
			elseif table.contains({30, 31}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_HEARTS)
				end
			elseif table.contains({11, 32}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_HOLYAREA)
				end
			elseif table.contains({9, 12}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_BLACKSMOKE)
				end
			elseif table.contains({10, 13, 14}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_GROUNDSHAKER)
				end
			elseif table.contains({16, 21, 23}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_BIGCLOUDS)
				end
			elseif table.contains({18}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
				end
			elseif table.contains({19}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_FIREWORK_RED)
				end
			elseif table.contains({20}, vocID) then
				for k,v in pairs(areaME) do
					v:sendMagicEffect(CONST_ME_FIREWORK_BLUE)
				end
			end
		else
			npcHandler:say("It is okay to be scared child. What specialization do you want to pursue instead?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	return true
end

local function onAddFocus(cid)
	vocation[cid] = 0
end

local function onReleaseFocus(cid)
	vocation[cid] = nil
end

npcHandler:setCallback(CALLBACK_ONADDFOCUS, onAddFocus)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
