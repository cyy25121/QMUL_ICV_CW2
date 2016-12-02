function [ his ] = ICV_histogram( matrix, bins )
% Function: ICV_histogram
% Input:
%       matrix: Data
%       bins: Bins in histogram
% Output:
%       his: Occurence
    mat_re = reshape(matrix, [], 1);
    his = zeros(1, bins);
    max_mat = max(mat_re);
    width = fix(max_mat/bins);
    for i=1:size(mat_re, 1)
        % Check if the data is over the bin size
        if (fix(mat_re(i, 1)/width) == bins)
            his(1, fix(mat_re(i, 1)/width)) = his(1, fix(mat_re(i, 1)/width)) + 1;
        else
            his(1, fix(mat_re(i, 1)/width)+1) = his(1, fix(mat_re(i, 1)/width)+1) + 1;
        end
    end
end

