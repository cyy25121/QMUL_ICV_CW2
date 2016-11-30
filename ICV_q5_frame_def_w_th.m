function [ diff_w_th, diff] = ICV_q5_frame_def_w_th( fr1, fr2, th)
    diff = abs(fr2-fr1);
    diff_w_th= diff;
    diff_w_th(diff_w_th > th) = 255;
    diff_w_th(diff_w_th <= th) = 0;
end
