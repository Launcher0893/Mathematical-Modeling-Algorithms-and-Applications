%{
This code solves a linear programming problem using the linprog function in MATLAB. The objective function is defined by the vector f, and the constraints are defined by the matrices a and b for inequality constraints, and aeq and beq for equality constraints. The solution is found by minimizing the objective function subject to these constraints, and the optimal solution and maximum value of the objective function are displayed.
%}

clc, clear

f = [-2; -3; 5];

a = [-2, 5, -1; 1, 3, 1];
b = [-10; 12];

aeq = [1, 1, 1];
beq = 7;

[x, y] = linprog(f, a, b, aeq, beq, zeros(3, 1));
y = -y;

disp(['The optimal solution is: ', num2str(x')]);
disp(['The maximum value of the objective function is: ', num2str(y)]);
