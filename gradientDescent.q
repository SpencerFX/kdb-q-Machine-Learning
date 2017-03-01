n:4;
X:(n;n)#(n*n)?1f;
y:n?1f;

fhat:{[x;X;y;h]n:count[x]; k:kernel[x;;h]each flip X; d:sum k; n:y wsum k; :n%d};

derfhat:{[x;X;y;h]n:count[x]; : (kernel[x;;h]each flip X)%sum[kernel[x;;h]each flip X]};

gi:{[ivar;X;y;h]n:count[y]; I:(n#0f); I[ivar]:1f; (2%n)*(y-fhat[;X;y;h] each X) wsum (I-derfhat[X[ivar;];X;y;h])};

n:count[y];w:n?1f;i:1;dw:enlist 0f;
do[2000; f:fhat[;X;w;h]each X; delta:gi[;X;w;h] each til n; dw,:sum[abs[y-f]]; w:w-delta];

f w
 dw
 sum[w]
 xr:10*n?1f
 yr:fhat[;X;w;h] each x
