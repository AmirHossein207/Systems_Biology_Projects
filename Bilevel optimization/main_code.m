 clc
 clear all
 close all
 format short g

global model tf_max

tf_max = 15; %h

model = readCbModel('e_coli_core.mat');
solverOK = changeCobraSolver('glpk','LP');

% VTR		"Value To Reach" (stop when ofunc < VTR)
		VTR = eps ;

% D		number of parameters of the objective function 
		D = 2 ;

% XVmin,XVmax   vector of lower and bounds of initial population
%    		the algorithm seems to work well only if [XVmin,XVmax] 
%    		covers the region where the global minimum is expected
%               *** note: these are no bound constraints!! ***
%       treg tf
XVmin = [0,5];
XVmax = [15,15];

% y		problem data vector (remains fixed during optimization)
		y=[]; 

% NP            number of population members
		NP = 10*D; %%%% [15-20]

% itermax       maximum number of iterations (generations)
		itermax = 2000;

% F             DE-stepsize F ex [0, 2]
  		F = 0.8;
       

% CR            crossover probabililty constant ex [0, 1]
  		CR = 0.6; 

% strategy       1 --> DE/best/1/exp           6 --> DE/best/1/bin
%                2 --> DE/rand/1/exp           7 --> DE/rand/1/bin
%                3 --> DE/rand-to-best/1/exp   8 --> DE/rand-to-best/1/bin
%                4 --> DE/best/2/exp           9 --> DE/best/2/bin
%                5 --> DE/rand/2/exp           else  DE/rand/2/bin

 		strategy = 6;

% refresh       intermediate output will be produced after "refresh"
%               iterations. No intermediate output will be produced
%               if refresh is < 1
		refresh = 1; %%%1
       
        
        resume = false;  % true or false  


[X,f,nf,iter] = devec6('Obj_Func',VTR,D,XVmin,XVmax,y,NP,itermax,F,CR,strategy,refresh,resume);
 
  
  
  % =============================

disp(X)
% disp(f)