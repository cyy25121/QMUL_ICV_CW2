function [ bg, outImg , idx] = ICV_q5_genbg(v)
% Function: ICV_q5_genbg
% Input: Video object
% Output: 
%       bg: Background image in greyscale
%       outImg: Total frame
%       idx: Frames count in video
    fr1 = ICV_rgb2grey(readFrame(v));
    if(hasFrame(v))
        fr2 = ICV_rgb2grey(readFrame(v));
    end
    outImg = cat(3, fr1, fr2);
    idx = 3;
    while(hasFrame(v))
        outImg(:,:,idx) = ICV_rgb2grey(readFrame(v));
        idx = idx + 1;
    end
    video_size = size(outImg);
    bg = uint8(zeros(video_size(1), video_size(2)));
    for i=1:video_size(1)
        for j=1:video_size(2)
            %for k=1:3
                bg(i,j) = uint8(mode(outImg(i,j,:)));
            %end
        end
    end
end
