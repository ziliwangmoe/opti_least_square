matchPtNum=size(index_pairs,1);
for i=1:matchPtNum
    x=matched_pts2(i).Location;
    x_prime=matched_pts1(i).Location;
    plot(i, x(1),'r*');
    hold on;
    plot(i,x_prime(1),'b*');
end