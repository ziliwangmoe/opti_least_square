error=0;
a=curBestGauss(3);
b=curBestGauss(4);
tx=curBestGauss(1);
ty=curBestGauss(2);
TransMat=[1+a -b tx; b 1+a ty];
for i=1:max(size(curBestInList))
    x=matched_pts2(curBestInList(i)).Location;%original
    x_prime=matched_pts1(curBestInList(i)).Location;%modified
    newP= TransMat*[x(1) x(2) 1]';
    error = error+ norm(newP' -x_prime);
end
error=error/matchPtNumTotal