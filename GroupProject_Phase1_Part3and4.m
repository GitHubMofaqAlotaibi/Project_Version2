function [] = GroupProject_Phase1_Part3and4(fname)
im = imread(fname);
[row, colm] = size(im);
im = double(im);

user_quality = input('What is the quality input? ');

QMatrix = [16 11 10 16 24 40 51 61;
           12 12 14 19 26 58 60 55;
           14 13 16 24 40 57 69 56;
           14 17 22 29 51 87 80 62;
           18 22 37 56 68 109 103 77;
           24 35 55 64 81 104 113 92;
           49 64 78 87 103 121 120 101;
           72 92 95 98 112 110 103 99;];

Quant_Empty = ones(8);
               
if user_quality >= 50
    QXMatrix = round(QMatrix.*Quant_Empty*((100 - user_quality)/50));
    QXMatrix = uint8(QXMatrix);
else
    QXMatrix = round(QMatrix.*Quant_Empty*(50/user_quality));
    QXMatrix = uint8(QXMatrix); 
end

dct = dctmtx(8);
idct = dct';

dct_restore = zeros(row, colm);
QXMatrix = double(QXMatrix);

for i = (1:8:row-10)
    for j = (1:8:colm-10)
        BLOCK = im(i:i+7, j:j+7);
        res = dct*BLOCK*idct;
        dct_dom(i:i+7, j:j+7) = res;
    end
end

for i = (1:8:row-10)
    for j = (1:8:colm-10)
        res = dct_dom(i:i+7, j:j+7);
        result = round(res./QXMatrix);
        dct_quant(i:i+7, j:j+7) = result;
    end
end

end