--能量发生器
local cm,m,o=GetID()
function cm.initial_effect(c)
	VgD.Rule(c)
    local e1=Effect.CreateEffect(c)
    e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
    e1:SetProperty(EFFECT_FLAG_DELAY)
    e1:SetCode(EVENT_MOVE)
    e1:SetCondition(cm.con1)
    e1:SetOperation(cm.op1)
    c:RegisterEffect(e1)
    local e2=Effect.CreateEffect(c)
    e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
    e2:SetCode(EVENT_PHASE_START+PHASE_STANDBY)
    e2:SetRange(LOCATION_EMBLEM)
    e2:SetCountLimit(1)
    e2:SetCondition(cm.con2)
    e2:SetOperation(cm.op2)
	c:RegisterEffect(e2)
    local e3=Effect.CreateEffect(c)
    e3:SetCategory(CATEGORY_DRAW)
    e3:SetType(EFFECT_TYPE_IGNITION)
    e3:SetRange(LOCATION_EMBLEM)
    e3:SetCountLimit(1)
    e3:SetCost(VgF.EnegyCost(7))
    e3:SetOperation(cm.op3)
    c:RegisterEffect(e3)
end
function cm.con1(e,tp,eg,ep,ev,re,r,rp)
    local c=e:GetHandler()
    return c:IsLocation(LOCATION_EMBLEM) and tp==1 and Duel.GetTurnPlayer()==tp
end
function cm.op1(e,tp,eg,ep,ev,re,r,rp)
    local c=e:GetHandler()
    local token1=Duel.CreateToken(tp,10800730)
    local token2=Duel.CreateToken(tp,10800730)
    local token3=Duel.CreateToken(tp,10800730)
    local g=Group.FromCards(token1,token2,token3)
    Duel.Sendto(g,tp,LOCATION_EMBLEM,POS_FACEUP_ATTACK,REASON_EFFECT)
end
function cm.con2(e,tp,eg,ep,ev,re,r,rp)
    return Duel.GetTurnPlayer()==tp and Duel.GetMatchingGroupCount(Card.IsCode,tp,LOCATION_EMBLEM,0,nil,10800730)<10
end
function cm.op2(e,tp,eg,ep,ev,re,r,rp)
    local c=e:GetHandler()
    if Duel.GetMatchingGroupCount(Card.IsCode,tp,LOCATION_EMBLEM,0,nil,10800730)>=10 then return end
    local token=Duel.CreateToken(tp,10800730)
    Duel.Sendto(token,tp,LOCATION_EMBLEM,POS_FACEUP_ATTACK,REASON_EFFECT)
end
function cm.op3(e,tp,eg,ep,ev,re,r,rp)
    Duel.Draw(tp,1,REASON_EFFECT)
end