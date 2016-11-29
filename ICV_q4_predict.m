function [ fr2p ] = ICV_q4_predict(fr1, mf, bs)
    block_size = bs;
    fr2p = uint8(zeros(size(fr1)));
    
    mf_size = size(mf);

    for idx=1:mf_size(1)
        fr2p(mf(idx, 3):mf(idx, 3) + block_size, mf(idx, 4):mf(idx, 4) + block_size, :) = fr1(mf(idx, 1):mf(idx, 1) + block_size, mf(idx, 2):mf(idx, 2) + block_size, :);
    end
end

