% F. Liao, T. Chen, and P. Chung, “A Fast Algorithm for Multilevel Thresholding,”
% Journal of Information Science and Engineering, vol. 17, no. 5, pp. 713–727, 2001.

clc
clear
close all

img = imread('1.png');
if size(img,3)>1
    img = rgb2gray(img);
end

thresh_count = 5;
multi_thresh = multithresh(img, thresh_count);

lower_threshold = multi_thresh(1:end-1);
upper_threshold = multi_thresh(2:end);

for k = 1: length(lower_threshold)
    Ib{k} = (img > lower_threshold(k)) .* (img<= upper_threshold(k));
end

% show the results
r = floor(sqrt((thresh_count+1)));
c = floor((thresh_count+1)/r);

subplot(r,c,1); imshow(img); title('main image');
for k = 1: length(lower_threshold)
    subplot(r,c,k+1);
    imshow(Ib{k});
    title(sprintf(' %d<t_b<=%d',lower_threshold(k), upper_threshold(k)));
end
