function [ global_d ] = ICV_q6_global_des( im )
% Function: ICV_q6_global_des
% Input: 2-D matrix
% Output: Global descriptor of whole image, a Cell{1,1} structure
    size_im = size(im);
    im_f_zeros = uint8(zeros(size_im(1) + 2, size_im(2) + 2));
    im_f_zeros(2:1+size_im(1), 2:1+size_im(2)) = im;
    global_d = cell(1, 1);
    global_dw = zeros(size_im);
    for i=1:size_im(1)
        for j=1:size_im(2)
            ip = i + 1;
            jp = j + 1;
            global_dw(i, j) = bi2de(ICV_q6_lbp_2_binary(im_f_zeros(ip-1:ip+1, jp-1:jp+1)));
        end
    end
    global_d{1,1} = global_dw;
end
