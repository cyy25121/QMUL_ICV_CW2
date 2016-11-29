%% Read data
% Qurstion4: Motion estimation
% Dataset: DatasetC
disp('Intorduction of Computer Vision Coursework 2 - Q4: Motion estimation');  
clc; clear;
drawArrow = @(x,y) quiver( x(1),y(1),(x(2)-x(1)),(y(2)-y(1)), 3, 'r', 'MaxHeadSize', 100); 
%% Background
v = VideoReader('Dataset/DatasetC.mpg');
[bg, outImg, ~] = ICV_Background(v);

%% Run

%if(hasFrame(v))
%    fr1 = readFrame(v);
%    figure; imshow(fr1); 
%end
%if(hasFrame(v))
%    fr2 = readFrame(v);
%    figure; imshow(fr2); hold on
%end
v = VideoReader('Dataset/DatasetC.mpg');
drawArrow = @(x,y) quiver( x(1),y(1),(x(2)-x(1)),(y(2)-y(1)), 3, 'r', 'MaxHeadSize', 100);   
preFr = readFrame(v);
%preFr = snapshot(cam);
preFrg = preFr(:,:,1) * 0.299 + preFr(:,:,2) * 0.587 + preFr(:,:,3) * 0.114;
k = 0;
while(hasFrame(v))
    curFr = readFrame(v);
    %curFr = snapshot(cam);
    curFrg = curFr(:,:,1) * 0.299 + curFr(:,:,2) * 0.587 + curFr(:,:,3) * 0.114;
    imshow(curFrg); hold on;
    video_size = size(preFr);
    sum = 0;

for i=1:16:video_size(1)
    for j=1:16:video_size(2)
        %fprintf('Block location: %d %d\n', i, j);
        if(i+16 <= video_size(1) && j+16 <= video_size(2))
            min = 9999;
            for a=i-2:i+2
                for b=j-2:j+2
                    if(a >= 1 && b >= 1 && a + 16 <= video_size(1) && b + 16 <= video_size(2))
                        m = ICV_MSE(preFrg(i:i+16, j:j+16), curFrg(a:a+16, b:b+16));
                        if m < min
                            min = m;
                            min_m = [a, b];
                        end
                        sum = sum + 1;
                    end
                end 
            end
            %plot([j min_m(2)]+8, [i min_m(1)]+8, 'LineWidth', 3)
            
            if(i ~= min_m(1) || j ~= min_m(2))
                rectangle('Position', [j i 16 16], 'EdgeColor', 'b')
                rectangle('Position', [min_m(2) min_m(1) 16 16], 'EdgeColor', 'r')
                drawArrow([j min_m(2)]+8, [i min_m(1) ]+8);
            end
        end
    end
end
    hold off;
    preFr = curFr;
    preFrg = curFrg;
end

%% Run CW Kernel
% (a)
v = VideoReader('Dataset/DatasetC.mpg');
[fr1, fr2] = ICV_q4_pickframes(v, 100, 101);

block_size = 16; windows_size = 20;

[mf_b16_w20, sum_b16_w20] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
figure; imshow(fr1); hold on;
for idx=1:size(mf_b16_w20)
    if mf_b16_w20(idx, 1) ~= mf_b16_w20(idx, 3) || mf_b16_w20(idx, 2) ~= mf_b16_w20(idx, 4)
        rectangle('Position', [mf_b16_w20(idx, 2) mf_b16_w20(idx, 1) block_size block_size], 'EdgeColor', 'b')
        rectangle('Position', [mf_b16_w20(idx, 4) mf_b16_w20(idx, 3) block_size block_size], 'EdgeColor', 'r')
        drawArrow([mf_b16_w20(idx, 2) mf_b16_w20(idx, 4)] + block_size/2, [mf_b16_w20(idx, 1) mf_b16_w20(idx, 3) ] + block_size/2);
    end
end
figure; imshow(fr2);
% (b)
fr2p_b16_w20 = ICV_q4_predict(fr1, mf_b16_w20, block_size);
figure; imshow(fr2p_b16_w20);

% (c)
t_ag_b = zeros(1, 3);
tic
block_size = 4; windows_size = 16;
[mf_w16_b4, sum_w16_b4] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
t_ag_b(1) = toc;
block_size = 8; windows_size = 16;
[mf_w16_b8, sum_w16_b8] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
t_ag_b(2) = toc;
block_size = 16; windows_size = 16;
[mf_w16_b16, sum_w16_b16] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
t_ag_b(3) = toc;
% (d)
tic
t_ag_w = zeros(1, 3);
block_size = 8; windows_size = 8;
[mf_b8_w8, sum_b8_w8] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
t_ag_w(1) = toc;
block_size = 8; windows_size = 16;
[mf_b8_w16, sum_b8_w16] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
t_ag_w(2) = toc;
block_size = 8; windows_size = 32;
[mf_b8_w32, sum_b8_w32] = ICV_q4_kernel(fr1, fr2, windows_size, block_size);
t_ag_w(3) = toc;
% (e)
figure ; plot(t_ag_b);
figure ; plot(t_ag_w);
