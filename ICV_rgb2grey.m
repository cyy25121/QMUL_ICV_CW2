function [ om ] = ICV_rgb2grey( im )
% Function: ICV_rgb2grey
% Input: A three dimentional matrix in rgb scale
% Output: A two dimentional matrix in greyscale
% Transfer rgb image to grey image
    om = im(:,:,1) * 0.299 + im(:,:,2) * 0.587 + im(:,:,3) * 0.114;
end
