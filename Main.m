%Execute Phase I, Part 1

[YY,CCb,CCr] = GroupProject_Phase1_Part1('al_color.jpg');

%Execute Phase I, Part 2

[SubY,SubCCb,SubCCr] = GroupProject_Phase1_Part2(YY,CCb,CCr);

%Execute Phase I, Parts 3 and 4

GroupProject_Phase1_Part3and4('Part_2_Y_subsample_411.jpg');
GroupProject_Phase1_Part3and4('Part_2_Cb_subsample_411.jpg');
GroupProject_Phase1_Part3and4('Part_2_Cr_subsample_411.jpg');

%Execute Phase II, Part 1

Y_Dequant = GroupProject_Phase2_Part1('Part_2_Y_subsample_411.jpg');
Cb_Dequant = GroupProject_Phase2_Part1('Part_2_Cb_subsample_411.jpg');
Cr_Dequant = GroupProject_Phase2_Part1('Part_2_Cr_subsample_411.jpg');

%Execute Phase II, Part 2

Y_IDCT = GroupProject_Phase2_Part2(Y_Dequant);
Cb_IDCT = GroupProject_Phase2_Part2(Cb_Dequant);
Cr_IDCT = GroupProject_Phase2_Part2(Cr_Dequant);

imwrite(Y_IDCT, 'Y_IDCT.jpg');
imwrite(Cb_IDCT, 'Cb_IDCT.jpg');
imwrite(Cr_IDCT, 'Cr_IDCT.jpg');

%Cb = CCb(:,:,2);
%imwrite(Cb, 'Cb_realimage.jpg');


%The following tests the logic of the program

%{
A = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11;
     12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22;
     23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33;
     34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44;
     45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55;
     56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66;
     67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77;
     78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88];
 
row_A_total = size(A,1);
col_A_total = size(A,2);
row_A = 1;
col_A = 1;
Test_1 = 0;

while row_A < (row_A_total - 1)
    while col_A < (col_A_total - 3)
        subsam_matrix = A(row_A:row_A+1, col_A:col_A+3, 1);
        subsample_411_A(row_A:row_A+1, col_A:col_A+3, :) = Ph_1_P_2_subsam(subsam_matrix);
        col_A = col_A + 4;
    end
    Test_1 = Test_1 + 1;
    row_A = row_A + 2;
    col_A = 1;
end

%}