
[xkp, K, I0, sigma, dt, wp, rp ] = retrieve_transmitter_info();
[al, rl, xkl, wl] = retrieve_receiver_info();
[A,B, C, R, cp, cl, ap, bp] = retrieve_other_system_parameters(al, rp, rl);
[gain, H, Attenuation] = retrieve_gain(A,B,C,R);



xk = [xkp; xkl];
xk_initial = xk(:,1);
% number of channel samples
N = 1e5;
% trying for open lopp calculation
x3 = zeros(2, N+1);
distance_between_satellite_ground = 10^6; % distance in m

disp('begin')
for k = 1:N

    wp_val = wp(k);
    wl_val = wl(k);
    wk = [wp_val wl_val];
    first_part = A*xk(:,k);
    second_part = -K/2*(log(xk(:,k)/I0)+sigma^2)/sigma^2./xk(:,k)*dt;
    third_part = R * wk;
    fourth_part = -gain * xk(:,k);
    %x3(:,k+1) = (first_part + second_part + third_part(:,1) + fourth_part) / 10^6; % for closed loop in mm
    x3(:,k+1) = (first_part + second_part + third_part(:,1))/10^6; % for open loop in mm

end
x3_transpose = transpose(x3);
e = C .* x3_transpose;
y = (distance_between_satellite_ground) .* e;
y_transpose = transpose(y);

disp('here')


% Y_transpose = transpose(x3(1, 50:end)); % for gaussian kernel

disp('reached end value')
t = 0:dt*100:(dt*N);
hf1 = figure(1);
ax1 = axes('Parent',hf1, ...
    'FontSize',12,...
    'FontName','Times New Roman' ...
    );
plot1 = plot(t,y_transpose(1,1:100:100001),'k','LineWidth',1);
grid on
xlabel('Time[s]','FontName','Times New Roman')
ylabel('y_k displacement[mm]','FontName','Times New Roman')
title('Open loop', FontSize=28);
xlim(ax1);
ylim([1.4, 4])
set(gca, 'Fontsize', 28, 'Linewidth', 1.2)
lgd = legend({
    'Pointing error (Noon), {\epsilon} = 4.54'
    }, 'FontSize', 28);



% lgd = legend({
%     '{\sigma^2}= 0.0244, {\epsilon} = 0.014'
%     }, 'FontSize', 28);