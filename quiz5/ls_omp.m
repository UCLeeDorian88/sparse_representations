function xLSMP = ls_omp(A, b)

m = size(A,2);

% Apply LS-MP
thrLSMP=1e-4;
r=b;
SS=[];
while r'*r>thrLSMP,
    Z=zeros(m,1);
    for jj=1:1:m
        SStemp=[SS,jj]; 
        rtemp=b-A(:,SStemp)*pinv(A(:,SStemp))*b;
        Z(jj)=norm(rtemp);%rtemp'*rtemp;
    end;
    posZ=find(Z==min(Z),1);
    SS=sort([SS,posZ(1)]);
    r=b-A(:,SS)*pinv(A(:,SS))*b;    
end;

xLSMP=zeros(m,1);
xLSMP(SS)=pinv(A(:,SS))*b;
        
end


