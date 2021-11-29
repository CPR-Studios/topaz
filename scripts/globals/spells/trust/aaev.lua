-----------------------------------------
-- Trust: AAEV
-----------------------------------------
require("scripts/globals/ability")
require("scripts/globals/gambits")
require("scripts/globals/magic")
require("scripts/globals/status")
require("scripts/globals/trust")
require("scripts/globals/weaponskillids")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return tpz.trust.canCast(caster, spell)
end

function onSpellCast(caster, target, spell)
    return tpz.trust.spawn(caster, spell)
end

function onMobSpawn(mob)
    mob:addMod(tpz.mod.DMG, 10)
    mob:addMod(tpz.mod.CURE_POTENCY, 50)
    mob:addMod(tpz.mod.FAST_CAST, 10)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75,
                        ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, 0, tpz.effect.FLASH,
                        ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DIVINE_EMBLEM,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.DIVINE_EMBLEM)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DIVINE_EMBLEM, ai.t.TARGET, ai.c.MB_AVAILABLE, 0, 
                        ai.r.MA, ai.s.HIGHEST, ai.s.MB_ELEMENT, tpz.magic.spellFamily.HOLY)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, ai.c.MPP_LT, 20, tpz.effect.CHIVALRY,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.CHIVALRY)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PALISADE,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.PALISADE)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.REPRISAL,
                        ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.REPRISAL)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.PHALANX,
                        ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.PHALANX)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.ENLIGHT,
                        ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.ENLIGHT)
end

function onMobDespawn(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DESPAWN)
end

function onMobDeath(mob)
    tpz.trust.message(mob, message_page_offset, tpz.trust.message_offset.DEATH)
end

