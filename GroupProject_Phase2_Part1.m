function [Output] = GroupProject_Phase2_Part1(fname)

Input = imread(fname);
Input = double(Input);

Dequant_Matrix = [ 16 11 10 16 24 40 51 61;
                   12 12 14 19 26 58 60 55;
                   14 13 16 24 40 57 69 56;
                   14 17 22 29 51 87 80 62;
                   18 22 37 56 68 109 103 77;
                   24 35 55 64 81 104 113 92;
                   49 64 78 87 103 121 120 101;
                   72 92 95 98 112 110 103 99;];

rowCount = size(Input, 1);
colCount = size(Input, 2);

for i = 1:8:(rowCount-10)
    for j = 1:8:(colCount-10)
        Input(i:i+7, j:j+7, 1) = Input(i:i+7, j:j+7, 1) .* Dequant_Matrix;
        Input(i:i+7, j:j+7, 1) = Input(i:i+7, j:j+7, 2) .* Dequant_Matrix;
        Input(i:i+7, j:j+7, 1) = Input(i:i+7, j:j+7, 3) .* Dequant_Matrix;
    end
end

Output = Input;

end