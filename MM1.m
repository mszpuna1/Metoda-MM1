function [x3]=MM1(x0, x1, x2, epsilon, maxiterations)

for i=1:maxiterations
    y0=wielomian(x0);
    y1=wielomian(x1);
    y2=wielomian(x2);
    
    z0=x0-x2;
    z1=x1-x2;

    c=wielomian(x2);
    A=[z0^2, z0; z1^2, z1];
    b=[wielomian(x0)-wielomian(x2); wielomian(x1)-wielomian(x2)];
    X=pelny_gauss(A, b);
    a=X(1, 1);
    b=X(2, 1);
    
    d1=b+sqrt(b^2-4*a*c);
    d2=b-sqrt(b^2-4*a*c);
    if abs(d1)>=abs(d2)
        z_min=-2*c/d1;
    else
        z_min=-2*c/d2;
    end
    x3=x2+z_min;
    if abs(wielomian(x3))<epsilon
        break;
    end
    dx0=abs(x3-x0);
    dx1=abs(x3-x1);
    dx2=abs(x3-x2);
    if dx0>dx1 & dx0>dx2
        x0=x2;
        x2=x3;
    elseif dx1>dx0 & dx1>dx2
        x1=x2;
        x2=x3;
    else
        x2=x3;
    end    
    
end
