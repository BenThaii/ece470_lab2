function H = forward_kuka(joint, myrobot)
    % use robotics toolkit as a shortcut to find H06
    H = myrobot.A([1,2,3,4,5,6], joint).double;
end