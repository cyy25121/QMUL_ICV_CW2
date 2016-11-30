function [ motion_vector, sum ] = ICV_q4_kernel( fr1, fr2, wsize, bsize )
%% Parameter
    window_size = wsize;
    block_size = bsize;
    diff_size = (window_size) / 2;
    MSE_TH = 1;
%% Kernel
    fr1_size = size(fr1); fr2_size = size(fr2);
    sum = 0;
    motion_vector = [];

    for i=1:block_size:fr1_size(1)
        for j=1:block_size:fr1_size(2)
            %fprintf('Block location: %d %d\n', i, j);
            if(i + block_size <= fr1_size(1) && j + block_size <= fr1_size(2))
                min_mse = 9999;
                for a=i-diff_size:i+diff_size
                    for b=j-diff_size:j+diff_size
                        if(a >= 1 && b >= 1 && a + block_size <= fr1_size(1) && b + block_size <= fr1_size(2))
                            mse = ICV_MSE(fr1(i:i+block_size, j:j+block_size), fr2(a:a+block_size, b:b+block_size));
                            if mse < min_mse
                                min_mse = mse;
                                min_mse_idx = [a, b];
                            end
                            sum = sum + 1;
                        end
                    end
                end
                motion_vector = [motion_vector; [i j min_mse_idx(1) min_mse_idx(2)]];
                %if min_mse <= MSE_TH
                %    min_mse_idx = [i, j];
                %end
                %if(i ~= min_mse_idx(1) || j ~= min_mse_idx(2))
                    %rectangle('Position', [j i block_size block_size], 'EdgeColor', 'b')
                    %rectangle('Position', [min_mse_idx(2) min_mse_idx(1) block_size block_size], 'EdgeColor', 'r')
                    %drawArrow([j min_mse_idx(2)] + block_size/2, [i min_mse_idx(1) ] + block_size/2);

                %end
            end
        end
    end
end
