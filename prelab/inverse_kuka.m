function q = inverse_kuka(H, myrobot)
    O_d = H(1:3, 4);
    R_d = H(1:3, 1:3);
    
    a1 = myrobot.a(1);
    a2 = myrobot.a(2);
    a3 = myrobot.a(3);    
    a6 = -myrobot.a(6);     % because we care about the magnitude    
    d1 = myrobot.d(1);
    d4 = myrobot.d(4);
    d6 = myrobot.d(6);
    
    
    o_c = O_d - R_d * [-a6; 0; d6];
    xc = o_c(1);
    yc = o_c(2);
    zc = o_c(3);
    
    %finding theta 1
    theta1 = atan2(yc, xc);
    
    % auxiliary variables
    phi = atan2(zc - d1, sqrt(xc^2 + yc^2)-a1);
    l = (zc - d1)/sin(phi);
    
    % finding theta 2
    num_alpha = a3^2 + d4^2 - a2^2 - l^2;
    den_alpha = -2*a2*l;
    
    alpha = acos(num_alpha/den_alpha);
    
    
    theta2 = phi + alpha;
    
    
    % finding theta 3
    sigma = atan2(a3, d4);
    num_psi = a2^2 - l^2 - a3^2 - d4^2;
    den_psi = -2*l*sqrt(a3^2 + d4^2);
    psi = acos(num_psi/den_psi);
%     psi = atan2(sqrt(den_psi^2 - num_psi^2), num_psi);
    theta3 =  pi/2 - (alpha + sigma + psi);
    
    
    % find rotation transformation from frame 3 to 0 using theta1,2,3 
    H03 = myrobot.A([1,2,3], [theta1, theta2, theta3]).double;
    R03 = H03(1:3,1:3);
    
    % find rotation transformation from frame 6 to 3
    R36 = transpose(R03)*R_d;
    
    % extract params from R36
    a13 = R36(1,3);
    a23 = R36(2,3);
    a31 = R36(3,1);
    a32 = R36(3,2);
    a33 = R36(3,3);
    
    %find theta 4,5,6
    theta4 = atan2(a23, a13);
    theta5 = atan2(real(sqrt(1-a33^2)), a33);
    theta6 = atan2(a32, -a31);
    
    q = [theta1, theta2, theta3, theta4, theta5, theta6];
end

% function q = inverse(H, myrobot)
%     q = myrobot.ikine(H);
% end