%{
This is a MATLAB script for solving a linear programming problem using the Optimization Toolbox. The script loads data from a text file, sets up the optimization problem, defines the objective function and constraints, solves the problem, and writes the solution to an Excel file for further analysis.
%}

clc, clear

a = load('data1_5_1.txt');
c = a(1:end-1, 1:end-1);
e = a(1:end-1, end);
d = a(end, 1:end-1);

prob = optimproblem;
x = optimvar('x', 6, 8, 'LowerBound', 0);
prob.Objective = sum(sum(c.*x));
prob.Constraints.cons1 = sum(x, 1) == d;
prob.Constraints.cons2 = sum(x, 2) <= e;

[sol, fval, flag, out] = solve(prob), xx = sol.x
writematrix(xx, 'data1_5_2.xlsx'); % 数据写到Excel文件，便于做表使用
