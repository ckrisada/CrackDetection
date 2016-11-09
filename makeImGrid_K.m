function [patches,no_patch] = makeImGrid_K(Img)

[row,col,tmp] = size(Img);
no_patch = [9 9]; %default number of patches

%need to calculate the patch size automatically
if nargin > 1
    no_patch = varargin{1};
end
no_patch_row = no_patch(1);
no_patch_col = no_patch(2);
if mod(row,no_patch_row) ~= 0 & mod(col,no_patch_col) ~= 0
    error('patch size and image dimension mismatch')
end

patch_row = row/no_patch_row;
patch_col = col/no_patch_col;
patches = cell(no_patch_row,no_patch_col);
for m = 1:no_patch_row
    for n = 1:no_patch_col
        patches{m,n}.I = Img(patch_row*(m-1)+1:patch_row*(m-1)+patch_row,patch_col*(n-1)+1:patch_col*(n-1)+patch_col,:);
        patches{m,n}.x = [patch_row*(m-1)+1,patch_row*(m-1)+patch_row];
        patches{m,n}.y = [patch_col*(n-1)+1,patch_col*(n-1)+patch_col];
    end
end 