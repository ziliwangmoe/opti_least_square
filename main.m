clear all;
oriImg =rgb2gray(imread('loli.jpg'));
%% cal the modified img
width = size(oriImg, 2);
height = size(oriImg, 1);
theta=15/360*2*3.1415;
newImg= ones(height, width)*255;
for i=1:width
    for j=1:height
        xx= i*cos(theta) -j*sin(theta)+(rand -0.5)*2;
        yy= i*sin(theta) +j*cos(theta)+(rand -0.5)*2;
        %xx=i+10;
        %yy=j+5;
        if(xx>0.5 && xx<width)
            if(yy>0.5 && yy<height)
                newImg(j,i) = oriImg(round(yy), round(xx));
            end
        end
    end
end
newImg= uint8(newImg);
%imshow(uint8(newImg));
%% cal the motion
points1 = detectSURFFeatures(newImg,'MetricThreshold',5000);
%imshow(uint8(newImg)); hold on;
%plot(points1.selectStrongest(10));
[features1,validPoints1] = extractFeatures(newImg,points1);

points2 = detectSURFFeatures(oriImg,'MetricThreshold',5000);
[features2,validPoints2] = extractFeatures(oriImg,points2);

index_pairs = matchFeatures(features1,features2);

matched_pts1 = validPoints1(index_pairs(:, 1));
matched_pts2 = validPoints2(index_pairs(:, 2));

showMatchedFeatures(newImg,oriImg,matched_pts1,matched_pts2);



