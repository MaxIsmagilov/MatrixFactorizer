% tests a multitude of matrix factorizations

printf("01: 2x2 Matrix tests (should work)\n")
try
    A = [ 4, 0; 5, 3 ]
    test_factorize(A);
catch 
    printf("Caught error: %s\n", lasterror.message)
end

printf("02: 2x2 Matrix tests (should work)\n")
try
    A = [ 5, 6; 4, 3 ]
    test_factorize(A);
catch 
    printf("Caught error: %s\n", lasterror.message)
end

printf("\n03: 3x3 Matrix tests (should work)\n")
try
    A = [ 5, 6, 6; 4, 3, 3; 1, 2, 3]
    test_factorize(A);
catch 
    printf("Caught error: %s\n", lasterror.message)
end

printf("\n04: 3x3 Matrix tests (should work)\n")
try
    A = [ 1, 2, 3; 4, 5, 6; 3, 1, 2]
    test_factorize(A);
catch 
    printf("Caught error: %s\n", lasterror.message)
end

printf("\n05: 4x4 Matrix tests (should work)\n")
try
    A = [ 1, 4, 7, 9; 1, 1, 1, 1; 2, 3, 1, 6; 8, 9, 2, 3 ]
    test_factorize(A);
catch 
    printf("Caught error: %s\n", lasterror.message)
end

printf("\n06: 5x5 Matrix tests (should work)")
try
    A = [ 1, 2, 3, 4, 5; 6, 7, 9, 8, 2; 2, 3, 1, 1, 1; 5, 1, 2, 8, 0; 1, 7, 2, 2, 4 ]
    test_factorize(A);
catch 
    printf("Caught error: %s\n", lasterror.message)
end

printf("\n07: 2x3 Matrix tests (should fail: not square)\n")
try
    A = [ 1, 2, 0; 4, 5, 1 ]
    test_factorize(A);
catch 
    printf("Caught error: %s\n", lasterror.message)
end

printf("\n08: 3x3 Matrix tests (should fail: zero in last pivot)\n")
try
    A = [ 1, 2, 0; 4, 5, 0; 0, 1, 0 ]
    test_factorize(A);
catch 
    printf("Caught error: %s\n", lasterror.message)
end

printf("\n09: 4x4 Matrix tests (should fail: requires row exchange)\n")
try
    A = [ 5, 6, 6, 6; 4, 3, 3, 3; 3, 2, 2, 2; 1, 2, 3, 4]
    test_factorize(A);
catch 
    printf("Caught error: %s\n", lasterror.message)
end

printf("\n10: 1x1 Matrix test (should work)\n")
try
    A = [5]
    test_factorize(A);
catch
    printf("Caugt error: %s\n", lasterror.message)
end
