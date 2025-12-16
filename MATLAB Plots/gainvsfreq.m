% Frequency (MHz)
f = [14.950 14.960 14.970 14.980 14.985 14.990 14.995 15.000 ...
     15.005 15.010 15.015 15.020 15.030 15.040 15.050];

% Gain (dB)
g = [19.65 20.83 21.44 21.14 21.87 22.54 25.20 49.19 34.96 ...
     31.59 20.98 20.34 19.82 20.51 19.28];

gaussEqn = 'a*exp(-((x-b)/c)^2) + d';
start = [50, mean(f), (max(f)-min(f))/10, 0];

fitmodel = fit(f.', g.', gaussEqn, 'Start', start);

f_fit = linspace(min(f), max(f), 20000);
g_fit = fitmodel(f_fit);

%  PLOT STYLE
figure;
hold on;

% Blue circular data points
plot(f, g, 'o', ...
    'Color', [0.2 0.6 1], ...
    'MarkerSize', 6, ...
    'LineWidth', 1.2);

% Thin red fitted curve
plot(f_fit, g_fit, 'r', 'LineWidth', 1);
xlim([14.950 15.050]);

%  AXIS LABELS / TITLE
xlabel('Frequency (MHz)');
ylabel('|H(\omega)|_{dB}');

%  GRID (dotted)
grid on;
ax.GridLineStyle = ':';
ax.MinorGridLineStyle = ':';
ax.MinorGridColor = [0.85 0.85 0.85];
ax.GridAlpha = 0.35;
ax.MinorGridAlpha = 0.25;
ax.XMinorGrid = 'on';
ax.YMinorGrid = 'on';

%  LEGEND
legend({'data','fitted curve'}, 'Location','northeast', 'Box','on');

set(gca, 'FontName', 'Helvetica', 'FontSize', 12);

hold off;