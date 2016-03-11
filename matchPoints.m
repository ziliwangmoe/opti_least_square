clear all;
oriImg =rgb2gray(imread('loli.jpg'));
modImg =rgb2gray(imread('loli_d.jpg'));
width = size(oriImg, 2);
height = size(oriImg, 1);
points1 = detectSURFFeatures(modImg,'MetricThreshold',10000);
[features1,validPoints1] = extractFeatures(modImg,points1);

points2 = detectSURFFeatures(oriImg,'MetricThreshold',10000);
[features2,validPoints2] = extractFeatures(oriImg,points2);

index_pairs = matchFeatures(features1,features2);

matched_pts1 = validPoints1(index_pairs(:, 1));
matched_pts2 = validPoints2(index_pairs(:, 2));

showMatchedFeatures(modImg,oriImg,matched_pts1,matched_pts2,'montage');
%showMatchedFeatures(modImg,oriImg,matched_pts1,matched_pts2);