function eqns = dynamic_ecoli(t,y)
global model Mw

if y(2) < 0
    y(2) = 0;
end
if y(3) < 0
    y(3) = 0;
end
X = y(1); G = y(2); A = y(3);

[vc,vg] = menten(A,G);
model_1 = changeRxnBounds(model,{'EX_glc__D_e','EX_o2_e','EX_ac_e'}...
    ,[-vg -15 -vc],{'l','l','l'});
[F,v_g,v_ac] = fba(model_1);


eqns = zeros(3,1);
eqns(1,1) = F*X;
eqns(2,1) = v_g*X*Mw(1);
eqns(3,1) = v_ac*X*Mw(2);

end
