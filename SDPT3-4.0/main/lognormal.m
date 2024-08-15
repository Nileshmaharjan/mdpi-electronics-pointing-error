% PDF of log normal distribution
clear
clc

colorStyle = ['k', 'r', 'k', 'r'];
markerStyle=["*",".","^","o"];
markerCounter = 1;
colorCounter = 1;


% E[I] value
Io=1;
I=0:0.05:2;

%Log irradinace variance values
Var_l=[0.1, 0.2, 0.5, 0.75];


for i=1:length(Var_l)
    for j=1:length(I)
        disp(j)
 
        B=sqrt(2*pi*Var_l(i));
        C(j)=log(I(j)/Io)+(Var_l(i)/2);
        D=2*Var_l(i);
        pdf(i,j)=(1/I(j))*(1/B)*exp(-((C(j))^2)/D);
    
    end
    %plot function
    figure(1)
    disp(Var_l(i))
    disp(colorStyle(colorCounter))
    disp(markerStyle(markerCounter))
    p = plot((I./Io), pdf(i,:), 'LineWidth', 2.5, 'Marker', markerStyle(markerCounter), 'Color', colorStyle(colorCounter), 'MarkerSize', 15);
    hold on
    grid on

    xlabel('Normalised Irradiance, I/I_0', 'FontSize', 28)
    ylabel('Probablity Density Function (p(I))', 'FontSize', 28)

    markerCounter=markerCounter+1;
    colorCounter=colorCounter+1;

    set(gca, 'Fontsize', 28, 'Linewidth', 1.2)

end

lgd = legend({ ...
    '\sigma^2 = 0.1','\sigma^2 = 0.2', '\sigma^2 = 0.5', '\sigma^2 = 0.75' ...
    }, 'FontSize', 28);
