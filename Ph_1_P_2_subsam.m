function [mat_out] = Ph_1_P_2_subsam(mat_in)
%mat_in is 2x4, mat_out is 2x4

mat_out = mat_in;

Line_1_value = mat_in(1,1);
Line_2_value = mat_in(2,1);

for j = 1:4
    mat_out(1,j) = Line_1_value;
    mat_out(2,j) = Line_2_value;
end

end