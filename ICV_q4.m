%% Read data
% Qurstion4: Motion estimation
% Dataset: DatasetC
disp('Intorduction of Computer Vision Coursework 2 - Q4: Motion estimation');
clc; clear;
v = VideoReader('Dataset/DatasetC.mpg');

%% Run

%if(hasFrame(v))
%    fr1 = readFrame(v);
%    figure; imshow(fr1); 
%end
%if(hasFrame(v))
%    fr2 = readFrame(v);
%    figure; imshow(fr2); hold on
%end

drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0 , 'g');   

while(hasFrame(v))
    fr1 = readFrame(v);    
    fr1g = fr1(:,:,1) * 0.299 + fr1(:,:,2) * 0.587 + fr1(:,:,3) * 0.114;
    if(hasFrame(v))
        fr2 = readFrame(v);
        fr2g = fr2(:,:,1) * 0.299 + fr2(:,:,2) * 0.587 + fr2(:,:,3) * 0.114;
    end
    imshow(fr2); hold on;
    video_size = size(fr1g);
    sum = 0;
for i=1:16:video_size(1)
    for j=1:16:video_size(2)
        %fprintf('Block location: %d %d\n', i, j);
        if(i+16 <= video_size(1) && j+16 <= video_size(2))
            min = 9999;
            for a=i-2:i+2
                for b=j-2:j+2
                    if(a >= 1 && b >= 1 && a + 16 <= video_size(1) && b + 16 <= video_size(2))
                        m = ICV_MSE(fr2g(i:i+16, j:j+16), fr1g(a:a+16, b:b+16));
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
                drawArrow([j min_m(2)+10*(j-min_m(2))/(i-min_m(1))]+8, [i min_m(1)+10]+8);
            end
        end
    end
end
    hold off;
end

