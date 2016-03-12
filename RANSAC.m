
curMaxInliarCount =0;
curBestGauss=0;
curBestInList=0;

for j=1:20
    curPickedOutIndex = randi(matchPtNumTotal, [5 1]);
    calCoefJaco;
    a=p(3);
    b=p(4);
    tx=p(1);
    ty=p(2);
    TransMat=[1+a -b tx; b 1+a ty];
    inliarCount =0;
    inlayerList=0;
    for i=1:matchPtNumTotal
        x=matched_pts2(i).Location;%original
        x_prime=matched_pts1(i).Location;%modified
        newP= TransMat*[x(1) x(2) 1]';
        error = norm(newP' -x_prime);
        if (error < 5.0)
            inliarCount=inliarCount+1;
            inlayerList(inliarCount) = i;
        end
    end
    if (curMaxInliarCount < inliarCount)
        curMaxInliarCount = inliarCount
        curBestGauss = p;
        curBestInList = inlayerList;
    end
end
figure;
imshow(oriImg);
hold on
for i=1:matchPtNumTotal
    x=matched_pts2(i).Location;%original
    x_prime=matched_pts1(i).Location;%modified
    plot(x(1), x(2), 'g*');
end

for i=1:curMaxInliarCount
    x=matched_pts2(curBestInList(i)).Location;%original
    x_prime=matched_pts1(curBestInList(i)).Location;%modified
    plot(x(1), x(2), 'r*');
end
