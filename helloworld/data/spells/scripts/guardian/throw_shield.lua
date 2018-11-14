local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_BLACKSMOKE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WHIRLWINDAXE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 5000)
--condition:setFormula(-1, 80, -1, 80)
combat:addCondition(condition)

function onGetFormulaValues(player, skill, attack, factor)
	local min = (player:getLevel() * 1) + (skill * attack * 0.08)
	local max = (player:getLevel() * 1) + (skill * attack * 0.1)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
