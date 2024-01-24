
clc;
clear all;
close all;

counter = 0;
timelist = [];
treesize = [];
while(counter < 20)
    disp(['Run:' mat2str(counter) ' Started']);
    [t, T_fw, T_bw, motionplan] = rrt();
    if (~isempty(motionplan)) 
        break;
%         timelist = [timelist, t];
%         treesize = [treesize, size(T_fw.Node) + size(T_bw.Node)];
%         counter = counter + 1;
    end
end

ave_time = mean(timelist)
ave_treesize = mean(treesize)