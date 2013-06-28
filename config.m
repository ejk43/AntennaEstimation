% Configuration settings
% EJ Kreinar

global set;

% Helping functions
set.rotmat  = @(tht) [cos(tht) -sin(tht); sin(tht) cos(tht)];

% Simulation parameters
set.L1 = 0.4;
set.L2 = 0.4;
set.beta = pi/2; %Angle between the two segments
set.ant_x = 0.1;
set.ant_y = 0.1;
set.ant_max = pi/4;
set.ant_min = 0;

% Derived constants
set.L3 = sqrt(set.L1^2+set.L2^2-2*set.L1*set.L2*cos(set.beta));
set.alpha = asin(set.L2/set.L3*sin(set.beta));

% Antenna Angle Calculations!
set.angle_L1 = @(d,tht) acos((d+set.ant_x*sin(tht)+set.ant_y*cos(tht))/set.L1) - tht;
set.angle_L1n = @(d,tht) -acos((d+set.ant_x*sin(tht)+set.ant_y*cos(tht))/set.L1) - tht;
set.angle_L2 = @(d,tht) acos((d+set.ant_x*sin(tht)+set.ant_y*cos(tht))/set.L3) + set.alpha - tht;
set.angle_L2n = @(d,tht) -acos((d+set.ant_x*sin(tht)+set.ant_y*cos(tht))/set.L3) + set.alpha - tht;

% Robot Coordinate Parameters
set.robot = [ 0.1  0.0;
              0.1 -0.2;
             -0.7 -0.2;
             -0.7  0.2;
              0.1  0.2;
              0.1  0.0];
set.obs = [-1 0;
            1 0];
        
%Plotting functions
set.antR = @(phi) [ set.ant_x  set.ant_y;
                   [set.ant_x  set.ant_y] + [set.L1 0] * set.rotmat(-pi/2+phi)';
                   [set.ant_x  set.ant_y] + [set.L1 0] * set.rotmat(-pi/2+phi)' + [set.L2 0] * set.rotmat(-pi/2+phi-set.beta)']; 
set.antL = @(phi) [ set.ant_x -set.ant_y;
                   [set.ant_x -set.ant_y] + [set.L1 0] * set.rotmat(pi/2-phi)';
                   [set.ant_x -set.ant_y] + [set.L1 0] * set.rotmat(pi/2-phi)'  + [set.L2 0] * set.rotmat(pi/2-phi+set.beta)'];
set.coord_robot = @(d,tht) set.robot*set.rotmat(tht)'+repmat([0 d],size(set.robot,1),1);
set.coord_antR  = @(d,tht,antTht) set.antR(antTht)*set.rotmat(tht)'+repmat([0 d],3,1);
set.coord_antL  = @(d,tht,antTht) set.antL(antTht)*set.rotmat(tht)'+repmat([0 d],3,1);
