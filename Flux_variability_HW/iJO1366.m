clc
clear all
close all
format short g

solverOK = changeCobraSolver('glpk','all');
model = readCbModel('iJO1366.mat');
model_1 = model;
model_1 = changeRxnBounds(model_1,{'EX_glc__D_e','EX_o2_e'},[-10,0],{'l','l'});
solution_1 = optimizeCbModel(model_1);
fprintf('100 percent growth')
[min_flux100,max_flux100] = fluxVariability(model_1,100,'max',{'EX_lac__D_e'})
fprintf('70 percent growth')
[min_flux70,max_flux70] = fluxVariability(model_1,70,'max',{'EX_lac__D_e'})


