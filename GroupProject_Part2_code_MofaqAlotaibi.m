imRGB = imread('Image.jpg');
figure, imshow(imRGB), title('RGB Full Image');
imYIQ = rgb2ntsc(imRGB);
for i=1:1000
% Subsample the I and Q Channels 4:4:4 and 4:1:1Type Subsampling
imYIQsubI = imresize(imYIQ(:,:,2),0.5,'nearest');
imYIQsubQ = imresize(imYIQ(:,:,3),0.5,'nearest');
% We have have size image so resample back up
imYIQupsampI = imresize(imYIQsubI,2);
imYIQupsampQ = imresize(imYIQsubQ,2);
imYIQ(:,:,2) = imYIQupsampI;
imYIQ(:,:,3) = imYIQupsampQ;
end
% Remake RGB and show
reconstruct_imRGB = uint8(256*ntsc2rgb(imYIQ));
figure, imshow(reconstruct_imRGB); title('Reconstructed (1000 Iterations) RGB Full Image');
% show R,G,B plane errors
figure, imshow(256*abs(imRGB(:,:,1) - reconstruct_imRGB(:,:,1)));
title('Reconstructed (1000 Iterations) R Error');
figure, imshow(256*abs(imRGB(:,:,2) - reconstruct_imRGB(:,:,2)));
title('Reconstructed (1000 Iterations) G Error');
figure, imshow(256*abs(imRGB(:,:,3) - reconstruct_imRGB(:,:,3)));
title('Reconstructed (1000 Iterations) B Error');