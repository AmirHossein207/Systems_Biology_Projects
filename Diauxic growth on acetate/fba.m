function [F,v_g,v_ac] = fba(model_1)
rxnIDs = findRxnIDs(model_1,{'EX_glc__D_e','EX_ac_e',...
    'BIOMASS_Ecoli_core_w_GAM'});
solution = optimizeCbModel(model_1);

if ~isempty(solution.x)
    flux = solution.x;
    v_g = flux(rxnIDs(1));
    v_ac = flux(rxnIDs(2));
    F = flux(rxnIDs(3));

else
    F = 0;
    v_g = 0;
    v_ac = 0;
end
end
