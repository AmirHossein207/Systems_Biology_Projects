clc
clear all
close all
format short g

solverOK = changeCobraSolver('glpk','all');
model = readCbModel('iML1515.mat');
model_1 = model;
model_1 = changeRxnBounds(model_1,{'EX_glc__D_e','EX_o2_e'},[-10 -15],{'l','l'});
solution_1 = optimizeCbModel(model_1);
[sampleStruct1,C1] = gpSampler(model_1,2000,[],240);
rxnList = {'EX_lac_e'};
plotSampleHist(rxnList,{sampleStruct1.points},{model_1});
