function [MSE] = MSE_compute(I,Ibar)
% this function calcluates the error between the Original Frame and the
% output frame.  

%--- Input --- 
% I: Original Frame
% Ibar: Output Frame

% --- Output ---
% MSE: Mean Squar Error

% Find the size of Frame
% N: row of frame
% M: column of frame

[N, M] = size(I);
% error summation initial value
ee = 0;
% outer for loop 
for y = 1:M
%     inner loop
    for x = 1:N
%         calculating the error summation 
        ee = ee + (I(x,y) - Ibar(x,y))^2;
    end
end

% Mean Sqaure Error
MSE = 1/(M*N)*ee;
