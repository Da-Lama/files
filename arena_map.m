function []= arena_map(Values,Position,Background)

Trajectory=Position;

Hintergrund=Background;
xs=Trajectory(:,1);
ys=Trajectory(:,2);
xdim=size(Hintergrund,2);
ydim=size(Hintergrund,1);
Nxbins=xdim/1;
Nybins=ydim/1;
% Nxbins=xdim/4;rg
% Nybins=ydim/4;rg
%ys=ydim-ys; % YValues are inverted due to analysis script.
% Therefore values are converted to positive values according to the current screen resolution
xbins=0:xdim/(Nxbins):xdim; % BinBorders for xDimension
ybins=0:ydim/(Nybins):ydim; % BinBorders for yDimension
% re=Nxbins/xdim;
sds=zeros(Nybins,Nxbins);

SD_new=Values;

for x=1:Nxbins
    for y=1:Nybins
        temp=SD_new(xs>=xbins(x) & xs<xbins(x+1) & ys>=ybins(y) & ys<ybins(y+1));
        %sds(x,y)= nanmean(temp(temp>=0));
        sds(y,x)= nanmean(temp(temp>=0));rg
    end
end
sds(isnan(sds))=0;





% figure
% imshow(Hintergrund)
% hold on
% surf(sds)
figure
contour(sds)
title('EOD density heat map')
figure
contourf(sds)
title('EOD density heat map')
end 
