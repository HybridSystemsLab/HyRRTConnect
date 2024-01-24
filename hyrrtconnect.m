function [t, T_fw, T_bw, motionplan] = hyrrtconnect()
clear all
close all

K = 1000;

switch(1)
    case 1
        loadfilepath = 'bouncingball';
    case 2
        loadfilepath = 'biped_simplified';
end
addpath(loadfilepath);
initialization;

%% model parameters

AlgorithmInit;

pn = 0.5;

t_list = [];
tic
for k = 1:K
    
    %% forward propagation
    tic
%     spmd
        
%         if labindex == 1
            n = rand;
            if (n < pn)
                x_rand = sampleInC(N);
                [T_fw, I_new_fw, isextended_fw, edge_map_fw, reachedset_fw, x_new_fw, psi_new_fw] = extend(T_fw, x_rand, edge_map_fw, reachedset_fw, 0);
            else
                x_rand = sampleInD(N);
                [T_fw, I_new_fw, isextended_fw, edge_map_fw, reachedset_fw, x_new_fw, psi_new_fw] = extend(T_fw, x_rand, edge_map_fw, reachedset_fw, 1);
            end
            
            if isextended_fw
                if Dprime(T_fw.get(I_new_fw))
                    I_D_fw = [I_D_fw, I_new_fw];
                end
            end
            
%         else
            %% backward propagation
            n = rand;
            if (n < pn)
                x_rand = sampleInC(N);
                [T_bw, I_new_bw, isextended_bw, edge_map_bw, reachedset_bw, x_new_bw, psi_new_bw] = extend_bw(T_bw, x_rand, edge_map_bw, reachedset_bw, 0);
            else
                x_rand = sampleInD(N);
                [T_bw, I_new_bw, isextended_bw, edge_map_bw, reachedset_bw, x_new_bw, psi_new_bw] = extend_bw(T_bw, x_rand, edge_map_bw, reachedset_bw, 1);
            end
            
            if isextended_bw
                if D_bwprime(T_bw.get(I_new_bw))
                    I_D_bw = [I_D_bw, I_new_bw];
                end
            end
%         end
%     end
    
    %% join two processes
%     T_fw = T_fw{1};
%     I_new_fw = I_new_fw{1};
%     isextended_fw = isextended_fw{1};
%     edge_map_fw = edge_map_fw{1};
%     reachedset_fw = reachedset_fw{1};
%     x_new_fw = x_new_fw{1};
%     psi_new_fw = psi_new_fw{1};
%     I_D_fw = I_D_fw{1};
%     
%     T_bw = T_bw{2};
%     I_new_bw = I_new_bw{2};
%     isextended_bw = isextended_bw{2};
%     edge_map_bw = edge_map_bw{2};
%     reachedset_bw = reachedset_bw{2};
%     x_new_bw = x_new_bw{2};
%     psi_new_bw = psi_new_bw{2};
%     I_D_bw = I_D_bw{2};
%     
    t_list = [t_list, toc];
    
    %% Connect via jump
%     if isextended_fw
%         if Dprime(T_fw.get(I_new_fw))
%             [u, idx] = connectjump_fw(T_fw, I_new_fw, T_bw, I_D_bw);
%             if(~isempty(u))
%                 fprintf('Find the solution!\n')
%                 t = toc
%                 motionplan = constructMP_jump(I_new_fw, T_fw, idx, T_bw, edge_map_fw, edge_map_bw, u);
%                 postprocess
%                 return;
%             end
%         end
%     end
%     
%     if isextended_bw
%         if Dprime(T_bw.get(I_new_bw))
%             [u, idx] = connectjump_bw(T_fw, I_D_fw, T_bw, I_new_bw);
%             if(~isempty(u))
%                 fprintf('Find the solution!\n')
%                 t = toc
%                 motionplan = constructMP_jump(idx, T_fw, I_new_bw, T_bw, edge_map_fw, edge_map_bw);
%                 postprocess;
%                 return;
%             end
%         end
%     end
    
    %% Connection via flow
    if isextended_fw
        [flag, idx] = isInreachedset(T_fw.get(I_new_fw), reachedset_bw);
        if flag
            t = toc
            fprintf('Find the solution!\n')
            motionplan = constructMP(I_new_fw, T_fw, idx, T_bw, edge_map_fw, edge_map_bw);
            postprocess;
            return;
        end
    end
    
    if isextended_bw
        [flag, idx] = isInreachedset(T_bw.get(I_new_bw), reachedset_fw);
        if flag
            t = toc
            fprintf('Find the solution!\n')
            motionplan = constructMP(idx, T_fw, I_new_bw, T_bw, edge_map_fw, edge_map_bw);
            postprocess;
            return;
        end
    end
end
t = toc;
motionplan = [];
fprintf('Fail to find the solution!\n')

end