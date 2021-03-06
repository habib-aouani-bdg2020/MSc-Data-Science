% PURPOSE: demo of diagnose()
%          Regression Diagnostic routines
%          
%---------------------------------------------------
% USAGE: diagnose_d
%---------------------------------------------------


% generate data set
n = 100;
k = 3;
x = randn(n,k);
x(:,1) = ones(n,1);

beta = ones(k,1);

y = x*beta + randn(n,1);

% add outliers
y(50,1) = 10;
y(70,1) = -10;


result = diagnose(y,x);

prt = 1;
result = diagnose(y,x,prt);

