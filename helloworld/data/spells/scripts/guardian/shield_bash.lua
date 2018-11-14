local arr1 = {
{0, 0, 0, 0, 0},
{0, 1, 3, 1, 0},
{0, 0, 0, 0, 0}
}

local arr2 = {
{0, 0, 0, 0, 0},
{1, 0, 3, 0, 1},
{0, 0, 2, 0, 0}
}

function onGetFormulaValues1(player, skill, attack, factor)
	local min = (player:getLevel() * 10) + (skill * attack * 0.8)
	local max = (player:getLevel() * 10) + (skill * attack * 1.0)
	return -min, -max
end

function onGetFormulaValues2(player, skill, attack, factor)
	local min = (player:getLevel() * 10) + (skill * attack * 0.6)
	local max = (player:getLevel() * 10) + (skill * attack * 0.8)
	return -min, -max
end

local combat1 = createCombatObject()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat1:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat1:setArea(createCombatArea(arr1, AREADIAGONAL_WAVE6))
combat1:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues1")

local combat2 = createCombatObject()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POFF)
combat2:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat2:setArea(createCombatArea(arr2, AREADIAGONAL_WAVE6))
combat2:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues2")

local function onCastSpell1(parameters)
	doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
	doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
	local parameters = { cid = cid, var = var}
	addEvent(onCastSpell1, 1, parameters)
	addEvent(onCastSpell2, 150, parameters)
	return TRUE
end
