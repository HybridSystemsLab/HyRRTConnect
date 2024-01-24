%% forward search treee

T_fw = tree(x0);  % initialize a empty tree
N = size(x0); % state dimensions
I_D_fw = [];
if (Dprime(x0)) 
    I_D_fw = [I_D_fw, 1];
end

edge_map_fw = containers.Map('KeyType','double','ValueType','any');
reachedset_fw = containers.Map('KeyType','double','ValueType','any');
reachedset_fw = addstatetoreachedset(x0, reachedset_fw, 1);
edge_map_fw(1) = containers.Map('KeyType','double','ValueType','any');

%% backward search tree

T_bw = tree(xf);  % initialize a empty tree

I_D_bw = [];
if (Dprime(xf)) 
    I_D_bw = [I_D_bw, 1];
end

edge_map_bw = containers.Map('KeyType','double','ValueType','any');
reachedset_bw = containers.Map('KeyType','double','ValueType','any');
reachedset_bw = addstatetoreachedset(xf, reachedset_bw, 1);
edge_map_bw(1) = containers.Map('KeyType','double','ValueType','any');

