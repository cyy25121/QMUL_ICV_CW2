%% 
% Qurstion5: Objects
% Dataset: DatasetC
disp('Intorduction of Computer Vision Coursework 2 - Q5: Objects');  

%% (a)
v = VideoReader('Dataset/DatasetC.mpg');
[fr1, fr2] = ICV_q4_pickframes(v, 10, 11);
out = ICV_q5_frame_def_w_th(ICV_rgb2grey(fr1), ICV_rgb2grey(fr2), 10);
imshow(out);
%% (b)
v = VideoReader('Dataset/DatasetC.mpg');
while(hasFrame(v))
    curF = readFrame(v);
    if(hasFrame(v))
        nextF = readFrame(v);
    end
    out = ICV_q5_frame_def_w_th(ICV_rgb2grey(curF), ICV_rgb2grey(nextF), 20);
    imshow(out); 
    curF = nextF;
end
%% (c)
v = VideoReader('Dataset/DatasetC.mpg');
bg = ICV_q5_genbg(v);
%% (d)
% Implement Background subtraction and Look for connected component
v = VideoReader('Dataset/DatasetC.mpg');
count_mv_objs = [];
while(hasFrame(v))
    curF = readFrame(v);
    out = ICV_q5_frame_def_w_th(ICV_rgb2grey(bg), ICV_rgb2grey(curF), 30);
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
plot(count_mv_objs(:, 1));