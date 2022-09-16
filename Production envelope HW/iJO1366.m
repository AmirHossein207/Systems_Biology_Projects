clc
clear all
close all
format short g

solverOK = changeCobraSolver('glpk','all');
model = readCbModel('iJO1366.mat');

model_1 = model;
model_1 = changeRxnBounds(model_1,{'EX_glc__D_e','EX_o2_e'},[-15,0],{'l','l'});
solution_1 = optimizeCbModel(model_1);
[biomassValues1, targetValues1] = productionEnvelope(model_1,[],'g', {'EX_lac__D_e'}, {'BIOMASS_Ec_iJO1366_core_53p95M'}, 0, 200);
hold on
title('iJO1366')
xlabel('\mu(1/h)')
ylabel('v_ex_lac (mmol/gDW/h)')
%
model_2 = deleteModelGenes(model_1, {'b1241','b0351','b1478','b3962','b1602','b1702'});
solution_2 = optimizeCbModel(model_2);
[biomassValues2, targetValues2] = productionEnvelope(model_2,[],'r', {'EX_lac__D_e'},{'BIOMASS_Ec_iJO1366_core_53p95M'}, 1, 200);
