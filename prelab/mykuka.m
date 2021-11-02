function myrobot = mykuka(DH)
    % define robot links
    L1 = Link('revolute', DH(1,:));
    L2 = Link('revolute', DH(2,:));
    L3 = Link('revolute', DH(3,:));
    L4 = Link('revolute', DH(4,:));
    L5 = Link('revolute', DH(5,:));
    L6 = Link('revolute', DH(6,:));
    % compose robot links to create a robot
    myrobot = SerialLink([L1, L2, L3, L4, L5, L6]); 
end

