--亲卫队长 玛尔伦
local cm,m,o=GetID()
function cm.initial_effect(c)
    vgf.VgCard(c)
    -- 【永】【R/G】：你的R上的〈幽灵〉有3张以上的话，这个单位的力量+2000、盾护+5000。
    vgd.EffectTypeContinuousChangeAttack(c,EFFECT_TYPE_SINGLE,2000,cm.con1)
    vgd.EffectTypeContinuousChangeAttack(c,EFFECT_TYPE_SINGLE,5000,cm.con2,tg,EFFECT_UPDATE_DEFENSE,reset,LOCATION_GZONE)
end

function cm.con1(e,tp,eg,ep,ev,re,r,rp)
    return cm.con2(e,tp,eg,ep,ev,re,r,rp) and vgf.RMonsterCondition(e)
end

function cm.con2(e)
    local c = e:GetHandler()
    local tp = e:GetHandlerPlayer()
    return vgf.IsExistingMatchingCard(cm.filter,tp,LOCATION_MZONE,0,3)
end

function cm.filter(c)
    return c:IsSetCard(0xa013) and vgf.RMonsterFilter(c)
end
