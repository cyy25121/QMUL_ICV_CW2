function [ outImg ] = ICV_BackgroundSub( im1, im2 )
    sz = size(im1);
    outImg = uint8(zeros(sz(1), sz(2)));
    for i=1:sz(1)
        for j=1:sz(2)
            %if(im1(i,j) ~= im2(i,j))
                outImg(i,j) = abs(im2(i,j)-im1(i,j));
            %else
            %    outImg(i,j) = 0;
            %end
        end
    end


end

