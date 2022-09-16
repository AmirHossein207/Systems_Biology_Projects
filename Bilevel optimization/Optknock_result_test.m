clc
clear
solverOK = changeCobraSolver('glpk','LP');
model = readCbModel('e_coli_core');
modelx = model;
vc_neg = 5; %mmol g-biomass/h
vc_pos = 0; %mmol g-biomass/h
modelx = changeRxnBounds(modelx,'EX_ac_e',vc_neg,'b');
% PGL, TALA  and NADTRHD
% modelx = deleteModelGenes(modelx, {'b3962','b1602','b0767','b2464','b0008'});
% PTAr,PYK
% modelx = deleteModelGenes(modelx, {'b2297','b2458','b1854','b1676'});
% EX_lac__D_e and FBP
% modelx = deleteModelGenes(modelx, {'b3925','b4232'});
%modelx = changeRxnBounds(modelx, {'EX_glc__D_e','EX_o2_e','EX_lac_De'},[-10,0,0],{'b','b','b'});
% PYK and FUM
modelx = deleteModelGenes(modelx, {'b1854','b1676','b1612','b4122','b1611'});
modelx = changeRxnBounds(modelx, {'EX_glc__D_e','EX_o2_e'},[-10,0],{'b','b'});
modelx = changeObjective(modelx,'BIOMASS_Ecoli_core_w_GAM');
FBAsolution = optimizeCbModel(modelx,'max');


