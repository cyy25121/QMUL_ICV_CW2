function [ code ] = ICV_q6_lbp_2_binary( m )
% Function: ICV_q6_lbp_2_binary
% Input: 2-D matrix
% Output: Local Binary Pattern, a 1x8 matrix
% m should be 3*3 matrix, the center is the target point
    c = m(2,2);
    code = [m(1,1)-c > 0 m(2,1)-c > 0 m(3,1)-c > 0 m(3,2)-c > 0 m(3,3)-c > 0 m(2,3)-c > 0 m(1,3)-c > 0 m(1,2)-c > 0];
end
