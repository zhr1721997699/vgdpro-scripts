--精确课程表 莉布谢

local cm,m,o=GetID()
function cm.initial_effect(c)
    vgf.VgCard(c)
    -- 【永】【R】：这个回合中你施放了指令卡的话，这个单位的力量+2000。
    vgd.GlobalCheckEffect(c,m,EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS,EVENT_CHAIN_SOLVING,cm.checkcon,cm.checkop)
    vgd.EffectTypeContinuousChangeAttack(c,EFFECT_TYPE_SINGLE,2000,cm.con1)
end

function cm.con1(e,tp,eg,ep,ev,re,r,rp)
    local c=e:GetHandler()
    return vgf.RMonsterCondition(e) and Duel.GetFlagEffect(tp,m)>0
end

function cm.checkcon(e,tp,eg,ep,ev,re,r,rp)
    return re:IsHasType(EFFECT_TYPE_ACTIVATE) and rp==tp
end

function cm.checkop(e,tp,eg,ep,ev,re,r,rp)
    Duel.RegisterFlagEffect(tp,m,PHASE_END,0,1)
end
