f = @(x,u) [x(1)*u+x(2)^2+u; -x(1)*x(2)*u+x(2)^3-x(1)];
[t,y] = ode45(@(t,x) f(x,1), [0:0.05:0.7], [0,0]);

for i = 1:length(t)
    figure("Position", [0,0,1480,1080])

    hold on;
    ax = gca;
    ax.XAxisLocation = "origin";
    ax.YAxisLocation = "origin";
    
    fplot(@(t) cos(t), @(t) sin(t), "LineWidth", 2, ...
                                    "Color","k");
    scatter(y(1:i,1), y(1:i,2), 300, "filled", "ko")

    text(y(i,1), y(i,2)-0.1,"t=" + round(t(i),2))
    
    xlim(ax,[-0.1,1.1]);
    ylim(ax,[-1.1,0.1]);
    
    xlabel("$x$", "Interpreter", "latex");
    ylabel("$y$", "Interpreter", "latex");
    
    set(findall(gcf,'-property','FontSize'),'FontSize',18);

    exportgraphics(gcf,'example_movie.gif','Append',true);

    close gcf;
end


%%

for k = 1:10
    figure("Position", [0,0,1480,1080])
    hold on;
    ax = gca;
    ax.XAxisLocation = "origin";
    ax.YAxisLocation = "origin";
    
    for i=0:(k-1)
        fplot(@(t) t-i/k, [i/k, i/k+1/(2*k)], "k-", "LineWidth", 2);
        fplot(@(t)(i+1)/k-t, [i/k+1/(2*k),(i+1)/k], "k-", "LineWidth", 2);
    end

    text(0.1, 0.5,"k=" + k)
    
    axis([0,1,0,0.6])
    
    set(findall(gcf,'-property','FontSize'),'FontSize',18);

    exportgraphics(gcf,'counterexample_movie.gif','Append',true);

    close gcf;
end

%%

for k = 1:10
    figure("Position", [0,0,1480,1080])
    hold on;
    ax = gca;
    ax.XAxisLocation = "origin";
    ax.YAxisLocation = "origin";
    
    for i=0:(k-1)
        a = fplot(@(t) (t-i/k).^2, [i/k, i/k+1/(2*k)], "k-", "LineWidth", 2);
        area(a.XData, a.YData, 'FaceColor', "k", "FaceAlpha", 0.2)
        a = fplot(@(t) ((i+1)/k-t).^2, [i/k+1/(2*k),(i+1)/k], "k-", "LineWidth", 2);
        area(a.XData, a.YData, 'FaceColor', "k", "FaceAlpha", 0.2)
    end

    text(0.1, 0.2,"k=" + k)
    
    axis([0,1,0,0.3])
    
    set(findall(gcf,'-property','FontSize'),'FontSize',18);

    exportgraphics(gcf,'counterexample_I_movie.gif','Append',true);

    close gcf;
end
