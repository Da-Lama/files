%% plotting
clear all; close all;
[f_names]=filenames_Test; % loads all the file names
EOD=[];
cPos=[];
%[1:5,7:13]
%[14:17,19:30]
%31:47
for i= [1:5,7:13] % en    
    
    
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
    reshape_eod=[];
    for ij = 1:2:siz_c(2)
        reshape_cPos= [reshape_cPos;c_Position(1:len,ij:ij+1)];
    end
    
    for ik = 1:siz_c(2)/2
    reshape_eod=[reshape_eod;eod_Pos(1:len,ik)];
    end 
    
   
    
    EOD=[EOD;reshape_eod];
    cPos=[cPos;reshape_cPos];
    
    clearvars -except EOD cPos i f_names Distance
end

load('ct_im.mat');
figure
imshow(ct_im)
colormap('jet');
caxis([0 100])
hold on
scatter(cPos(:,1),cPos(:,2),20,EOD,'filled')
title('EOD')





