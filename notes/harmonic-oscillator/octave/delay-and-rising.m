
t=linspace(0,40,5001);

Ndamped=2;
Nunderdamped=7;

%Q=logspace(-1,log10(0.5)-0.005,Ndamped);
Q=[0.1,0.25]

data=zeros(4,Ndamped+Nunderdamped+1);

for i=1:numel(Q)
  zeta=1/2/Q(i);

  p2=-zeta*2*pi+2*pi*sqrt(zeta^2-1);
  p1=-zeta*2*pi-2*pi*sqrt(zeta^2-1);

  y=1-(p2/(p2-p1)*e.^(p1*t)-p1/(p2-p1)*e.^(p2*t));

  %plot(t,y);
  %hold on;

  td=interp1 (y, t, 0.5)
  t1090=interp1 (y, t, 0.9)-interp1 (y, t, 0.1)
  t2080=interp1 (y, t, 0.8)-interp1 (y, t, 0.2)
  t3070=interp1 (y, t, 0.7)-interp1 (y, t, 0.3)

  data(1,i) = Q(i);
  data(2,i) = td;
  data(3,i) = t1090;
  data(4,i) = t2080;
  data(5,i) = t3070;
end

y=1-e.^(-2*pi*t).*(1+2*pi*t)
td=interp1 (y, t, 0.5)
t1090=interp1 (y, t, 0.9)-interp1 (y, t, 0.1)
t2080=interp1 (y, t, 0.8)-interp1 (y, t, 0.2)
t3070=interp1 (y, t, 0.7)-interp1 (y, t, 0.3)
data(1,Ndamped+1) = 0.5;
data(2,Ndamped+1) = td;
data(3,Ndamped+1) = t1090;
data(4,Ndamped+1) = t2080;
data(5,Ndamped+1) = t3070;

Q=logspace(log10(0.5)+0.005,1,Nunderdamped);
Q=[1/sqrt(3), 1/sqrt(2), 0.85, 1, sqrt(2), 2, 5]

for i=1:numel(Q)
  zeta=1/2/Q(i);

  t=linspace(0,Q(i)/sqrt(4*Q(i)**2-1),5001);

  phi=acos(zeta)
  y=1-e.^(-zeta*2*pi*t).*sin(2*pi*sqrt(1-zeta^2)*t+phi)/sin(phi);

  td=interp1 (y, t, 0.5)
  t1090=interp1 (y, t, 0.9)-interp1 (y, t, 0.1)
  t2080=interp1 (y, t, 0.8)-interp1 (y, t, 0.2)
  t3070=interp1 (y, t, 0.7)-interp1 (y, t, 0.3)

  data(1,Ndamped+1+i) = Q(i);
  data(2,Ndamped+1+i) = td;
  data(3,Ndamped+1+i) = t1090;
  data(4,Ndamped+1+i) = t2080;
  data(5,Ndamped+1+i) = t3070;
end



loglog(data(1,:),data(2,:));
hold on;
loglog(data(1,:),data(3,:));
loglog(data(1,:),data(4,:));
loglog(data(1,:),data(5,:));



