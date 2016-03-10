matchPtNum=size(index_pairs,1);
A=zeros(4,4);
b=zeros(4,1);
for i=1:matchPtNum
    x=matched_pts1(i).Location;
    x_prime=matched_pts2(i).Location;
    J=[1 0 x(1) -x(2); 0 1 x(2) x(1)];
    A=A+J'*J;
    b=b+J'*(x_prime-x)';
end
p=A\b;