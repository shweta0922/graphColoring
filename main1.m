function c_count=main1(x,g)
    c_count = 0;
    x = ceil(x);
    
    % as we have to reduce the number of color used, finds number of unique
    % colors
    num_col_used = size(unique(x));
    num_col_used = num_col_used(2);
    num_nodes = g.numnodes;
    g.Nodes.value = x.';
    for i=1:num_nodes
        kk = neighbors(g,i);
        nei_len = length(kk);
        for nei = 1:nei_len
            if x(i) == x(kk(nei))
                c_count = c_count + 1;
            end
        end
    end
    c_count = c_count / 2;
    %disp(['c_cout :',num2str(c_count)]);
    % returns the total conflict plus the number of color that should be
    % minimized .MORE weight is given to conflict so squared
    c_count = ((c_count + 1)*(c_count + 1)) + num_col_used;
end
