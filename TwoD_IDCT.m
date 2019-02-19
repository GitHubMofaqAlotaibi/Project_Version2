function [Out_Term] = TwoD_IDCT(In_matrix, i, j)
%This function returns a member of the 8 x 8 output matrix for Phase II,
%step 2
%In_matrix is the 8x8 dequantized matrix from step 1.
%i and j are the coordinates of the current member being calculated.

Out_Term = 0;

for u = 0:7
    for v = 0:7
        u_prime = u + 1;
        v_prime = v + 1;
        i_prime = i - 1;
        j_prime = j - 1;
        First_term = C_func_IDCT(u) * C_func_IDCT(v) * (1/4);
        Second_term = cos(((2*i_prime)+1) * u * pi * (1/16));
        Third_term = cos(((2*j_prime)+1) * v * pi * (1/16));
        Fourth_term = In_matrix(u_prime,v_prime);
        Final_term = First_term * Second_term * Third_term * Fourth_term;
        Out_Term = Out_Term + Final_term;
    end
end

end