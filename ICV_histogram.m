function [ his ] = ICV_histogram( matrix, bins )
    mat_re = reshape(matrix, [], 1);
    his = zeros(1, bins);
    max_mat = max(mat_re);
    width = fix(max_mat/bins);
    for i=1:size(mat_re, 1)
        if (fix(mat_re(i, 1)/width) == bins)
            his(1, fix(mat_re(i, 1)/width)) = his(1, fix(mat_re(i, 1)/width)) + 1;
        else
            his(1, fix(mat_re(i, 1)/width)+1) = his(1, fix(mat_re(i, 1)/width)+1) + 1;
        end
    end
end

