function [mo] = ICV_MSE(mi1, mi2)
% Function: ICV_MSE
% Input:
%       mi1: 2-D matrix
%       mi2: 2-D matrix
% Output:
%       mo: Mean square error
    mo = sum(sum((mi1-mi2).^2))/numel(mi1);
end