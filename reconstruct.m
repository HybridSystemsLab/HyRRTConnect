function [x_recon] = reconstruct(x0_recon, t_recon, j_recon, u_recon)
    
    global options;
    global rule;
    
    x0 = x0_recon;
    x_m = size(x0_recon, 1);
    m = size(t_recon, 2);
    x_recon = zeros(x_m, m);
    x_recon(:, 1) = x0;
    D_pham = @(x) 0;
    
    D_pham_true = @(x) 1;
    for i = 1: (m - 1)
        u = u_recon(:, i);
        if (j_recon(i) == j_recon(i + 1))
            t_span = [0, t_recon(1, i + 1) - t_recon(1, i)];
            rule = 2;
            [t,j,x] = HyEQsolver(@(x) f(x, u),@(x) g(x, 0),@C, @D_pham, x0, t_span, [0, 1], rule ,options,'ode23t');
            x0 = x(end, :)';
            x_recon(:, i + 1) = x0;
        else 
%             t_span = [0, 100];
%             rule = 1;
%             [t,j,x] = HyEQsolver( @(x) f(x, 0),@(x) g(x, u),@C,@D_pham_true, x0,t_span,[0, 1], rule, options,'ode23t');
            x = g(x0, u);
            x0 = x;
            x_recon(:, i + 1) = x0;
        end
    end
end