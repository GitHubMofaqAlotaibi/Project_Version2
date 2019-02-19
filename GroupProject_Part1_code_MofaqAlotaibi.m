% RGB to YCbCr with Matlab
I = imread('Image.jpg');
figure(1), imshow(I);
% RGB to YCbCr with Matlab
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
figure(2), imshow(R), figure(3),imshow(G),figure(4), imshow(B);
% RGB to YCbCr with Matlab
I2 = rgb2ycbcr(I);
Y = I2(:,:,1);
Cb = I2(:,:,2);
Cr = I2(:,:,3);
figure(5),imshow(I2), figure(6), imshow(Y), figure(7), imshow(Cb),figure(8), imshow(Cb);