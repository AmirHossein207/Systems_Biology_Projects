function vg_MM = M_menten(G)
vg_max = 10; %mmol/g biomass
Kg = 25; %mmol/h
vg_MM = vg_max.*G./(G+Kg);


% function vg_MM = M_menten(P)
% vg_max = 10; %mmol/g biomass
% Kg = 25; %mmol/h
% vg_MM = vg_max./(1+P./Kg);
end