function q = deltajoint(delta)
    % TODO 1/2: Add proper documentation for this function.

    kuka = mykuka_search(delta);

    %-------------------------- Calibration ----------------------------%
    % TODO 2/2: Fill in values Xi and Qi for i = {1, 2, 3}. Xi are 3 by 1
    % column vectors, while Qi are 1 by 6 row vectors.
    
    % X1 = ...;
    % X2 = ...;
    % X3 = ...;
    % Q1 = ...;
    % Q2 = ...;
    % Q3 = ...;
    %-------------------------------------------------------------------%

    H1=forward_kuka(Q1, kuka);
    H2=forward_kuka(Q2, kuka);
    H3=forward_kuka(Q3, kuka);
    
    q=norm(H1(1:3,4)-X1)+norm(H2(1:3,4)-X2)+norm(H3(1:3,4)-X3);
end