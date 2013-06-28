function [ antTht, valid, npos] = CalcAntAngle( d, t )
%EJ Kreinar

%TODO:
% Clean up
% Modify return values:
%  - valid: true if the robot runs into a wall
%  - nposs: only include the physically possible antenna readings (ie no
%  going through walls)

global set

valid = true;

angles = [set.angle_L1(d,t) set.angle_L1n(d,t) set.angle_L2(d,t) set.angle_L2n(d,t)];
res = angles(angles>=set.ant_min & angles<=set.ant_max & abs(imag(angles))==0);
npos = length(res);
if isempty(res) %|| L1 > d
    res = set.ant_max;
    valid = false;
end
antTht = min(res);
pts = set.coord_antR(d,t,antTht);
if any(pts(:,2)<-0.0001)
    antTht = set.ant_max;
    valid = false;
end
