function [ angle ] = DisplayRobot(dist,tht,antTht1,antTht2)
global set
% dist = .6;
% tht  = -pi;

% Coerce antenna angles
antTht1(abs(imag(antTht1))>.0001) = set.ant_max;
antTht2(abs(imag(antTht2))>.0001) = set.ant_max;

% Get the coordinates
robot = set.coord_robot(dist,tht);

% PLOTTING
figure(1); hold off;
plot(set.obs(:,1),set.obs(:,2),'--','LineWidth',2)
hold on; axis([-1 1 -.8 1.2]);
c = colormap(hsv(10));

plot(robot(:,1),robot(:,2),'k','LineWidth',3);

for ii=1:length(antTht1)
    a1 = set.coord_antR(dist,tht,antTht1(ii));
    plot(a1(:,1),a1(:,2),'o:','LineWidth',3,'MarkerSize',5,'Color',c(mod(ii,length(c)),:))
end

for ii=1:length(antTht2)
    a2 = set.coord_antL(dist,tht,antTht2(ii));
    plot(a2(:,1),a2(:,2),'o:','LineWidth',3,'MarkerSize',5,'Color',c(mod(ii,length(c)),:))
end
% a2 = set.coord_antL(dist,tht,antTht2);
% plot(a2(:,1),a2(:,2),'ro:','LineWidth',3,'MarkerSize',5)


end

