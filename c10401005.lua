local cm,m,o=GetID()
function cm.initial_effect(c)
	vgf.VgCard(c)
	vgd.EffectTypeContinuousChangeAttack(c,EFFECT_TYPE_SINGLE,5000,cm.con)
	vgd.EffectTypeIgnition(c,m,LOCATION_MZONE,cm.op,vgf.DamageCost(2),cm.con1)
end
function cm.con(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsPlayerAffectedByEffect(tp,AFFECT_CODE_NIGHT) or Duel.IsPlayerAffectedByEffect(tp,AFFECT_CODE_DEEP_NIGHT)
end
function cm.con1(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsPlayerAffectedByEffect(tp,AFFECT_CODE_DEEP_NIGHT)
end
function cm.op(e,tp,eg,ep,ev,re,r,rp)
	local g=Group.CreateGroup()
	Duel.Hint(HINT_SELECTMSG,tp,vgf.Stringid(m,0))
	local ct=Duel.AnnounceNumber(tp,1,2,3)
	for i=1,ct do
		local tc=Duel.CreateToken(tp,VgID)
		g:AddCard(tc)
	end
	vgf.Sendto(LOCATION_MZONE,g,0,tp)
end