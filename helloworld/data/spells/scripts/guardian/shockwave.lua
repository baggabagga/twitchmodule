local arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local arr4 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local arr5 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

function onGetFormulaValues1(player, skill, attack, factor)
	local min = (player:getLevel() * 10) + (skill * attack * 0.8)
	local max = (player:getLevel() * 10) + (skill * attack * 1.0)
	return -min, -max
end

function onGetFormulaValues2(player, skill, attack, factor)
	local min = (player:getLevel() * 10) + (skill * attack * 0.5)
	local max = (player:getLevel() * 10) + (skill * attack * 0.8)
	return -min, -max
end

function onGetFormulaValues3(player, skill, attack, factor)
	local min = (player:getLevel() * 10) + (skill * attack * 0.3)
	local max = (player:getLevel() * 10) + (skill * attack * 0.6)
	return -min, -max
end

function onGetFormulaValues4(player, skill, attack, factor)
	local min = (player:getLevel() * 10) + (skill * attack * 0.2)
	local max = (player:getLevel() * 10) + (skill * attack * 0.4)
	return -min, -max
end

function onGetFormulaValues5(player, skill, attack, factor)
	local min = (player:getLevel() * 10) + (skill * attack * 0.2)
	local max = (player:getLevel() * 10) + (skill * attack * 0.4)
	return -min, -max
end

local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setArea(createCombatArea(arr1))
combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setArea(createCombatArea(arr2))
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local combat3 = createCombatObject()
combat3:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat3:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat3:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat3:setArea(createCombatArea(arr3))
combat3:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues3")

local combat4 = createCombatObject()
combat4:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat4:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat4:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat4:setArea(createCombatArea(arr4))
combat4:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues4")

local combat5 = createCombatObject()
combat5:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat5:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat5:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat5:setArea(createCombatArea(arr5))
combat5:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues5")

local function onCastSpell1(parameters)
	doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
	doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
	doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
	doCombat(parameters.cid, combat4, parameters.var)
end

local function onCastSpell5(parameters)
	doCombat(parameters.cid, combat5, parameters.var)
end

function onCastSpell(cid, var)
	local parameters = { cid = cid, var = var}
	addEvent(onCastSpell1, 1, parameters)
	addEvent(onCastSpell2, 150, parameters)
	addEvent(onCastSpell3, 300, parameters)
	addEvent(onCastSpell4, 450, parameters)
	addEvent(onCastSpell5, 600, parameters)
	return TRUE
end