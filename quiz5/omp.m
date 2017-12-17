function xOMP = omp(A, b)

m = size(A,2);

% Apply OMP
thrOMP=1e-4;
r=b;
SS=[];
while r'*r>thrOMP,
    Z=abs(A'*r);
    posZ=find(Z==max(Z));
    SS=sort([SS,posZ(1)]);
    r=b-A(:,SS)*pinv(A(:,SS))*b;    
end;
xOMP=zeros(m,1);
xOMP(SS)=pinv(A(:,SS))*b;


