clc
clear all
close all
format short g

solverOK = changeCobraSolver('glpk','all');
model = readCbModel('e_coli_core.mat');
model_1 = model;
model_1 = changeRxnBounds(model_1,{'EX_glc__D_e','EX_o2_e'},[-15,-15],{'l','l'});
solution_1 = optimizeCbModel(model_1);
printFluxVector(model_1,solution_1.x,true,true,-1,[],[],true)
[controlFlux, objFlux] = robustnessAnalysis(model_1, {'EX_glc__D_e'},200,[],{'BIOMASS_Ecoli_core_w_GAM'},[]);
subplot(2,1,1)
hold on
plot(abs(controlFlux),objFlux)
title('ecoli core')
xlabel('v-glucose (mmol/gDW/h)')
ylabel('mu (1/h)')
rxnIDs = findRxnIDs(model_1,{'EX_ac_e','EX_etoh_e','EX_for_e'});
secret = zeros(length(controlFlux),3);
for i=1:length(controlFlux)
    model_2 = changeRxnBounds(model_1,{'EX_glc__D_e'},controlFlux(i),'b');
    solution_2 = optimizeCbModel(model_2);
    u = solution_2.x(rxnIDs);
    secret(i,:) = transpose(u);
end
subplot(2,1,2)
plot(abs(controlFlux),secret)
legend('acetate','ethanol','formate')

