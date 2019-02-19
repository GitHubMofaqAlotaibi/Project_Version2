function [Output] = GroupProject_Phase2_Part2(Input)

RowCount = size(Input,1);
ColCount = size(Input,2);

for i = 1:8:(RowCount-10)
    for j = 1:8:(ColCount-10)
        Input(i:i+7, j:j+7, 1) = Total_2D_IDCT(Input(i:i+7, j:j+7, 1));
        Input(i:i+7, j:j+7, 2) = Total_2D_IDCT(Input(i:i+7, j:j+7, 2));
        Input(i:i+7, j:j+7, 3) = Total_2D_IDCT(Input(i:i+7, j:j+7, 3));
    end
end

Output = Input;

end