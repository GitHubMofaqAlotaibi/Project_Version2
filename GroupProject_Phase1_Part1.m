function [YY,CCb,CCr] = GroupProject_Phase1_Part1(fname) 
% Transformation matrix to YCbCr and offset if RGB is [0,1]
T = [65.481   128.553   24.966;...
    -37.797   -74.203   112; ...
     112      -93.786  -18.214]; 
offT = [16;128;128];

% Read image
RGB = imread(fname); 

RED = RGB(:,:,1);
GREEN = RGB(:,:,2);
BLUE = RGB(:,:,3);
 
% Collect RGB channel data ( normed to [0,1] )
R = double(RGB(:,:,1))/255; % red channel 
G = double(RGB(:,:,2))/255; % green channel
B = double(RGB(:,:,3))/255; % blue channel
 
% Allocate space for output
% 127*127*3 matrics are used as offsets for the visualization
% if for example Cb is > 127 then blue is the dominant color and if Cb <=
% 127 then yellow is dominant color. Same applies for Cr (red, cyan).
% The Y channel remains grayscale as for visual representation.
YCbCr = RGB;
Y  = uint8(127*ones(size(RGB)));    
Cb = uint8(127*ones(size(RGB)));
Cr = uint8(127*ones(size(RGB)));
 
% Do direct transform (RGB to YCbCr) and update corresponding channel
for k = 1:3
    YCbCr(:,:,k) =  T(k,1)*R + T(k,2)*G + T(k,3)*B + offT(k);
end
Y(:,:,1)  = YCbCr(:,:,1);   % update channel Y
Cb(:,:,2) = YCbCr(:,:,2);   % update channel Cb
Cr(:,:,3) = YCbCr(:,:,3);   % update channel Cr
 
% Do inverse transform (YCbCr to RGB) by simply 
% ycbcr = T*rgb + offset (direct)
%   rgb = T^(-1)*ycbcr - T^(-1)*offset (inverse)
invT = pinv(T);
invoffT = invT*offT;
YY = Y; CCb = Cb; CCr = Cr;     % allocate space
for k = 1:3 % channel Y
    res = invT(k,1)*double(Y(:,:,1)) + ...
          invT(k,2)*double(Y(:,:,2)) + ...
          invT(k,3)*double(Y(:,:,3)) - invoffT(k);
    YY(:,:,k) = uint8(res*255); % scale from [0,1] to [0,255]
end
 
for k = 1:3 % channel Cb
    res = invT(k,1)*double(Cb(:,:,1)) + ...
          invT(k,2)*double(Cb(:,:,2)) + ...
          invT(k,3)*double(Cb(:,:,3)) - invoffT(k);
    CCb(:,:,k) = uint8(res*255); % scale from [0,1] to [0,255]
end
 
for k = 1:3 % channel Cr
    res = invT(k,1)*double(Cr(:,:,1)) + ...
          invT(k,2)*double(Cr(:,:,2)) + ...
          invT(k,3)*double(Cr(:,:,3)) - invoffT(k);
    CCr(:,:,k) = uint8(res*255); % scale from [0,1] to [0,255]
end
 
imwrite(YCbCr, 'Part_1_YCbCrImage.jpg');
imwrite(YY, 'Part_1_YImage.jpg');
imwrite(CCb, 'Part_1_CBImage.jpg');
imwrite(CCr, 'Part_1_CRImage.jpg');

end