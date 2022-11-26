clear
format compact

sysP = tf([1],[1 2 10]);

Frate = 100; % 1 ïbä‘Ç†ÇΩÇËÇÃÉRÉ}êî

num = 0;
for t_end = 0.01:0.01:5
    figure(1)
    clf
    subplot('Position',[0.18 0.18 0.75 0.75])

    t = 0:0.01:t_end;
    z = impulse(sysP,t);
    
    plot([0 5],[0 0],'k')
    hold on
    plot(t,z,'LineWidth',1.5,'Color',[232 71 70]/255)
    hold off

    xlim([0 5])
    ylim([-0.1 0.3])
    set(gca,'FontSize',18,'FontName','arial')
    set(gca,'XTick',0:1:5)
    set(gca,'YTick',-0.1:0.1:0.3)
    
    xlabel('$t$ [s]','FontSize',20,'interpreter','latex')
    ylabel('$y(t)$','FontSize',20,'interpreter','latex')
    
    grid on
        
    drawnow
    
 
    num = num + 1;
    Frame(num) = getframe(1);
end


% write to video
v = VideoWriter('plot_msd_impulse.avi');
v.FrameRate = Frate; % Framerate

open(v);
writeVideo(v,Frame);
close(v);

