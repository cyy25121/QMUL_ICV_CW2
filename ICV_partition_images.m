function [ outImg ] = ICV_partition_images( inputIm , ws, idx, idy);
    size_im = size(inputIm);
    outImg = zeros(ws, ws);
    for i=1:ws:size_im(1)-ws+1
        for j=1:ws:size_im(2)-ws+1
            if( idx == fix(i/ws)+1 && idy == fix(j/ws)+1)
                outImg = inputIm(i:i+ws, j:j+ws);
            end
        end
    end
end
