function w=wielomian(x)
w=-2*x^4+3*x^3+6*x^2+2*x+3;
counter=1;
for i=-100:1:100
    daney(counter)=-2*i^4+3*i^3+6*i^2+2*i+3;
    counter=counter+1;
end
danex=[-100:1:100];
plot(danex,daney);
end