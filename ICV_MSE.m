function [mo] = ICV_MSE(mi1, mi2)
    mo = sum(sum((mi1-mi2).^2))/numel(mi1);
end