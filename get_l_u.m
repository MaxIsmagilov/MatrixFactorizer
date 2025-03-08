function [lower_t, upper_t] = get_l_u(A)
    
    % find the size of the matrix
    sz = size(A);

    % create the initial L matrix which is just I so that it can be multiplied to
    lower_t = eye(sz(1));

    % create the upper-triangular start upper_t which is to be eliminated
    upper_t = A;

    % check if the matrix is square
    if (sz(1) != sz(2))
        error("ONLY SQUARES, PLEASE!")
    end

    % start eliminating by column
    for i = 1:(sz(1)-1)

        % start eliminating rows within the column

        % throw if the pivot is zero
        if (upper_t(i,i) == 0)
            error("MATRIX REQUIRES ROW EXCHANGE")
        end

        % create E and L as I so that l_(i,n) can modify them
        e_i = eye(sz(1));
        l_i = eye(sz(1));

        % loop over each row
        for j = (i+1):sz(1)

            % find what the row i needs to be multiplied by to elimnate row j
            mul = upper_t(j,i)/upper_t(i,i);

            % populate e_i and l_i so that e_i eliminates column i and l_i = e_i^-1
            e_i(j,i) = -mul; 
            l_i(j,i) = mul;
        end

        % multiply the matrices to approach the upper and lower triangular matrices
        upper_t = e_i * upper_t;
        lower_t = lower_t * l_i;
    end

    % if zero is in the last pivot, throw
    if (upper_t(sz(1), sz(1)) == 0)
        error("ZERO IN LAST PIVOT")
    end
end