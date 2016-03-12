matchPtNum=size(curPickedOutIndex,1);
A=zeros(4,4);
b=zeros(4,1);
for i=1:matchPtNum
    curPtIndex= curPickedOutIndex(i);
    x=matched_pts2(curPtIndex).Location;
    x_prime=matched_pts1(curPtIndex).Location;
    J=[1 0 x(1) -x(2); 0 1 x(2) x(1)];
    A=A+J'*J;
    b=b+J'*(x_prime-x)';
end
p=A\b;