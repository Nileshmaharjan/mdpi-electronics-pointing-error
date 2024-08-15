function [A,B, C, R, cp, cl, ap, bp] = retrieve_other_system_parameters(al, rp, rl)

% value of A 

ap = 1; % System dynamics matrix of the transmitter

A = [ap 0; 0 al];

%%%%%%%%%%%%%%%%%%%%

% value of B

bp = 1; % Input matrix of the transmmtter
B = [bp; 0];

% Y = [0.3845  -0.0002;
%      -0.0002  0.0039];
% S = [0.3853 -0.0001];
% 
% K = S*inv(Y);
% 
% input = k * xk; 
% uk = -input;
% 
% B_combine = B1*uk


%%%%%%%%%%%%%%%%%%%

% value of R

R = [rp; rl]; 
cp = 1;
cl = 1;
C = [cp -cl];

end