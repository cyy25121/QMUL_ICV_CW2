function [ fr2p ] = ICV_q4_predict(fr1, mf, bs)
% Function: ICV_q4_predict
% Input:
%       fr1: Orignal frame
%       mf: Motion field, a bunch of motion vectors
%       bs: Block size
% Output:
%       fr2p: Predicted frame
    block_size = bs;
    fr2p = uint8(zeros(size(fr1)));

    mf_size = size(mf);

    for idx=1:mf_size(1)
        fr2p(mf(idx, 3):mf(idx, 3) + block_size, mf(idx, 4):mf(idx, 4) + block_size, :) = fr1(mf(idx, 1):mf(idx, 1) + block_size, mf(idx, 2):mf(idx, 2) + block_size, :);
    end
end
