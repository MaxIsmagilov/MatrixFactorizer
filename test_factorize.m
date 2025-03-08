% Matrix tests

function t = test_factorize(A)
    [l,u] = get_l_u(A);
    if (norm(l * u - A) < 1e-4)
        printf("A=LU Test Passed!\n")
    else
        printf("A=LU Test Failed!\n")
    end

    [l,d,u] = get_l_d_u(A);
    if (norm(l * d * u - A) < 1e-4)
        printf("A=LDU Test Passed!\n")
    else
        printf("A=LDU Test Failed!\n")
        l
        d
        u
        l * d * u
    end
end