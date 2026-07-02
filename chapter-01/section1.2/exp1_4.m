%{
This is a MATLAB code for solving a linear programming problem using the Optimization Toolbox. The problem is defined as follows:
- The decision variables are represented by a 4x4 matrix 'x', with each element constrained to be non-negative (LowerBound = 0).
- The objective function is a linear combination of the elements of 'x', with specific coefficients for each column.
- The constraints are defined to ensure that certain sums of the elements of 'x' meet specified requirements.
The code sets up the optimization problem, defines the objective function and constraints, and then solves the problem using the 'solve' function. The optimal solution and the value of the objective function at that solution are displayed.
%}

clc, clear

prob = optimproblem % 默认目标函数最小化

x = optimvar('x', 4, 4, 'LowerBound', 0);
prob.Objective = 2800*sum(x(:, 1)) + 4500*sum(x(1:3, 2)) + 6000*sum(x(1:2, 3)) + 7300*x(1, 4);
prob.Constraints.con = [sum(x(1, :)) >= 15......
    sum(x(1, 2:4)) + sum(x(2, 1:3)) >= 10......
    x(1, 3) + x(1, 4) + x(2, 2) + x(2, 3) + x(3, 1) + x(3, 2) >= 20......
    x(1, 4) + x(2, 3) + x(3, 2) + x(4, 1) >= 12];

[sol, fval, flag, out] = solve(prob), sol.x
