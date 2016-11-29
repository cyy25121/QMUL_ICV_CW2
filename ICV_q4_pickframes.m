function [ fr1, fr2 ] = ICV_q4_pickframes( v, frn1, frn2 )
    idx = 1;
    found1 = false;
    found2 = false;
    while(hasFrame(v) && (found1 ~= true || found2 ~= true))
        fr = readFrame(v);
        if idx == frn1
            fr1 = fr;
            found1 = true;
        end
        if idx == frn2
            fr2 = fr;
            found2 = true;
        end
        idx = idx + 1;
    end
end

