function [ om ] = ICV_rgb2grey( im )
    om = im(:,:,1) * 0.299 + im(:,:,2) * 0.587 + im(:,:,3) * 0.114;
end

