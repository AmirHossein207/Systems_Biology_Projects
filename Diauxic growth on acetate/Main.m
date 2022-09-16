clear all
close all 
clc
 
global model Mw
SolverOk = changeCobraSolver('gurobi','all');

model = readCbModel('e_coli_core.mat');
Mw = [0.18 0.06];
% time_interval = [0 12];t
t0 = 0;
tEnd = 12;
%---------------- g/l mmol/l mmol/l
initial_values = [0.05;10;0];
options = odeset('NonNegative',1,'RelTol',1e-6,'AbsTol',1e-9);

%%
myVideo = VideoWriter('myVideoFile'); %open video file
myVideo.FrameRate = 10;  %can adjust this
open(myVideo)
y0=initial_values;
j=1;
Color = ['g','r','b'];
for T = 1:0.1:12
    incremental_time_interval = [t0, T];
    [t,y] = ode15s(@dynamic_ecoli,incremental_time_interval,y0,options);
    t0 = t(end);
    y0 = y(end,:);
    
    for ind=1:3
    plot(t,y(:,ind),Color(ind),'LineWidth', 2)
    hold on
    end
    legend on
    ylabel('g/l','FontSize',14)
    xlabel('h','FontSize',14)
    axis([0 tEnd -1.5 max(initial_values)])
    ax = gca; % current axes
    ax.FontSize = 14;
    legend('biomass','glucose','acetate','FontSize',14)
    drawnow
    F(j)= getframe(gcf);
    writeVideo(myVideo, F(j));
    j=j+1;
end
close(myVideo)

% fig = figure;
% movie(fig,F,1)