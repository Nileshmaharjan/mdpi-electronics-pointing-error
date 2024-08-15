
V = yalmip('version')


Y = sdpvar(2,2); % condition where Y = Y' > 0;
H = [1 1]; % random constant matrix
S = sdpvar(1);
PE = 0.32; % from the paper


% values obtained from paper, transmitterState.m and receiverState.m
A = [1 0; 0 0.9947]; 
A1= A;
B = [1;0];
B1 = [B zeros(2,1)];
C = [1 -1];
C1 = [C;zeros(1,2)];
R = [0.0124; 1.2493e-14]; 
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

sR2V = -(PE ^ 2)*eye(2,2);
tR3V = -gam*eye(2,2);
lR6V = -(gam ^ (-1))*eye(2);


epsl = 1e-5;
Constraints = [Y >= epsl * eye(2)];
Constraints = [
    Constraints;
    [-Y Z Z fR4V fR5V fR6V;
     Z' sR2V Z R1' Z Z;
     Z' Z' tR3V Y Z Z;
     fR4V' (R1')' Y' -Y Z Z;
     fR5V' Z' Z' Z' -eye(2,2) Z;
     fR6V' Z' Z' Z' Z' lR6V] <= epsl*eye(12)];


ops = sdpsettings('solver', 'sdpt3');
sol = optimize(Constraints, [], ops)

disp('test');
disp(value(Y));
disp(value(S));







