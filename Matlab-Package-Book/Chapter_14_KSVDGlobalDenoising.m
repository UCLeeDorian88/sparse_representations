% Figure - 14.8 and 14.9
% =========================================
% This function denoises an image using a pre-trained global dictionary
% that is supposed to fit general images. The denoising is done by 
% sparse coding by OMP on each pacth (with overlaps) and averaging 
% the results. 


function []=Chapter_14_KSVDGlobalDenoising()

% =========================================
% =========================================

K=256; 
n=8; 
sigma=20; % noise power
const=sqrt(1.15); 
lambda=0.5; 

% Gather the data from the noisy Barbara

y0=imread('barbara.png'); 
y0=double(y0); % (401:500,401:500));
N=size(y0,1);
noise=randn(N,N);
y=y0+sigma*noise; % add noise
PSNRinput=10*log10(255^2/mean((y(:)-y0(:)).^2)); 

Data=zeros(n^2,(N-n+1)^2);
cnt=1; 
for j=1:1:N-n+1
    for i=1:1:N-n+1
        patch=y(i:i+n-1,j:j+n-1);
        Data(:,cnt)=patch(:); 
        cnt=cnt+1;
    end;
end;
MeanData=mean(Data,1);
Data=Data-ones(n^2,1)*MeanData; 

% initialize the dictionary
load Chapter_14_GlobalTrainedDictionary.mat     
IMdict=Chapter_12_DispDict(Dictionary,sqrt(K),sqrt(K),n,n,0);
figure(1); clf; 
imagesc(IMdict); colormap(gray(256)); axis image; axis off; drawnow;
% print -depsc2 Chapter_14_KSVD_dicGlobal.eps

% Sparse coding with the initial dictionary
CoefMatrix=OMPerr(Dictionary,Data, sigma*const);
CoefMatrix=[MeanData*n; CoefMatrix];
yout=RecoverImage(y,lambda,[ones(n^2,1)/n,Dictionary],CoefMatrix); 
PSNRoutput=10*log10(255^2/mean((yout(:)-y0(:)).^2)); 
disp([PSNRinput,PSNRoutput]);
figure(2); clf; 
imagesc(yout); colormap(gray(256)); axis image; axis off; drawnow;
% print -depsc2 Chapter_14_KSVD_imGlobal.eps

return;

% ========================================================
% ========================================================

function [A]=OMPerr(D,X,errorGoal)
% ========================================================
% Sparse coding of a group of signals based on a given dictionary and specified representation
% error to get.
% input arguments: D - the dictionary
%                           X - the signals to represent
%                           errorGoal - the maximal allowed representation error
% output arguments: A - sparse coefficient matrix.
% ========================================================
[n,P]=size(X);
[n,K]=size(D);
E2 = errorGoal^2*n;
maxNumCoef = n/2;
A = sparse(size(D,2),size(X,2));
h=waitbar(0,'OMP on each example ...');
for k=1:1:P,
    waitbar(k/P);
    a=[];
    x=X(:,k);
    residual=x;
    indx = [];
    a = [];
    currResNorm2 = sum(residual.^2);
    j = 0;
    while currResNorm2>E2 && j < maxNumCoef,
        j = j+1;
        proj=D'*residual;
        pos=find(abs(proj)==max(abs(proj)));
        pos=pos(1);
        indx(j)=pos;
        a=pinv(D(:,indx(1:j)))*x;
        residual=x-D(:,indx(1:j))*a;
        currResNorm2 = sum(residual.^2);
    end;
    if (~isempty(indx))
        A(indx,k)=a;
    end
end;
close(h); 
return;

% ========================================================
% ========================================================

function [yout]=RecoverImage(y,lambda,D,CoefMatrix)
% ========================================================
% ========================================================
N=size(y,1); 
n=sqrt(size(D,1)); 
yout=zeros(N,N); 
Weight=zeros(N,N); 
i=1; j=1;
for k=1:1:(N-n+1)^2,
    patch=reshape(D*CoefMatrix(:,k),[n,n]); 
    yout(i:i+n-1,j:j+n-1)=yout(i:i+n-1,j:j+n-1)+patch; 
    Weight(i:i+n-1,j:j+n-1)=Weight(i:i+n-1,j:j+n-1)+1; 
    if i<N-n+1 
        i=i+1; 
    else
        i=1; j=j+1; 
    end;
end;
yout=(yout+lambda*y)./(Weight+lambda); 
return;
