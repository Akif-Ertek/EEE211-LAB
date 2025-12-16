% Frequency (MHz)
f = [13.0 13.5 14.0 14.5 15.0 15.5 16.0 16.5, 17.0];

% Vpp (mV)
g = [268, 298, 332, 360, 424, 396, 408, 386, 376];

lorentzEqn = 'a ./ (1 + ((x-b)/c).^2) + d';
start = [400, mean(f), 0.5, 0];

fitmodel = fit(f.', g.', lorentzEqn, 'Start', start);

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
xlim([13.0 17.0]);

%  AXIS LABELS / TITLE
xlabel('Frequency (MHz)');
ylabel('Vpp (mV)');

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