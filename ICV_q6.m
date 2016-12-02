%% Qurstion6: Texture
% Dataset: DatasetA/B
disp('Intorduction of Computer Vision Coursework 2 - Q6: Texture');

%% (a)
im_car1 = imread('Dataset/DatasetA/car-1.jpg');
im_car1g = ICV_rgb2grey(im_car1);
size_im_car1 = size(im_car1g);
[car1_local_d , ~] = ICV_q6_local_des(im_car1g, 20);
figure; imshow(im_car1g);
for i=1:20:size_im_car1(1)
    for j=1:20:size_im_car1(2)
        rectangle('Position', [j i 20 20], 'EdgeColor', 'r')
    end
end
parImg_w20_7_2 = ICV_partition_images(ICV_rgb2grey(im_car1), 20, 7, 2); figure; imshow(parImg_w20_7_2); imwrite(parImg_w20_7_2, 'output/ICV_q6_a_w20_7_2.jpg');
parImg_w20_6_3 = ICV_partition_images(ICV_rgb2grey(im_car1), 20, 6, 3); figure; imshow(parImg_w20_6_3); imwrite(parImg_w20_6_3, 'output/ICV_q6_a_w20_6_3.jpg');
parImg_w20_9_1 = ICV_partition_images(ICV_rgb2grey(im_car1), 20, 9, 1); figure; imshow(parImg_w20_9_1); imwrite(parImg_w20_9_1, 'output/ICV_q6_a_w20_9_1.jpg');

%figure; histogram(local_d{7,2}, 255); title('Histogram of (7,2)');
%figure; histogram(local_d{6,3}, 255); title('Histogram of (6,3)');
%figure; histogram(local_d{9,1}, 255); title('Histogram of (9,1)');
%figure; histogram(cat(1, cat(1, local_d{7,2}, local_d{6,3}), local_d{9,1}), 255); title('Histogram of (7,2)+(6,3)+(9,1)');

figure; car1_7_2_hist = ICV_histogram(car1_local_d{7,2}, 255); bar(normr(car1_7_2_hist)); title('Histogram of (7,2)');
figure; car1_6_3_hist = ICV_histogram(car1_local_d{6,3}, 255); bar(normr(car1_6_3_hist)) ;title('Histogram of (6,3)');
figure; car1_9_1_hist = ICV_histogram(car1_local_d{9,1}, 255); bar(normr(car1_9_1_hist)); title('Histogram of (9,1)');
% figure; car1_7_2_6_3_9_1hist = ICV_histogram(cat(1, cat(1, car1_local_d{7,2}, car1_local_d{6,3}), car1_local_d{9,1}), 255); bar(car1_7_2_6_3_9_1hist); title('Histogram of (7,2)+(6,3)+(9,1)');

%% (b)
im_car1 = imread('Dataset/DatasetA/car-1.jpg');
im_face1 = imread('Dataset/DatasetA/face-1.jpg');
im_car1g = ICV_rgb2grey(im_car1);
im_face1g = ICV_rgb2grey(im_face1);

car1_ws = 25;
face1_ws = 50;

car1_local_des_idx = [4 3; 6 2; 9 10];
figure; imshow(im_car1g);
for i=1:car1_ws:size(im_car1g, 1)
    for j=1:car1_ws:size(im_car1g, 2)
        for k=1:size(car1_local_des_idx, 1)
            if(fix(i/car1_ws)+1 == car1_local_des_idx(k, 1) && fix(j/car1_ws)+1 == car1_local_des_idx(k, 2))
                rectangle('Position', [j i car1_ws car1_ws], 'EdgeColor', 'r')
            end
            
        end
    end
end

face1_local_des_idx = [1 1; 2 1; 1 2; 2 2; 3 3; 4 3];
figure; imshow(im_face1g);
for i=1:face1_ws:size(im_face1g, 1)
    for j=1:face1_ws:size(im_face1g, 2)
        for k=1:size(face1_local_des_idx, 1)
            if(fix(i/face1_ws)+1 == face1_local_des_idx(k, 1) && fix(j/face1_ws)+1 == face1_local_des_idx(k, 2))
                rectangle('Position', [j i face1_ws face1_ws], 'EdgeColor', 'r')
            end
        end
        
    end
end

[car1_local_d , ~] = ICV_q6_local_des(im_car1g, car1_ws);
[face1_local_d , ~] = ICV_q6_local_des(im_face1g, face1_ws);

figure; car1_hist = ICV_histogram(cat(1, cat(1, car1_local_d{4,3}, car1_local_d{6,2}), car1_local_d{9,10}), 255); bar(normr(car1_hist)); title('Car1 Histogram of (4,3)+(6,2)+(9,10)');
figure; face1_hist = ICV_histogram(cat(1, cat(1, cat(1, cat(1, cat(1, face1_local_d{1,1}, face1_local_d{2,1}), face1_local_d{1,2}), face1_local_d{2,2}), face1_local_d{3,3}), face1_local_d{4,3}), 255); bar(normr(face1_hist)); title('Face1 Histogram of (1,1)+(2,1)+(1,2)+(2,2)+(3,3)+(4,3)');
%% (c)
im_car2 = imread('Dataset/DatasetA/car-2.jpg');
im_car3 = imread('Dataset/DatasetA/car-3.jpg');
im_face2 = imread('Dataset/DatasetA/face-2.jpg');
im_face3 = imread('Dataset/DatasetA/face-3.jpg');
im_car2g = ICV_rgb2grey(im_car2);
im_car3g = ICV_rgb2grey(im_car3);
im_face2g = ICV_rgb2grey(im_face2);
im_face3g = ICV_rgb2grey(im_face3);

car2_global_d = ICV_q6_global_des(im_car2g);
car3_global_d = ICV_q6_global_des(im_car3g);
face2_global_d = ICV_q6_global_des(im_face2g);
face3_global_d = ICV_q6_global_des(im_face3g);

car2_hist = ICV_histogram(car2_global_d{1,1}, 255);
car3_hist = ICV_histogram(car3_global_d{1,1}, 255);
face2_hist = ICV_histogram(face2_global_d{1,1}, 255);
face3_hist = ICV_histogram(face3_global_d{1,1}, 255);

corr_car1_car2 = corrcoef(normr(car1_hist), normr(car2_hist));
corr_car1_car3 = corrcoef(normr(car1_hist), normr(car3_hist));
corr_car1_face2 = corrcoef(normr(car1_hist), normr(face2_hist));
corr_car1_face3 = corrcoef(normr(car1_hist), normr(face3_hist));

corr_face1_car2 = corrcoef(normr(face1_hist), normr(car2_hist));
corr_face1_car3 = corrcoef(normr(face1_hist), normr(car3_hist));
corr_face1_face2 = corrcoef(normr(face1_hist), normr(face2_hist));
corr_face1_face3 = corrcoef(normr(face1_hist), normr(face3_hist));

fprintf('Car2/Car1(classifier) similarity = %.3f\n', corr_car1_car2(1,2));
fprintf('Car2/Face1(classifier) similarity = %.3f\n', corr_face1_car2(1,2));
fprintf('Classify Car2 as a car\n');
fprintf('Car3/Car1(classifier) similarity = %.3f\n', corr_car1_car3(1,2));
fprintf('Car3/Face1(classifier) similarity = %.3f\n', corr_face1_car3(1,2));
fprintf('Classify Car3 as a car\n');

fprintf('Face2/Car1(classifier) similarity = %.3f\n', corr_car1_face2(1,2));
fprintf('Face2/Face1(classifier) similarity = %.3f\n', corr_face1_face2(1,2));
fprintf('Classify Face2 as face\n');
fprintf('Face3/Car1(classifier) similarity = %.3f\n', corr_car1_face3(1,2));
fprintf('Face3/Face1(classifier) similarity = %.3f\n', corr_face1_face3(1,2));
fprintf('Classify Face3 as face\n');

%% (d)
im_car1 = imread('Dataset/DatasetA/car-1.jpg');
im_face1 = imread('Dataset/DatasetA/face-1.jpg');
im_car1g = ICV_rgb2grey(im_car1);
im_face1g = ICV_rgb2grey(im_face1);

car1_ws = 12;
face1_ws = 25;

car1_local_des_idx = [8 4; 12 3; 18 20];
figure; imshow(im_car1g);
for i=1:car1_ws:size(im_car1g, 1)
    for j=1:car1_ws:size(im_car1g, 2)
        for k=1:size(car1_local_des_idx, 1)
            if(fix(i/car1_ws)+1 == car1_local_des_idx(k, 1) && fix(j/car1_ws)+1 == car1_local_des_idx(k, 2))
                rectangle('Position', [j i car1_ws car1_ws], 'EdgeColor', 'r')
            end
            
        end
    end
end

face1_local_des_idx = [2 2; 3 2; 2 3; 3 3; 6 5; 8 5];
figure; imshow(im_face1g);
for i=1:face1_ws:size(im_face1g, 1)
    for j=1:face1_ws:size(im_face1g, 2)
        for k=1:size(face1_local_des_idx, 1)
            if(fix(i/face1_ws)+1 == face1_local_des_idx(k, 1) && fix(j/face1_ws)+1 == face1_local_des_idx(k, 2))
                rectangle('Position', [j i face1_ws face1_ws], 'EdgeColor', 'r')
            end
        end
        
    end
end

[car1_local_d , ~] = ICV_q6_local_des(im_car1g, car1_ws);
[face1_local_d , ~] = ICV_q6_local_des(im_face1g, face1_ws);

figure; car1_hist = ICV_histogram(cat(1, cat(1, car1_local_d{8,4}, car1_local_d{12,3}), car1_local_d{18,20}), 255); bar(normr(car1_hist)); title('Car1 Histogram of (8,4)+(12,3)+(18,20)');
figure; face1_hist = ICV_histogram(cat(1, cat(1, cat(1, cat(1, cat(1, face1_local_d{2,2}, face1_local_d{3,2}), face1_local_d{2,3}), face1_local_d{3,3}), face1_local_d{6,5}), face1_local_d{8,5}), 255); bar(normr(face1_hist)); title('Face1 Histogram of (2,2)+(3,2)+(2,3)+(3,3)+(6,5)+(8,5)');

im_car2 = imread('Dataset/DatasetA/car-2.jpg');
im_car3 = imread('Dataset/DatasetA/car-3.jpg');
im_face2 = imread('Dataset/DatasetA/face-2.jpg');
im_face3 = imread('Dataset/DatasetA/face-3.jpg');
im_car2g = ICV_rgb2grey(im_car2);
im_car3g = ICV_rgb2grey(im_car3);
im_face2g = ICV_rgb2grey(im_face2);
im_face3g = ICV_rgb2grey(im_face3);

car2_global_d = ICV_q6_global_des(im_car2g);
car3_global_d = ICV_q6_global_des(im_car3g);
face2_global_d = ICV_q6_global_des(im_face2g);
face3_global_d = ICV_q6_global_des(im_face3g);

car2_hist = ICV_histogram(car2_global_d{1,1}, 255);
car3_hist = ICV_histogram(car3_global_d{1,1}, 255);
face2_hist = ICV_histogram(face2_global_d{1,1}, 255);
face3_hist = ICV_histogram(face3_global_d{1,1}, 255);

corr_car1_car2 = corrcoef(normr(car1_hist), normr(car2_hist));
corr_car1_car3 = corrcoef(normr(car1_hist), normr(car3_hist));
corr_car1_face2 = corrcoef(normr(car1_hist), normr(face2_hist));
corr_car1_face3 = corrcoef(normr(car1_hist), normr(face3_hist));

corr_face1_car2 = corrcoef(normr(face1_hist), normr(car2_hist));
corr_face1_car3 = corrcoef(normr(face1_hist), normr(car3_hist));
corr_face1_face2 = corrcoef(normr(face1_hist), normr(face2_hist));
corr_face1_face3 = corrcoef(normr(face1_hist), normr(face3_hist));

fprintf('Car2/Car1(classifier) similarity = %.3f\n', corr_car1_car2(1,2));
fprintf('Car2/Face1(classifier) similarity = %.3f\n', corr_face1_car2(1,2));
fprintf('Classify Car2 as a car\n');
fprintf('Car3/Car1(classifier) similarity = %.3f\n', corr_car1_car3(1,2));
fprintf('Car3/Face1(classifier) similarity = %.3f\n', corr_face1_car3(1,2));
fprintf('Classify Car3 as a car\n');

fprintf('Face2/Car1(classifier) similarity = %.3f\n', corr_car1_face2(1,2));
fprintf('Face2/Face1(classifier) similarity = %.3f\n', corr_face1_face2(1,2));
fprintf('Classify Face2 as face\n');
fprintf('Face3/Car1(classifier) similarity = %.3f\n', corr_car1_face3(1,2));
fprintf('Face3/Face1(classifier) similarity = %.3f\n', corr_face1_face3(1,2));
fprintf('Classify Face3 as face\n');
%% (e)
im_car1 = imread('Dataset/DatasetA/car-1.jpg');
im_face1 = imread('Dataset/DatasetA/face-1.jpg');
im_car1g = ICV_rgb2grey(im_car1);
im_face1g = ICV_rgb2grey(im_face1);

car1_ws = 50;
face1_ws = 100;

car1_local_des_idx = [2 2; 3 2; 5 5];
figure; imshow(im_car1g);
for i=1:car1_ws:size(im_car1g, 1)
    for j=1:car1_ws:size(im_car1g, 2)
        for k=1:size(car1_local_des_idx, 1)
            if(fix(i/car1_ws)+1 == car1_local_des_idx(k, 1) && fix(j/car1_ws)+1 == car1_local_des_idx(k, 2))
                rectangle('Position', [j i car1_ws car1_ws], 'EdgeColor', 'r')
            end
            
        end
    end
end

face1_local_des_idx = [1 1; 2 2];
figure; imshow(im_face1g);
for i=1:face1_ws:size(im_face1g, 1)
    for j=1:face1_ws:size(im_face1g, 2)
        for k=1:size(face1_local_des_idx, 1)
            if(fix(i/face1_ws)+1 == face1_local_des_idx(k, 1) && fix(j/face1_ws)+1 == face1_local_des_idx(k, 2))
                rectangle('Position', [j i face1_ws face1_ws], 'EdgeColor', 'r')
            end
        end
        
    end
end

[car1_local_d , ~] = ICV_q6_local_des(im_car1g, car1_ws);
[face1_local_d , ~] = ICV_q6_local_des(im_face1g, face1_ws);

figure; car1_hist = ICV_histogram(cat(1, cat(1, car1_local_d{2,2}, car1_local_d{3,2}), car1_local_d{5,5}), 255); bar(normr(car1_hist)); title('Car1 Histogram of (2,2)+(3,2)+(5,5)');
figure; face1_hist = ICV_histogram(cat(1, face1_local_d{1,1}, face1_local_d{2,2}), 255); bar(normr(face1_hist)); title('Face1 Histogram of (1,1)+(2,2)');

im_car2 = imread('Dataset/DatasetA/car-2.jpg');
im_car3 = imread('Dataset/DatasetA/car-3.jpg');
im_face2 = imread('Dataset/DatasetA/face-2.jpg');
im_face3 = imread('Dataset/DatasetA/face-3.jpg');
im_car2g = ICV_rgb2grey(im_car2);
im_car3g = ICV_rgb2grey(im_car3);
im_face2g = ICV_rgb2grey(im_face2);
im_face3g = ICV_rgb2grey(im_face3);

car2_global_d = ICV_q6_global_des(im_car2g);
car3_global_d = ICV_q6_global_des(im_car3g);
face2_global_d = ICV_q6_global_des(im_face2g);
face3_global_d = ICV_q6_global_des(im_face3g);

car2_hist = ICV_histogram(car2_global_d{1,1}, 255);
car3_hist = ICV_histogram(car3_global_d{1,1}, 255);
face2_hist = ICV_histogram(face2_global_d{1,1}, 255);
face3_hist = ICV_histogram(face3_global_d{1,1}, 255);

corr_car1_car2 = corrcoef(normr(car1_hist), normr(car2_hist));
corr_car1_car3 = corrcoef(normr(car1_hist), normr(car3_hist));
corr_car1_face2 = corrcoef(normr(car1_hist), normr(face2_hist));
corr_car1_face3 = corrcoef(normr(car1_hist), normr(face3_hist));

corr_face1_car2 = corrcoef(normr(face1_hist), normr(car2_hist));
corr_face1_car3 = corrcoef(normr(face1_hist), normr(car3_hist));
corr_face1_face2 = corrcoef(normr(face1_hist), normr(face2_hist));
corr_face1_face3 = corrcoef(normr(face1_hist), normr(face3_hist));

fprintf('Car2/Car1(classifier) similarity = %.3f\n', corr_car1_car2(1,2));
fprintf('Car2/Face1(classifier) similarity = %.3f\n', corr_face1_car2(1,2));
fprintf('Classify Car2 as a car\n');
fprintf('Car3/Car1(classifier) similarity = %.3f\n', corr_car1_car3(1,2));
fprintf('Car3/Face1(classifier) similarity = %.3f\n', corr_face1_car3(1,2));
fprintf('Classify Car3 as a car\n');

fprintf('Face2/Car1(classifier) similarity = %.3f\n', corr_car1_face2(1,2));
fprintf('Face2/Face1(classifier) similarity = %.3f\n', corr_face1_face2(1,2));
fprintf('Classify Face2 as face\n');
fprintf('Face3/Car1(classifier) similarity = %.3f\n', corr_car1_face3(1,2));
fprintf('Face3/Face1(classifier) similarity = %.3f\n', corr_face1_face3(1,2));
fprintf('Classify Face3 as face\n');
%% (f)
