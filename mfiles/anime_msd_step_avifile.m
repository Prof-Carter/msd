clear
format compact

sysP = tf([1],[1 2 10]);

t = 0:0.01:5;
%z = impulse(sysP,t);
z = step(sysP,t);

n = length(t);

cart_w = 0.14;
cart_h = 0.2;

line_w = 0.15;
wall   = 0.95;


spring_h = 0.04;

line_x1 = cart_w;
line_x2 = cart_w + line_w;
line_x3 = wall   - line_w;
line_x4 = wall;

line_y1 = 0.2;

% ダンパ
line_w2 = 0.4;

line_x2d = cart_w + line_w2;
line_y2 = 0.1;


line_x3d = 0.4;
line_x4d = 0.85;


Frate = 100; % 1 秒間あたりのコマ数

num = 0;
for i = 1:1:n
    i
    figure(1)
    clf
        
    kizami = (line_x3 - (line_x2 + z(i)))/20;

    % ========== 地面・かべ =============================================
    xaxis = [-0.5 0.95 0.95 1    1   -0.5];
    yaxis = [ 0   0   0.3 0.3 -0.5 -0.5]; 
    patch(xaxis,yaxis,[148 138 84]/255,'EdgeColor',[1 1 1])
    hold on
    
    % ========== 台車 =============================================
%     pgon = polyshape([-cart_w cart_w cart_w -cart_w]+z(i),[0 0 cart_h cart_h]);
%     plot(pgon)
    xaxis = [-0.14 -0.14 0.14 0.14 -0.14];
    yaxis = [ 0     0.2  0.2  0     0   ]+0.05;
    patch(xaxis+z(i),yaxis,[235 241 222]/255,'EdgeColor',[119 147 60]/255,'LineWidth',1.5)
    
    plot(-0.075+z(i),0.05,'o','MarkerSize',12,'MarkerEdgeColor','k','MarkerFaceColor',[64 64 64]/255,'LineWidth',1.5)
    plot( 0.075+z(i),0.05,'o','MarkerSize',12,'MarkerEdgeColor','k','MarkerFaceColor',[64 64 64]/255,'LineWidth',1.5)
    
    
    % ========== ばね =============================================
    plot([line_x1 line_x2]+z(i),[1 1]*line_y1,'Color',[0.5 0.5 0.5],'LineWidth',1.5)
    plot([line_x3 line_x4],     [1 1]*line_y1,'Color',[0.5 0.5 0.5],'LineWidth',1.5)
        
    plot([line_x2+z(i)+0*kizami  line_x2+z(i)+1*kizami], [line_y1          line_y1+spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    plot([line_x2+z(i)+3*kizami  line_x2+z(i)+5*kizami], [line_y1-spring_h line_y1+spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    plot([line_x2+z(i)+7*kizami  line_x2+z(i)+9*kizami], [line_y1-spring_h line_y1+spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    plot([line_x2+z(i)+11*kizami line_x2+z(i)+13*kizami],[line_y1-spring_h line_y1+spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    plot([line_x2+z(i)+15*kizami line_x2+z(i)+17*kizami],[line_y1-spring_h line_y1+spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    plot([line_x2+z(i)+19*kizami line_x2+z(i)+20*kizami],[line_y1-spring_h line_y1         ],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    
    plot([line_x2+z(i)+1*kizami  line_x2+z(i)+3*kizami], [line_y1+spring_h line_y1-spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    plot([line_x2+z(i)+5*kizami  line_x2+z(i)+7*kizami], [line_y1+spring_h line_y1-spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    plot([line_x2+z(i)+9*kizami  line_x2+z(i)+11*kizami],[line_y1+spring_h line_y1-spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    plot([line_x2+z(i)+13*kizami line_x2+z(i)+15*kizami],[line_y1+spring_h line_y1-spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    plot([line_x2+z(i)+17*kizami line_x2+z(i)+19*kizami],[line_y1+spring_h line_y1-spring_h],'Color',[0.5 0.5 0.5],'LineWidth',1.5) 
    
    % ========== ダンパ =============================================
    plot([line_x1 line_x2d]+z(i),[1 1]*line_y2,'Color',[0.5 0.5 0.5],'LineWidth',1.5)
    plot([line_x4d line_x4],     [1 1]*line_y2,'Color',[0.5 0.5 0.5],'LineWidth',1.5)
    
    plot([line_x2d line_x2d]+z(i),[line_y2-0.02 line_y2+0.02],'Color',[0.5 0.5 0.5],'LineWidth',1.5)
    
    plot([line_x3d line_x4d],[line_y2+0.03 line_y2+0.03],'Color',[0.5 0.5 0.5],'LineWidth',1.5)
    plot([line_x3d line_x4d],[line_y2-0.03 line_y2-0.03],'Color',[0.5 0.5 0.5],'LineWidth',1.5)
    plot([line_x4d line_x4d],[line_y2-0.03 line_y2+0.03],'Color',[0.5 0.5 0.5],'LineWidth',1.5)

    plot([0 0],[-0.5 1],'k','LineWidth',0.5)
    
    % ========== 矢印 =============================================
    xaxis = [-0.24 -0.14 -0.24 -0.24];
    yaxis = [0.05 0.1 0.15 0.05]+0.05;
    
    xx1 = -0.44;
    xx2 = -0.24;
    xx3 = -0.14;
    yy1 = 0.135;
    yy2 = 0.1;
    yy3 = 0.15;
    yy4 = 0.2;
    yy5 = 0.165;
    xaxis = [xx1 xx2 xx2 xx3 xx2 xx2 xx1 xx1];
    yaxis = [yy1 yy1 yy2 yy3 yy4 yy5 yy5 yy1];
    
    patch(xaxis+z(i),yaxis,[0.5 0.5 0.5],'EdgeColor',[0.5 0.5 0.5],'LineWidth',0.5)
    text(-0.475+z(i),0.25,'$u(t) = 1$','FontSize',16,'interpreter','latex')
    
    title(['$t = ',num2str(t(i),'%2.1f'),'$'],'FontSize',20,'interpreter','latex')
    
    axis('square')
    hold off

    axis([-0.5 1 -0.5 1])
    set(gca,'FontSize',12,'FontName','arial')
    set(gca,'XTick',-0.5:0.1:1)
    set(gca,'YTick',-0.5:0.1:1)
%   set(gca,'XTick',[])        % 横軸の目盛
 	set(gca,'XTickLabel',[])   % 横軸の目盛のラベル
% 	set(gca,'YTick',[])        % 縦軸の目盛
 	set(gca,'YTickLabel',[])   % 縦軸の目盛のラベル
    
%    axis off
    box on
    grid on
        
    drawnow    
 
    num = num + 1;
    Frame(num) = getframe(1);
end


% write to video
v = VideoWriter('msd_step.avi');
v.FrameRate = Frate; % Framerate

open(v);
writeVideo(v,Frame);
close(v);

