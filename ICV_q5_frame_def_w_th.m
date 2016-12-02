function [ diff_w_th, diff] = ICV_q5_frame_def_w_th( fr1, fr2, th)
% Function: ICV_q5_frame_def_w_th
% Input:
%       fr1, fr2: Two input frames
%       th: Threshold for image thresholding
% Output: 
%       diff_w_th: Frame differencing with threshold
%       diff: Frame differencing
    diff = abs(fr2-fr1);
    diff_w_th= diff;
    diff_w_th(diff_w_th > th) = 255;
    diff_w_th(diff_w_th <= th) = 0;
end
