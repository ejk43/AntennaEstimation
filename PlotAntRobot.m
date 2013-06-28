function RobotScan

for d = .1:.05:.5;
    for t = -1.6:0.05:0.1;
%         DisplayRobot(d,t,pi/4,pi/4);
        DisplayRobot(d,t,angle_L1(d,t),pi/4);
        pause(0.05)
    end
end