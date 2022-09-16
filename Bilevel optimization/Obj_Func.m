function Result = Obj_Func(X,y)
save('X','X');
w = 1.5;
t_base = 10;

timespan = [0 X(2)];
initialvalues =  [0;0.01;10];
[~,y1] = ode45(@(t,y1) dynamic_ecoli(t,y1),timespan,initialvalues);

P = y1(end,1);
g = X(1)-X(2);
g1 = max(0,g);
r = 1e+14;
Result = -(P*(X(2))-w*(X(2)-t_base)) + r*g1^2;
end