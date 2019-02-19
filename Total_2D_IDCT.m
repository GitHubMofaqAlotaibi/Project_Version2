function [Out_Matrix] = Total_2D_IDCT(In_matrix)
%This function returns the output matrix for Phase II, Step 2.

for i = 1:8
    for j = 1:8
        Out_Matrix(i,j) = TwoD_IDCT(In_matrix, i, j);
    end
end

end