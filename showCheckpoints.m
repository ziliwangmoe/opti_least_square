clear all;
oriImg =rgb2gray(imread('Screenshot_4.png'));
width = size(oriImg, 2);
height = size(oriImg, 1);

points1 = detectHarrisFeatures(oriImg,'MinQuality',0.1);

figure;
imshow('Screenshot_4.png');
hold on
for i=1:size(points1,1)
    pt= points1(i).Location;
    plot(pt(1),pt(2),'r*');
end