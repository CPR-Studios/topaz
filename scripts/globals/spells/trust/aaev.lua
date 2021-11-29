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

-- TODO Tester cure potency, devrait avoir 50%
-- TODO Tester Damage taken, devrait avoir -10%
-- TODO Tester Fast Cast, devrait avoir le JT
-- TODO Tester Auto-Refresh, devrait avoir le JT
-- TODO Tester Auto-Regen, devrait avoir le JT car /WHM
-- TODO Tester WS, semble être dans le code

function onMobSpawn(mob)
    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.SENTINEL,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.SENTINEL)

    mob:addSimpleGambit(ai.t.PARTY, ai.c.HPP_LT, 75,
                        ai.r.MA, ai.s.HIGHEST, tpz.magic.spellFamily.CURE)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_HAS_TOP_ENMITY, tpz.effect.FLASH,
                        ai.r.MA, ai.s.SPECIFIC, tpz.magic.spell.FLASH)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DIVINE_EMBLEM,
                        ai.r.JA, ai.s.SPECIFIC, tpz.ja.DIVINE_EMBLEM)

    -- mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DIVINE_EMBLEM,
    --                    ai.r.MA, ai.s.SPECIFIC, tpz.magic.spellFamily.HOLY)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.DIVINE_EMBLEM, ai.t.TARGET, ai.c.MB_AVAILABLE, 0, ai.r.MA, ai.s.MB_ELEMENT, tpz.magic.spellFamily.HOLY)

    mob:addSimpleGambit(ai.t.SELF, ai.c.NOT_STATUS, tpz.effect.CHIVALRY,
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

