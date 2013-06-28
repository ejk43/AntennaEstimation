function [ angle ] = DisplayRobot(dist,tht,antTht1,antTht2)
global set
% dist = .6;
% tht  = -pi;

% Coerce antenna angles
antTht1(abs(imag(antTht1))>.0001) = set.ant_max;
antTht2(abs(imag(antTht2))>.0001) = set.ant_max;

% Get the coordinates
a1 = set.coord_antR(dist,tht,antTht1);
a2 = set.coord_antL(dist,tht,antTht2);
robot = set.coord_robot(dist,tht);

% PLOTTING
figure(1); hold off;
plot(set.obs(:,1),set.obs(:,2),'--','LineWidth',2)
hold on; axis([-1 1 -.8 1.2]);

plot(robot(:,1),robot(:,2),'k','LineWidth',3);
plot(a1(:,1),a1(:,2),'ro:','LineWidth',3,'MarkerSize',5)
plot(a2(:,1),a2(:,2),'ro:','LineWidth',3,'MarkerSize',5)


end

