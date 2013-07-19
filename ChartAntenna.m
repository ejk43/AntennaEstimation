function [antAngle, antValid, antPossb] = ChartAntenna

%% LOAD CONFIG
global set;
config;

%% SETUP RUN
dist = .1:.002:.7;
tht  = -5*pi/4:pi/100:pi/4;

ld = length(dist);
lt = length(tht);
antAngle = zeros(ld,lt);
antValid = zeros(ld,lt);
antPossb = zeros(ld,lt);
for i = 1:ld;
    d = dist(i)
    for j = 1:lt;
        t = tht(j);
        
%         DisplayRobot(d,t,pi/4,pi/4);
        [antTht,valid,nposs] = CalcAntAngle(d,t);
        
        if abs(imag(antTht)) > 0
           pause 
        end
        
        % Save Results
        antAngle(i,j) = min(antTht);
        antPossb(i,j) = nposs;
        antValid(i,j) = valid;
        
        %display
%         DisplayRobot(d,t,antTht,pi/4);
%         pause(0.05)
    end
end

%% PLOTS
figure(1)
% surf(tht,dist,set.ant_max-antAngle)
imagesc(dist,tht,(set.ant_max-antAngle)')
colorbar;
ylabel('Tht Offset (rad)');
xlabel('Distance Offset (m)');
title('R Antenna Sensor Reading (ThtMax - deflection) (rad)')

figure(2)
% surf(tht,dist,antValid)
imagesc(dist,tht,antValid')
colorbar;
ylabel('Tht Offset (rad)');
xlabel('Distance Offset (m)');
title('Valid Locations?')

figure(3)
% surf(tht,dist,antPossb.*antValid)
imagesc(dist,tht,antPossb')
colorbar;
ylabel('Tht Offset (rad)');
xlabel('Distance Offset (m)');
title('Number of Valid Antenna Readings?')

