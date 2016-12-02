function [ outImg ] = ICV_partition_images( inputIm , ws, idx, idy)
% Function: ICV_partition_images
% Input:
%       inputIm: Input image
%       ws: Window size
%       idx, idy: specific window
% Output:
%       outImg: Output image
    size_im = size(inputIm);
    outImg = zeros(ws, ws);
    for i=1:ws:size_im(1)-ws+1
        for j=1:ws:size_im(2)-ws+1
            % Partition the image at specific index
            if( idx == fix(i/ws)+1 && idy == fix(j/ws)+1)
                outImg = inputIm(i:i+ws, j:j+ws);
            end
        end
    end
end
