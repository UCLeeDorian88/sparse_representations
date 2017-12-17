function xTH = thr(A, b)

m = size(A,2);

% Apply Thr 
thrTH=1e-4;
Z=A'*b;
[Za,posZ]=sort(abs(Z),'descend');
% in case the support is known:
% SS=posZ(1:S)'; xTH=zeros(m,1); 
% xTH(SS)=pinv(A(:,SS))*b; 
r=b;
SS=[];
xTH=zeros(m,1);
while r'*r>thrTH,
    SS=[SS,posZ(length(SS)+1)];
    xTH=zeros(m,1);
    xTH(SS)=pinv(A(:,SS))*b;
    r=b-A(:,SS)*xTH(SS);
end;

        

