function [x] = generate_x ( b_im )

% sort b_im along col
[x.sortedImgPixel , x.originalPixelIndex] = sort(b_im , 2);
x.sortedImgPixel = int16(x.sortedImgPixel);