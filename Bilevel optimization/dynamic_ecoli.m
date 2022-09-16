function eqns = dynamic_ecoli(t,y1)
P = y1(1);X_g = y1(2);G = y1(3);
%% FBA analysis
vg_MM = M_menten(G);
FBAsolution = FBA_bilevel(vg_MM,t);
v = FBAsolution.x;
if ~isempty(FBAsolution.x)
    v_product = v(48,1);
    v_growth = v(25,1); %biomass
    v_gl_up = v(52);
else
    v_product = 0;
    v_growth = 0;
    v_gl_up = 0;
end
%% tf,treg
%% Dynamic
eqns(1,1) = v_product.*X_g;
eqns(2,1) = v_growth.*X_g;
eqns(3,1) = v_gl_up.*X_g;
%     break

end