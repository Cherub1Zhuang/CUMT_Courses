function [x,y] = ode(f,a,b,h,y0,method)
%ODE 通过单步法、线性多步法求解一阶微分方程问题 y′ = f(x,y)
%   h必须刚好划分 [a.b]
x = a:h:b;
% x 是 x1, x2, ..., xm
m = size(x,2);
y = zeros(1,m);
y(1) = y0;
for i = 1:m-1
    if strcmp(method,'euler')
        y(i+1) = y(i) + h * f(x(i),y(i));
    elseif strcmp(method,'second_order_R_K')
        k1 = f(x(i),y(i));
        k2 = f(x(i+1),y(i)+h*k1);
        y(i+1) = y(i) + h * (k1+k2)/2;
    elseif strcmp(method,'fourth_order_R_K')
        k1 = f(x(i),y(i));
        k2 = f(x(i)+h/2,y(i)+h/2*k1);
        k3 = f(x(i)+h/2,y(i)+h/2*k2);
        k4 = f(x(i)+h,y(i)+h*k3);
        y(i+1) = y(i) + h*(k1+2*k2+2*k3+k4)/6;
    elseif strcmp(method,'fourth_order_Adams_explicit')
        % 使用线性多步法时，所需的y2,y3,...,y(k)这k-1个值由同阶R-K方法算出
        if i == 1
            [~,y(1:4)] = ode(f,a,x(4),h,y0,'fourth_order_R_K');
        elseif i >= 4
            y(i+1) = y(i) + h*( 55*f(x(i),y(i)) - 59*f(x(i-1),y(i-1)) + 37*f(x(i-2),y(i-2)) - 9*f(x(i-3),y(i-3)) )/24;
        end
    elseif strcmp(method,'fourth_order_Adams_predictive_correction')
        if i == 1
            [~,y(1:4)] = ode(f,a,x(4),h,y0,'fourth_order_R_K');
        elseif i >= 4
            y(i+1) = y(i) + h*( 55*f(x(i),y(i)) - 59*f(x(i-1),y(i-1)) + 37*f(x(i-2),y(i-2)) - 9*f(x(i-3),y(i-3)) )/24;
            y(i+1) = y(i) + h*( 9*f(x(i+1),y(i+1)) + 19*f(x(i),y(i)) - 5*f(x(i-1),y(i-1)) + f(x(i-2),y(i-2)) )/24;
        end
    end
end
end

