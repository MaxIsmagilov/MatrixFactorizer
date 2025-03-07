function [lower_t, diagonal, upper_t] = get_l_d_u(A)
    sz = size(A);
    lower_t = eye(sz(1));
    upper_t = A;
    diagonal = eye(sz(1));
    if (sz(1) != sz(2))
        error("ONLY SQUARES, PLEASE!")
    end
    for i = 1:(sz(1)-1)
        if (upper_t(i,i) == 0)
            error("MATRIX REQUIRES ROW EXCHANGE OR IS NOT INVERTIBLE")
        end
        e_i = eye(sz(1));
        l_i = eye(sz(1));
        for j = (i+1):sz(1)
            mul = upper_t(j,i)/upper_t(i,i);
            e_i(j,i) = -mul; 
            l_i(j,i) = mul;
        end
        upper_t = e_i * upper_t;
        lower_t = lower_t * l_i;
    end
    if (upper_t(sz(1), sz(1)) == 0)
        error("ZERO IN LAST PIVOT")
    end
    for i = 1:sz(1)
        diagonal(i,i) = upper_t(i,i)
        upper_t(i,:) /= diagonal(i,i)
    end
end