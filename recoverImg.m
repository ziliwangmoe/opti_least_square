newImg= ones(height, width)*255;
a=curBestGauss(3);
b=curBestGauss(4);
theta=curBestGauss(3);
tx=curBestGauss(1);
ty=curBestGauss(2);
TransMat=[1+a -b tx; b 1+a ty];
%TransMat=[cos(theta) -sin(theta)  tx; sin(theta) cos(theta) ty];
TransMat(3,:)=[0 0 1];
TransMat= inv(TransMat);
for i=1:width
    for j=1:height
        newP=  TransMat*[i j 1]';
        if(newP(1)>0.5 && newP(1)<width)
            if(newP(2)>0.5 && newP(2)<height)
                newImg(j,i) = oriImg(round(newP(2)), round(newP(1)));
            end
        end
    end
end
newImg= uint8(newImg);
figure;
imshow(newImg);