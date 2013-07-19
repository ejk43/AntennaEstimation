function [ antTht, valid, npos] = CalcAntAngle( d, t )
%EJ Kreinar

%TODO:
% Clean up
% Modify return values:
%  - valid: true if the robot runs into a wall
%  - nposs: only include the physically possible antenna readings (ie no
%  going through walls)

global set

antTht = set.ant_max;
valid = false;
npos = 0;

% Check if the configuration (d,tht) is valid
pts = [set.coord_robot(d,t)];
if any(pts(:,2)<-0.0001)
    return;
end

% Find all possible angles, then narrow down options
angles = [set.angle_L1(d,t) set.angle_L1n(d,t) set.angle_L2(d,t) set.angle_L2n(d,t)];
res = angles(angles>=set.ant_min & angles<=set.ant_max & abs(imag(angles))==0);
if isempty(res)
    return;
end
final = [];
for ii=1:length(res)
    pts = set.coord_antR(d,t,res(ii));
    if all(pts(:,2)>-0.00001)
        final = [final res(ii)];
    end
end
if isempty(final)
    return;
end
valid = true;
npos = length(final);
antTht = final;
