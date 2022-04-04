%Script designed to simulate orbit near the Earth from
%position and velocity vector. Needs some cleaning up

clear
earthRadius = 6.378*10^3;
shipRadius = earthRadius + 400;
solarRadius = 6.96*10^5;
solarMass = 1.989*10^30;
                                %earthPosition = [0,-1.5*10^9,0];
earthPosition = [0,0,0];
solarPosition = [0,0,0];
shipVelocity = [10.0661,0,0];   
G = 6.673*10^-20;
M = 5.972*10^24;

Earth = celestialBody(earthRadius,earthPosition);
%Sol = celestialBody(solarRadius,solarPosition);
ship = plot3(earthPosition(1), earthPosition(2)-shipRadius,earthPosition(3),'.','MarkerSize',10);

t = 0;
dt = 10; %10 second

shipPos = [ship.XData,ship.YData,ship.ZData];


%legend(sprintf('Time: %1f',t));
pause;

i = 1;
while t < 24*60*60 %1 day

    pause(0.05);
    if exist('trajectory','var') timeDisplay = (['Time: ',num2str(t)]);
        delete(trajectory);
    end

    shipPosRecord(i,:) = [shipPos,t];
    i = i + 1;

    [shipPos, shipVelocity, shipAcceleration, t,ship] = gravityPropogate(G,M,-earthPosition,shipPos,shipVelocity,dt,t,ship);
    trajectory = plot3(shipPosRecord(:,1),shipPosRecord(:,2),shipPosRecord(:,3),'b');
    %legend(sprintf('Time: %1f',t));
    
end
hold on
disp('Done!')