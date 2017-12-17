function xWMP = wmp(A, b)

m = size(A,2);

% Apply WMP
thrWMP=1e-4; t=0.5; 
r=b;
xWMP=zeros(m,1);
while r'*r>thrWMP,
    Z=abs(A'*r);
    posZ=find(Z>=t*sqrt(r'*r),1);
    if isempty(posZ)
        posZ=find(Z==max(Z),1);
    end;
    xWMP(posZ)=xWMP(posZ)+A(:,posZ)'*r;
    r=r-A(:,posZ)*A(:,posZ)'*r;
end;
        

