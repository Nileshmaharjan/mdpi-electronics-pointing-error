function [gain, H, Attenuation] = retrieve_gain(A,B,C,R)
Y = sdpvar(2,2); % condition where Y = Y' > 0;
H = [1 1]; % random constant matrix

S = sdpvar(1);
% Attenuation = 36/100; 
%Attenuation = 0.36;% from the paper
Attenuation = 4.540; % for foggy condtion
%Attenuation = 0.0565; % for clear weather condition


% values obtained from paper, transmitterState.m and receiverState.m
A1= A;
B1 = [B zeros(2,1)];
C1 = [C;zeros(1,2)];
R1 = [R zeros(2,1)];
H1 = [H;zeros(1,2)];

Z = zeros(2,2);
gam = rand(); % accroding to the paper 
if (gam == 0 ) 
    disp('error')
end


fR4V = Y*A1'-S'*B1; % first row 4th value 
fR5V = Y*C1'; % first row 5th value
fR6V = Y*H1'; % first row 6th value



sR2V = -(Attenuation ^ 2)*eye(2,2);
tR3V = -gam*eye(2,2);
lR6V = -(gam ^ (-1))*eye(2);


epsl = 69e-5;
Constraints = Y >= epsl * eye(2);
Constraints = [
    Constraints;
    [-Y Z Z fR4V fR5V fR6V;
     Z' sR2V Z R1' Z Z;
     Z' Z' tR3V Y Z Z;
     fR4V' (R1')' Y' -Y Z Z;
     fR5V' Z' Z' Z' -eye(2,2) Z;
     fR6V' Z' Z' Z' Z' lR6V] <= epsl*eye(12)];


ops = sdpsettings('solver', 'sdpt3');
sol = optimize(Constraints, [], ops);

inverse_Y = inv(value(Y));
gain = inverse_Y * value(S);










end