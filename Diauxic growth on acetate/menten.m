function [vc,vg] = menten(A,G)
kg = 0.0027; % % g/L 
ka = 0.25; % % g/L 
vg_max = 10; % mmol/g/h
va_max = 12.44; % from FBA aerobic with zero glucose % mmol/g/h
vg = vg_max*G./(kg+G);
vc = va_max*A./(ka+A);
end
