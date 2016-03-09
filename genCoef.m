%% cal A and b
matchPtNum=size(index_pairs,1);
A=zeros(matchPtNum*2, 2);
b=zeros(matchPtNum*2, 1);
step=0.1;
for i=1:matchPtNum
    x=matched_pts1(i).Location;
    x_prime=matched_pts2(i).Location;
    A(i*2-1,:)=[x(1), -x(2)];
    A(i*2,:)=[x(2), x(1)];
    b(i*2-1,:) = x_prime(1);
    b(i*2,:) = x_prime(2);
end
