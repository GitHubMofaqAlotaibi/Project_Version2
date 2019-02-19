function [subsample_411_Y,subsample_411_Cb,subsample_411_Cr] = GroupProject_Phase1_Part2(YY,CCb,CCr)

%Initialize results (the subsampled matrices)

subsample_411_Y = YY;
subsample_411_Cb = CCb;
subsample_411_Cr = CCr;

%Perform 4:1:1 subsampling on Y matrix

row_Y_total = size(YY,1);
col_Y_total = size(YY,2);
row_Y = 1;
col_Y = 1;

while row_Y < (row_Y_total - 1)
    while col_Y < (col_Y_total - 3)
        subsam_matrix = YY(row_Y:row_Y+1, col_Y:col_Y+3, 1);
        subsample_411_Y(row_Y:row_Y+1, col_Y:col_Y+3, 1) = Ph_1_P_2_subsam(subsam_matrix);
        subsam_matrix = YY(row_Y:row_Y+1, col_Y:col_Y+3, 2);
        subsample_411_Y(row_Y:row_Y+1, col_Y:col_Y+3, 2) = Ph_1_P_2_subsam(subsam_matrix);
        subsam_matrix = YY(row_Y:row_Y+1, col_Y:col_Y+3, 3);
        subsample_411_Y(row_Y:row_Y+1, col_Y:col_Y+3, 3) = Ph_1_P_2_subsam(subsam_matrix);
        col_Y = col_Y + 4;
    end
    row_Y = row_Y + 2;
    col_Y = 1;
end

%Perform 4:1:1 subsampling on Cb matrix

row_Cb_total = size(CCb,1);
col_Cb_total = size(CCb,2);
row_Cb = 1;
col_Cb = 1;

while row_Cb < (row_Cb_total - 1)
    while col_Cb < (col_Cb_total - 3)
        subsam_matrix = CCb(row_Cb:row_Cb+1, col_Cb:col_Cb+3, 1);
        subsample_411_Cb(row_Cb:row_Cb+1, col_Cb:col_Cb+3, 1) = Ph_1_P_2_subsam(subsam_matrix);
        subsam_matrix = CCb(row_Cb:row_Cb+1, col_Cb:col_Cb+3, 2);
        subsample_411_Cb(row_Cb:row_Cb+1, col_Cb:col_Cb+3, 2) = Ph_1_P_2_subsam(subsam_matrix);
        subsam_matrix = CCb(row_Cb:row_Cb+1, col_Cb:col_Cb+3, 3);
        subsample_411_Cb(row_Cb:row_Cb+1, col_Cb:col_Cb+3, 3) = Ph_1_P_2_subsam(subsam_matrix);
        col_Cb = col_Cb + 4;
    end
    row_Cb = row_Cb + 2;
    col_Cb = 1;
end

%Perform 4:1:1 subsampling on Cr matrix

row_Cr_total = size(CCr,1);
col_Cr_total = size(CCr,2);
row_Cr = 1;
col_Cr = 1;

while row_Cr < (row_Cr_total - 1)
    while col_Cr < (col_Cr_total - 3)
        subsam_matrix = CCr(row_Cr:row_Cr+1, col_Cr:col_Cr+3, 1);
        subsample_411_Cr(row_Cr:row_Cr+1, col_Cr:col_Cr+3, 1) = Ph_1_P_2_subsam(subsam_matrix);
        subsam_matrix = CCr(row_Cr:row_Cr+1, col_Cr:col_Cr+3, 2);
        subsample_411_Cr(row_Cr:row_Cr+1, col_Cr:col_Cr+3, 2) = Ph_1_P_2_subsam(subsam_matrix);
        subsam_matrix = CCr(row_Cr:row_Cr+1, col_Cr:col_Cr+3, 3);
        subsample_411_Cr(row_Cr:row_Cr+1, col_Cr:col_Cr+3, 3) = Ph_1_P_2_subsam(subsam_matrix);
        col_Cr = col_Cr + 4;
    end
    row_Cr = row_Cr + 2;
    col_Cr = 1;
end

%Write results to files

imwrite(subsample_411_Y, 'Part_2_Y_subsample_411.jpg');
imwrite(subsample_411_Cb, 'Part_2_Cb_subsample_411.jpg');
imwrite(subsample_411_Cr, 'Part_2_Cr_subsample_411.jpg');

end