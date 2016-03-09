aa=-1:0.1:1;
bb=-1:0.1:1;
re=zeros(size(aa,1),size(bb,1));
i=0;j=0;
for s=aa
    i=i+1;
    j=0;
    for c=bb
        j=j+1;
        re(i,j) = norm(A*[s, c]'-b);
    end
end
figure;
mesh(aa, bb,re)