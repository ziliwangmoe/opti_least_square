
%% start ieration
x=[0.5 0.5]';
bStop=false;
record=x;
iterCount=0;
while ~bStop
    iterCount=iterCount+1;
    deri = A'*A*x-A'*b;
    x=x+deri*step;
    record(iterCount)=x;
    if(norm(deri)<0.01)
        bStop=true;
    end
end
for i=1:size(record,1)
    plot(record(i,1),record(i,2));
    hold on;
end