%% plotting
clear all; close all;
[f_names]=filenames_Test; % loads all the file names
cEOD=[];
cPos=[];
%[1:5,7:13]
%[14:17,19:30]
%31:47

for i= [14:17,19:30] % en
    
    
    load(f_names(i,1:20))
    data=eval(f_names(i,1:16));
    
    % Get the frame nos of approach trajectories
    BG=data.BG;
    S_frames=data.S_frames;
    
    traj=data.ex_2(find(data.ex_2>0));
    ik=0;
    k=1;
    ij=1;
    for ii = traj
        
        a=data.S_frames(ii,1);
        e=data.S_frames(ii,5)-a;
        ef=data.S_frames(ii,5);
        eod_Pos=data.eod_Pos;
        c_Position=data.c_Position;
        
        siz_c=size(c_Position);
        siz_e=size(eod_Pos);
        len=min(siz_c(1),siz_e(1));
        
        reshape_cPos=[];
        reshape_eod=[];
        
        
        if ij==1
            x=c_Position(1:e,ij);
            y=c_Position(1:e,ij+1);
            EOD=flipud(eod_Pos(1:e,ij));
            c_pos=[x,y];
            reshape_cPos= [reshape_cPos;c_pos];
            reshape_eod=[reshape_eod;EOD];
            ik=ik+2;
            ij=ij+1;
        else
            x=c_Position(1:e,1+ik);
            y=c_Position(1:e,2+ik);
            EOD=flipud(eod_Pos(1:e,ij));
            c_pos=[x,y];
            reshape_cPos= [reshape_cPos;c_pos];
            reshape_eod=[reshape_eod;EOD];
            ij=ij+1;
            ik=ik+2;
        end
        
        clear x y c_pos EOD
        
        cEOD=[cEOD;reshape_eod];
        cPos=[cPos;reshape_cPos];
    end
    
    
    
    clearvars -except cEOD cPos i f_names Distance
end

load('ct_im.mat');
figure
imshow(ct_im)
colormap('jet');
caxis([0 100])
hold on
scatter(cPos(:,1),cPos(:,2),20,cEOD,'filled')
title('EOD')


arena_map(cEOD,cPos,ct_im)




