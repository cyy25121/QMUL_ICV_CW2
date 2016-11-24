function [] = ICV_q4_demo( v )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    drawArrow = @(x,y) quiver( x(1),y(1),(x(2)-x(1)),(y(2)-y(1)), 3, 'r', 'MaxHeadSize', 100);   
    preFr = readFrame(v);
    %preFr = snapshot(cam);
    preFrg = preFr(:,:,1) * 0.299 + preFr(:,:,2) * 0.587 + preFr(:,:,3) * 0.114;
    
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
                    if min <= 1
                        min_m = [i, j];
                    end
                    %plot([j min_m(2)]+8, [i min_m(1)]+8, 'LineWidth', 3)
                    %fprintf('MSE: %f\n', min);
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
end

