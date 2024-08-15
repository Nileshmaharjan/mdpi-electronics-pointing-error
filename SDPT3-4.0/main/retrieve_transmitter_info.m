function [xkp, K, I0, sigma, dt, wp, rp] = retrieve_transmitter_info()
% Lognormal PDF parameters

%I0 = 0.8;  % for clear weather 

I0=2.5; % for fog weather

%I0 = 2.5; %morning
%I0 = 3; % Noon
%I0 = 2.5; %Night


%sigma = 0.10049875621; %morning
sigma = 0.15620499351; % noon
%sigma = 0.02675817632; %night

% sigma_2 = 0.001
%sigma = 0.0316227766; % from paper

% channel parameter
tau_c = 0.1; % used in equation 4 to calculate K

% sampling time
dt = 5e-5;

% number of channel samples
N = 1e5;

% number of uncorrelated realizations
L = 1;


% Generation
K = 2*I0^2*exp(sigma^2)*(exp(sigma^2)-1)/tau_c; % finding the value of K 

%f = @(t,x) -K1/2*(log(x/mu)+sigma1^2)/sigma1^2/x;
g = sqrt(K); % used in equation 3 to find the value of rp

% Calculating rp
rp = sqrt(K * dt); % used later while solving LMI Problem   (equation 3)

% Initialize solver
rng('default')
wp = randn(L,N); % samples of random white gaussian noise

% pre-allocate solution
xp = zeros(L,N); 

% % initial value
xp(:,1) = (I0-sigma^2/2)*ones(L,1);

% Solve SDE (iterative is slow in Matlab)
% Explicite Euler method
for k = 1:N-1
    xp(:,k+1) = xp(:,k) -K/2*(log(xp(:,k)/I0)+sigma^2)/sigma^2./xp(:,k)*dt + g*sqrt(dt)*wp(:,k); 
    
end
xkp = xp;
end



