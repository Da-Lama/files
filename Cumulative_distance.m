%% plotting
clear all; close all;
[f_names]=filenames_Test; % loads all the file names
cPos=[];
Distance=[];
%[1:5,7:13]
%[14:17,19:30]
%31:47
for i= [14:17,19:30]% en    
    
    load(f_names(i,1:20))
    data=eval(f_names(i,1:16));
    
    % Get the frame nos of approach trajectories
    BG=data.BG;
    S_frames=data.S_frames;
    eod_Pos=data.eod_Pos;
    c_Position=data.c_Position;
    siz_c=size(c_Position);
    siz_e=size(eod_Pos);
    len=min(siz_c(1),siz_e(1));

    
    reshape_cPos=[];
    for ij = 1:2:siz_c(2)
        reshape_cPos= [reshape_cPos;c_Position(1:end-1,ij:ij+1)];
    end
    

    distance=[];
    for ij = 1:2:siz_c(2)
        distance= [distance;dist_bt_points(c_Position(:,ij:ij+1))];
    end
    
    cPos=[cPos;reshape_cPos];
    Distance=[Distance;distance];
    
    clearvars -except EOD cPos i f_names Distance
end



load('ct_im.mat');

%distance
figure
imshow(ct_im)
colormap('jet');
caxis([0 15])
hold on
scatter(cPos(:,1),cPos(:,2),20,Distance,'filled')
title('distance')

%speed 
figure
speed=Distance*30;
imshow(ct_im)
colormap('jet');
caxis([0 250])
hold on
scatter(cPos(:,1),cPos(:,2),20,speed,'filled')
title('speed')




