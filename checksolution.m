function [flag, ifw, ibw] = checksolution(Gfw, Gbw, reachedsetfw, reachedsetbw, Iextendedfw, Iextendedbw, isextendedfw, isextendedbw)

% ifw = [];
% ibw = [];
% for i1 = 1:numnodes(Gfw)
%     for i2 = 1:numnodes(Gbw)
%         if norm(getstate(Gfw, i1) -  getstate(Gbw, i2)) < tol
%             ifw = i1;
%             ibw = i2;
%             return;
%         end
%     end
% end
ifw = [];
ibw = [];
flag = 0;
if isextendedfw
    N = size(Iextendedfw, 2);
    for i = 1:N
        x_cur = getstate(Gfw, Iextendedfw(i));
        [flag, idx] = isInreachedset(x_cur, reachedsetbw);
        if flag
            ibw = idx;
            ifw = Iextendedfw(i);
            return;
        end
    end
end
if isextendedbw && (~flag)
    N = size(Iextendedbw, 2);
    for i = 1:N
        x_cur = getstate(Gbw, Iextendedbw(i));
        [flag, idx] = isInreachedset(x_cur, reachedsetfw);
        if flag
            ifw = idx;
            ibw = Iextendedbw(i);
            return;
        end
    end
end

