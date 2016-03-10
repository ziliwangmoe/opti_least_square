matchPtNum=size(index_pairs,1);
p=[0 0 0]';
bstop=false;
while ~bstop
    A=zeros(4,4);
    b=zeros(4,1);
    for i=1:matchPtNum
        theta=p(3);
        x=matched_pts1(i).Location;
        x_prime=matched_pts2(i).Location;
        J=[1 0 -sin(theta)*x(1)-cos(theta)*x(2); 0 1 cos(theta)*x(2)-sin(theta)*x(1)];
        A=A+J'*J;
        b=b+J'*(x_prime-x)';
    end
    delta_p=A\b;
    if norm(delta_p)<0.01
        bstop=true;
    end
end
