function RobotScan
% EJ Kreinar

% TODO: 
% - Create a function for finding the angle
% - Graph the resulting angles

%LOAD CONFIG
global set;
config;

for d = .1:.05:.5;
d
    for t = -1.6:0.05:0.1;
        antTht = CalcAntAngle(d,t);
%         DisplayRobot(d,t,pi/4,pi/4);
%         DisplayRobot(d,t,angle_L2n(d,t),pi/4);
        DisplayRobot(d,t,antTht,pi/4);
        pause(0.05)
    end
end