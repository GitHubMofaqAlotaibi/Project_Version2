user_quality = input('What is the quality input? ');

Quant_UV_Matrix = [17 18 24 47 99 99 99 99;
                   18 21 26 66 99 99 99 99;
                   24 26 56 99 99 99 99 99;
                   47 66 99 99 99 99 99 99;
                   99 99 99 99 99 99 99 99;
                   99 99 99 99 99 99 99 99;
                   99 99 99 99 99 99 99 99;
                   99 99 99 99 99 99 99 99;];
           
Quant_Empty = ones(8);
               
if user_quality >= 50
    scale = (100 - user_quality)/50;
else
    scale = 50/user_quality;
end

if scale ~= 0
    Quant_Values = round(Quant_UV_Matrix*scale);
else
    Quan_Values = Quant_Empty;
end

Quant_Values = uint8(Quant_Values);