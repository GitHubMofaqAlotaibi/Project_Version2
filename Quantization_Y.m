user_quality = input('What is the quality input? ');

Quant_Y_Matrix = [16 11 10 16 24 40 51 61;
                  12 12 14 19 26 58 60 55;
                  14 13 16 24 40 57 69 56;
                  14 17 22 29 51 87 80 62;
                  18 22 37 56 68 109 103 77;
                  24 35 55 64 81 104 113 92;
                  49 64 78 87 103 121 120 101;
                  72 92 95 98 112 110 103 99;];

Quant_Empty = ones(8);
               
if user_quality >= 50
    scale = (100 - user_quality)/50;
else
    scale = 50/user_quality;
end

if scale ~= 0
    Quant_Values = round(Quant_Y_Matrix*scale);
else
    Quan_Values = Quant_Empty;
end

Quant_Values = double(Quant_Values);

A = imread('al_gray.jpg');
[row, colm] = size(A);
A = double(A);

DCT_Matrix = dct(eye(8));
IDCT_Matrix = DCT_Matrix';

for i = 1:8:row
    for j = 1:8:colm
        A_BLOCK = A(i:i+7, j:j+7);
        dct_value = DCT_Matrix.*A_BLOCK.*IDCT_Matrix;
        DCT_domain(i:i+7, j:j+7) = dct_value;
    end
end

for i = 1:8:row
    for j = 1:8:colm
        dct_value = DCT_domain(i:i+7, j:j+7);
        dct_value_Q = round(dct_value./Quant_Values);
        dct_Quant(i:i+7, j:j+7) = dct_value_Q;
    end
end

imshow(A); title(DCT-Image);

