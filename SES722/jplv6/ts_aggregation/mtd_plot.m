function []=mtd_plot(res,z)
% PURPOSE: Graphic output of multivariate temporal disaggregation methods
% ------------------------------------------------------------
% SYNTAX: []=mtd_plot(res,z);
% ------------------------------------------------------------
% OUTPUT: plots of
%         - high frequency estimates
%         - z constraint and transversal aggregation
% ------------------------------------------------------------
% INPUT: res: structure generated by denton or difonzo programs
%        z: nzx1 ---> high frequency transversal constraint
% ------------------------------------------------------------
% SEE ALSO: denton, difonzo, mtd_print

% written by:
% Enrique M. Quilis
% Instituto Nacional de Estadistica
% Paseo de la Castellana, 183
% 28046 - Madrid (SPAIN)

y=res.y(1:res.n,:);

t=1:res.n;
figure;
plot(t,sum(res.y'),'ro',t,z);
legend('Transversal aggregation','z: Transversal constraint',0);
e=100*((sum(y')')-z)./z;   % Final discrepancy
xlabel ('time'); 
figure;
plot(e);
title ('Final discrepancy (as % of z)');
axis ([0 res.n -1 1]);   
xlabel ('time'); 

[aux,M] = size(res.y); clear aux;

switch res.meth
case {'Multivariate Denton'}
   % Nothing to do 
case {'Multivariate di Fonzo'}   
   y_li = res.y - res.d_y;           % Lower limit of high freq. estimate
   y_ls = res.y + res.d_y;           % Upper limit of high freq. estimate
end

for i=1:M
   figure;
   switch res.meth
   case {'Multivariate Denton'}
      plot(t,res.y(:,i),'b-');
   case {'Multivariate di Fonzo'}
      plot(t,res.y(:,i),'b-',t,y_li(:,i),'r-',t,y_ls(:,i),'r-');
   end
   title ('High frequency series');
   xlabel ('time'); 
end
