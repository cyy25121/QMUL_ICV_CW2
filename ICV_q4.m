%% Qurstion4: Motion estimation
% Dataset: DatasetC
clc; clear;
disp('Intorduction of Computer Vision Coursework 2 - Q4: Motion estimation');  


%% (a)
drawArrow = @(x,y) quiver( x(1),y(1),(x(2)-x(1)),(y(2)-y(1)), 3, 'r', 'MaxHeadSize', 100); 
v = VideoReader('Dataset/DatasetC.mpg');
[fr1, fr2] = ICV_q4_pickframes(v, 100, 101);

block_size = 16; windows_size = 20;

[mf_b16_w20, sum_b16_w20] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
figure('Name', 'I'); imshow(fr1);
figure('Name', 'I+1'); imshow(fr2);
figure('Name', 'Motion Field'); imshow(fr1); hold on;
for idx=1:size(mf_b16_w20)
    if mf_b16_w20(idx, 1) ~= mf_b16_w20(idx, 3) || mf_b16_w20(idx, 2) ~= mf_b16_w20(idx, 4)
        rectangle('Position', [mf_b16_w20(idx, 2) mf_b16_w20(idx, 1) block_size block_size], 'EdgeColor', 'b')
        rectangle('Position', [mf_b16_w20(idx, 4) mf_b16_w20(idx, 3) block_size block_size], 'EdgeColor', 'r')
        drawArrow([mf_b16_w20(idx, 2) mf_b16_w20(idx, 4)] + block_size/2, [mf_b16_w20(idx, 1) mf_b16_w20(idx, 3) ] + block_size/2);
    end
end

%% (b)
fr2p_b16_w20 = ICV_q4_predict(fr1, mf_b16_w20, block_size);
figure('Name', 'I+1'); imshow(fr2);
figure('Name', 'P+1'); imshow(fr2p_b16_w20);

%% (c)
t_ag_b = zeros(1, 3);
tic
% Block size = 4, Windows size = 16
block_size = 4; windows_size = 16;
[mf_w16_b4, sum_w16_b4] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
fr2p_w16_b4 = ICV_q4_predict(fr1, mf_w16_b4, block_size);
figure('Name', 'P+1 of 4x4'); imshow(fr2p_w16_b4);
t_ag_b(1) = toc;
% Block size = 8, Windows size = 16
block_size = 8; windows_size = 16;
[mf_w16_b8, sum_w16_b8] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
fr2p_w16_b8 = ICV_q4_predict(fr1, mf_w16_b8, block_size);
figure('Name', 'P+1 of 8x8'); imshow(fr2p_w16_b8);
t_ag_b(2) = toc;
% Block size = 16, Windows size = 16
block_size = 16; windows_size = 16;
[mf_w16_b16, sum_w16_b16] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
fr2p_w16_b16 = ICV_q4_predict(fr1, mf_w16_b16, block_size);
figure('Name', 'P+1 of 16x16'); imshow(fr2p_w16_b16);
t_ag_b(3) = toc;
%% (d)
tic
t_ag_w = zeros(1, 3);
% Block size = 8, window size = 8
block_size = 8; windows_size = 8;
[mf_b8_w8, sum_b8_w8] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
fr2p_w8_b8 = ICV_q4_predict(fr1, mf_b8_w8, block_size);
figure('Name', 'P+1 of 8x8'); imshow(fr2p_w8_b8);
t_ag_w(1) = toc;
% Block size = 8, window size = 16
block_size = 8; windows_size = 16;
[mf_b8_w16, sum_b8_w16] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
fr2p_w8_b16 = ICV_q4_predict(fr1, mf_b8_w16, block_size);
figure('Name', 'P+1 of 16x16'); imshow(fr2p_w8_b16);
t_ag_w(2) = toc;
% Block size = 8, window size = 32
block_size = 8; windows_size = 32;
[mf_b8_w32, sum_b8_w32] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
fr2p_w8_b32 = ICV_q4_predict(fr1, mf_b8_w32, block_size);
figure('Name', 'P+1 of 32x32'); imshow(fr2p_w8_b32);
t_ag_w(3) = toc;
%% (e)
figure;
xTitle = {'4'; '8'; '16'};
x=1:3;
%subplot(1, 2, 1);
bar(t_ag_b);
title('Execution time against the block size (Window size = 16)'); 
ylabel('Secs');
xlabel('Block size');
set(gca,'xticklabel',xTitle);
figure;
xTitle = {'8'; '16'; '32'};
x=1:3;
%subplot(1, 2, 2);
bar(x, t_ag_w);
title('Execution time against the search window size (Block size = 8)'); 
ylabel('Secs');
xlabel('Window size');
set(gca,'xticklabel',xTitle);
