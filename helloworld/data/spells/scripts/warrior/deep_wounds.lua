local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)

local function getHighestSkillLevel(creature)
	local skillLevel = -1
	for skillType = SKILL_CLUB, SKILL_AXE do
		if skillLevel < creature:getEffectiveSkillLevel(skillType) then
			skillLevel = creature:getEffectiveSkillLevel(skillType)
		end
	end
	return skillLevel
end

function onTargetCreature(creature, target)
	local skill = getHighestSkillLevel(creature)
	local min = (creature:getLevel() * 10) + (skill * 0.3)
	local max = (creature:getLevel() * 10) + (skill * 2.0)
	local damage = math.random(math.floor(min) * 1000, math.floor(max) * 1000) / 1000
	creature:addDamageCondition(target, CONDITION_BLEEDING, DAMAGELIST_OMEGA_LUL, target:isPlayer() and damage / 4 or damage)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
