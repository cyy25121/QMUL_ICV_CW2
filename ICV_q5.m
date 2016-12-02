%% Qurstion5: Objects
% Dataset: DatasetC
clc; clear;
disp('Intorduction of Computer Vision Coursework 2 - Q5: Objects');

%% (a)
v = VideoReader('Dataset/DatasetC.mpg');
[fr1, fr10] = ICV_q4_pickframes(v, 1, 10);
[diff_w_th, diff] = ICV_q5_frame_def_w_th(ICV_rgb2grey(fr1), ICV_rgb2grey(fr10), 10);
figure; imshow(diff);
figure; imshow(diff_w_th);

v = VideoReader('Dataset/DatasetC.mpg');
[fr1, fr50] = ICV_q4_pickframes(v, 1, 50);
[diff_w_th, diff] = ICV_q5_frame_def_w_th(ICV_rgb2grey(fr1), ICV_rgb2grey(fr50), 10);
figure; imshow(diff);
figure; imshow(diff_w_th);
figure; imshow(fr1);
figure; imshow(fr10);
figure; imshow(fr50);

%% (b)
v = VideoReader('Dataset/DatasetC.mpg');
while(hasFrame(v))
    curF = readFrame(v);
    if(hasFrame(v))
        nextF = readFrame(v);
    end
    [diff_w_th, diff] = ICV_q5_frame_def_w_th(ICV_rgb2grey(curF), ICV_rgb2grey(nextF), 20);
    imshow(diff_w_th);
    curF = nextF;
end

v = VideoReader('Dataset/DatasetC.mpg');
[fr1, fr2] = ICV_q4_pickframes(v, 9, 10);
[diff, diff_w_th] = ICV_q5_frame_def_w_th(ICV_rgb2grey(fr1), ICV_rgb2grey(fr2), 10);
figure; imshow(diff);
figure; imshow(diff_w_th);

v = VideoReader('Dataset/DatasetC.mpg');
[fr1, fr2] = ICV_q4_pickframes(v, 49, 50);
[diff, diff_w_th] = ICV_q5_frame_def_w_th(ICV_rgb2grey(fr1), ICV_rgb2grey(fr2), 10);
figure; imshow(diff);
figure; imshow(diff_w_th);

%% (c)
v = VideoReader('Dataset/DatasetC.mpg');
bg = ICV_q5_genbg(v);
figure; imshow(bg);
%% (d)
% Implement Background subtraction and Look for connected component
v = VideoReader('Dataset/DatasetC.mpg');
count_mv_objs = [];
while(hasFrame(v))
    curF = readFrame(v);
    out = ICV_q5_frame_def_w_th(ICV_q5_gaussian_filter(bg), ICV_q5_gaussian_filter(ICV_rgb2grey(curF)), 30);
    imshow(out); hold on
    [cc, num] = bwlabel(out);
    count = 0;
    for i=1:num
        if numel(cc(cc == i)) > 10
            count = count + 1;
            [x, y] = find(cc == i);
            min_x = min(x); min_y = min(y); max_x = max(x); max_y = max(y);
            rectangle('Position', [min_y min_x max_y-min_y max_x-min_x ], 'EdgeColor', 'r')
        end
    end
    count_mv_objs = [count_mv_objs; count];
    hold off
end
bar(count_mv_objs(:, 1));
