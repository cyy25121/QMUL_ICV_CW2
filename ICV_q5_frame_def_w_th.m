function [ out ] = ICV_q5_frame_def_w_th( fr1, fr2, th)
    out = abs(fr2-fr1);
    out(out > th) = 255;
    out(out <= th) = 0;
end

