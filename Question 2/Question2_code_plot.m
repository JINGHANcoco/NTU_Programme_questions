clear all
clc
Vmax = 20;
Km = 20;
S = 1:100;
v = Vmax*S./(Km+S);
GoodS = Km; 
figure,
plot(S,v)
hold on
text(GoodS,Vmax/2,['\leftarrow Vm'],'Color','black',FontSize=13)
xlabel(['[S]'])
ylabel(['Velocity v'])
set(gca,'xticklabel',[]); 
set(gca,'yticklabel',[]); 
title('v = Vm*S./(Km+S)')
