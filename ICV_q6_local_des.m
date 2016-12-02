function [ local_d , sum] = ICV_q6_local_des( im, ws )
    size_im = size(im);
    im_f_zeros = uint8(zeros(size_im(1) + 2, size_im(2) + 2));
    im_f_zeros(2:1+size_im(1), 2:1+size_im(2)) = im;
    local_d = cell(fix(size_im(1)/ws), fix(size_im(2)/ws));
    sum = 0;
    for i=1:ws:size_im(1)-ws+1
        for j=1:ws:size_im(2)-ws+1
            ip = i + 1;
            jp = j + 1;
            sum = sum + 1;
            % for each window
            local_dw = zeros(ws, ws);
            for a=ip:ip+ws-1
                for b=jp:jp+ws-1
                    local_dw(a-ip+1, b-jp+1) = bi2de(ICV_q6_lbp_2_binary(im_f_zeros(a-1:a+1, b-1:b+1)));
                end
            end
            local_d{fix(i/ws)+1, fix(j/ws)+1} = local_dw;
        end
    end
end
