function S = Skew(v)

    if length(v) ~= 3
        error('Please input 3 by 1 vector');
    end
    
    S = [0 -v(3) v(2);
        v(3) 0 -v(1);
        -v(2) v(1) 0];

end