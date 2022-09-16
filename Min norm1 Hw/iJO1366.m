clc
clear all
close all
format short g

solverOK = changeCobraSolver('glpk','all');
model = readCbModel('iJO1366.mat');

model_1 = model;
model_1 = changeRxnBounds(model_1,{'EX_glc__D_e','EX_o2_e'},[-10,-15],{'l','l'});
solution_1 = optimizeCbModel(model_1);
fprintf('\n FBA flux variability \n')
printFluxVector(model_1,solution_1.x,true,true,-1,[],[],true)

solution_2 = optimizeCbModel(model_1,'max','one');
fprintf('\n nMin Norm 1 flux variability \n')
printFluxVector(model_1,solution_2.x,true,true,-1,[],[],true)