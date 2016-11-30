function [ outImg ] = ICV_q5_gaussian_filter( inImg )
    size_in = size(inImg);
    kernel = [1 2 1; 2 4 2; 1 2 1] / 16;
    inImg_f_zeros = uint8(zeros(size_in(1) + 2, size_in(2) + 2));
    inImg_f_zeros(2:1+size_in(1), 2:1+size_in(2)) = inImg;
    outImg = uint8(zeros(size_in));
    for i=1:size_in(1)
        for j=1:size_in(2)
            tmp = 0;
            ip = i + 1;
            jp = j + 1;
            for a=ip-1:ip+1
                for b=jp-1:jp+1
                    tmp = tmp + kernel(a-(ip-1)+1, b-(jp-1)+1) * inImg_f_zeros(ip, jp);
                end
            end
            outImg(i,j) = uint8(tmp);
        end
    end
end
