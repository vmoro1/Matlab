xaxel_origo=3;
yaxel_origo=3;
zaxel_origo=3;
antal_punkter=100;

a=-xaxel_origo+(2.*xaxel_origo.*rand(antal_punkter,1));

b=-yaxel_origo+(2.*yaxel_origo.*rand(antal_punkter,1));

c=-zaxel_origo+(2.*zaxel_origo.*rand(antal_punkter,1));

scatter3(a,b,c)

r=((a.^2)/xaxel_origo^2)+((b.^2)/yaxel_origo^2)+((c.^2)/zaxel_origo^2);

innanfor=sum(r<=1);

andel=innanfor/antal_punkter
volym_ratblock=(2*xaxel_origo)*(2*yaxel_origo)*(2*zaxel_origo);

global volym_klot
global teoretisk_volymklot
volym_klot=volym_ratblock*andel
teoretisk_volymklot=(4*pi*xaxel_origo*yaxel_origo*zaxel_origo)/3;
procentuell_avvikelse=100*(abs(volym_klot-teoretisk_volymklot)/teoretisk_volymklot)