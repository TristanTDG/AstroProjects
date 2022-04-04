function [sPos, sVelocity, a, t, ship] = gravityPropogate(G,M,bP,sP,sV,dt,t,ship)

    r = sP-bP;
    rHat = r/norm(r);
    sA = ((-G*M)./(norm(r).^2).*rHat);
    sV = sV + sA*dt;
    sP = sP + sV*dt;
    
    sPos = sP;
    sVelocity = sV;
    a = sA;
    t = t + dt;
    
    ship.XData = sPos(1);
    ship.YData = sPos(2);
    ship.ZData = sPos(3);

end