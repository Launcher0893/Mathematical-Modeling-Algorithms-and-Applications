%{
This is a simple example of using the optimization toolbox in MATLAB to solve a linear programming problem. The objective is to minimize the cost function defined by the vector c, subject to the constraints defined by the matrix a and vector b. The variables u and v are defined with lower bounds of 0, ensuring that they are non-negative. The solution is obtained using the 'solve' function, which returns the optimal values of u and v, as well as the optimal value of the objective function and additional information about the optimization process.
%}

clc, clear

c = [1:4]';
b = [-2, -1, -1/2]';
a = [1, -1, -1, 1; 
    1, -1, 1, -3;
    1, -1, -2, 3];

prob = optimproblem;
u = optimvar('u', 4, 'LowerBound', 0);
v = optimvar('v', 4, 'LowerBound', 0);
prob.Objective = sum(c' * (u+v));
prob.Constraints.cons = a * (u-v) <= b;

[sol, fval, flag ,out] = solve(prob)
x = sol.u - sol.v
