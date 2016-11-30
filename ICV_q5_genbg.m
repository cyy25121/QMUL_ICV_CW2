function [ bg, outImg , idx] = ICV_q5_genbg(v)
    fr1 = readFrame(v);
    fr2 = readFrame(v);
    outImg = cat(4, fr1, fr2);
    idx = 3;
    while(hasFrame(v))
        tmpfr = readFrame(v);
        outImg(:,:,:,idx) = tmpfr;
        idx = idx + 1;
    end
    video_size = size(outImg);
    bg = uint8(zeros(video_size(1), video_size(2), video_size(3)));
    for i=1:video_size(1)
        for j=1:video_size(2)
            for k=1:3
                bg(i,j,k) = uint8(mode(outImg(i,j,k,:)));
            end
        end
    end
end

