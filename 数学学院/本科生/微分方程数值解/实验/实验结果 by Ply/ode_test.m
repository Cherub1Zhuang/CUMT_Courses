f = @(x,y)y-2*x/y; a = 0; b = 1; y0 = 1; 
h_ = [1/5,1/10,1/20,1/40];
for method={'euler','second_order_R_K','fourth_order_R_K','fourth_order_Adams_explicit','fourth_order_Adams_predictive_correction'}
    solutions = zeros(size(h_,2),size(a:min(h_):b,2))*nan;
    for i = 1:size(h_,2)
        h = h_(i);
        [x,y]=ode(f,a,b,h,y0,method);
        solutions(i,1:2^(size(h_,2)-i):size(solutions,2)) = y;
    end
    % 计算精确解
    solutions(size(h_,2)+1,:) = sqrt(1+2*(a:min(h_):b));
    % 计算绝对误差
    for i = 1:size(h_,2)
        solutions(i,:) = solutions(i,:) - solutions(size(h_,2)+1,:);
    end
    % 计算收敛阶
    rr = [];
    for i = 1:size(h_,2)-1
        rr=[rr,abs(solutions(i,size(solutions,2))/solutions(i+1,size(solutions,2)))];
    end
    method
    solutions'
    rr1 = mean(log(rr)/log(2))
end