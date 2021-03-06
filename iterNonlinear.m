matchPtNum=size(index_pairs,1);
p=[-40 10 0.2]';
bstop=false;
lamba=0;
lastError =100000;
while ~bstop
    A=zeros(3,3);
    b=zeros(3,1);
    acum_error=0;
    for i=2:matchPtNum
        tx=p(1);
        ty=p(2);
        theta=p(3);
        x=matched_pts2(i).Location;
        x_prime=matched_pts1(i).Location;
        J=[1 0 -sin(theta)*x(1)-cos(theta)*x(2); 0 1 cos(theta)*x(2)-sin(theta)*x(1)];
        transMat=[cos(theta) -sin(theta) tx; sin(theta) cos(theta) ty];
        x_hat= transMat*[x(1) x(2) 1]';
        A=A+J'*J;
        b=b+J'*(x_prime'-x_hat);
        acum_error= acum_error+ norm(x_hat - x_prime');
    end
     
    delta_p=(A+diag(diag(A))*lamba)\b;
    acum_error= acum_error/matchPtNum
    if lastError < acum_error
        %lamba=lamba*0.5;
    end
    lastError = acum_error;
    
    
    p=p+1*delta_p;
    if norm(delta_p)<0.01
        bstop=true;
    end
end
