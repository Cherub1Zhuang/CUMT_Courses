function [x,y] = ode(f,a,b,h,y0,method)
%ODE ͨ�������������Զಽ�����һ��΢�ַ������� y�� = f(x,y)
%   h����պû��� [a.b]
x = a:h:b;
% x �� x1, x2, ..., xm
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
        % ʹ�����Զಽ��ʱ�������y2,y3,...,y(k)��k-1��ֵ��ͬ��R-K�������
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

