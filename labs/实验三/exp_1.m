% 数据初始化
x = 100:50:300;  % D距离 (mm)
y1 = [315.64, 483, 642.38, 805.88, 984];  % d=0.2mm 650nm激光器 (um)
y2 = [241.76, 376.13, 516.38, 639, 767.63];  % d=0.2mm 520nm激光器 (um)
y3 = [126.23, 192.41, 257.913, 323.89, 389.63];  % d=0.5mm 650nm激光器 (um)
y4 = [99.26, 153, 204, 256.24, 305.51];  % d=0.5mm 520nm激光器 (um)

% 创建图形窗口
figure('Position', [100, 100, 1200, 900]);

% 子图1: d=0.2mm, 650nm激光器
subplot(2, 2, 1);
p1 = polyfit(x, y1, 1);  % 一次多项式拟合
y1_fit = polyval(p1, x);  % 计算拟合值
plot(x, y1, 'ro', 'MarkerSize', 8, 'LineWidth', 1.5);  % 原始数据点
hold on;
plot(x, y1_fit, 'r-', 'LineWidth', 2);  % 拟合曲线
grid on;
xlabel('D (mm)', 'FontSize', 12);
ylabel('Δx (μm)', 'FontSize', 12);
title('d=0.2mm, λ=650nm', 'FontSize', 13, 'FontWeight', 'bold');
legend('实验数据', '拟合曲线', 'Location', 'northwest');
% text(150, 800, sprintf('斜率 k = %.4f μm/mm', p1(1)), 'FontSize', 11, 'BackgroundColor', 'white');

% 子图2: d=0.2mm, 520nm激光器
subplot(2, 2, 2);
p2 = polyfit(x, y2, 1);
y2_fit = polyval(p2, x);
plot(x, y2, 'bo', 'MarkerSize', 8, 'LineWidth', 1.5);
hold on;
plot(x, y2_fit, 'b-', 'LineWidth', 2);
grid on;
xlabel('D (mm)', 'FontSize', 12);
ylabel('Δx (μm)', 'FontSize', 12);
title('d=0.2mm, λ=520nm', 'FontSize', 13, 'FontWeight', 'bold');
legend('实验数据', '拟合曲线', 'Location', 'northwest');
% text(150, 800, sprintf('斜率 k = %.4f μm/mm', p2(1)), 'FontSize', 11, 'BackgroundColor', 'white');

% 子图3: d=0.5mm, 650nm激光器
subplot(2, 2, 3);
p3 = polyfit(x, y3, 1);
y3_fit = polyval(p3, x);
plot(x, y3, 'mo', 'MarkerSize', 8, 'LineWidth', 1.5);
hold on;
plot(x, y3_fit, 'm-', 'LineWidth', 2);
grid on;
xlabel('D (mm)', 'FontSize', 12);
ylabel('Δx (μm)', 'FontSize', 12);
title('d=0.5mm, λ=650nm', 'FontSize', 13, 'FontWeight', 'bold');
legend('实验数据', '拟合曲线', 'Location', 'northwest');
% text(150, 800, sprintf('斜率 k = %.4f μm/mm', p3(1)), 'FontSize', 11, 'BackgroundColor', 'white');

% 子图4: d=0.5mm, 520nm激光器
subplot(2, 2, 4);
p4 = polyfit(x, y4, 1);
y4_fit = polyval(p4, x);
plot(x, y4, 'go', 'MarkerSize', 8, 'LineWidth', 1.5);
hold on;
plot(x, y4_fit, 'g-', 'LineWidth', 2);
grid on;
xlabel('D (mm)', 'FontSize', 12);
ylabel('Δx (μm)', 'FontSize', 12);
title('d=0.5mm, λ=520nm', 'FontSize', 13, 'FontWeight', 'bold');
legend('实验数据', '拟合曲线', 'Location', 'northwest');
% text(150, 800, sprintf('斜率 k = %.4f μm/mm', p4(1)), 'FontSize', 11, 'BackgroundColor', 'white');

% 添加总标题
sgtitle('杨氏双缝干涉实验 Δx-D 关系曲线', 'FontSize', 15, 'FontWeight', 'bold');

% 输出斜率结果
fprintf('\n==================== 拟合结果 ====================\n');
fprintf('d=0.2mm, λ=650nm: 斜率 k1 = %.4f μm/mm\n', p1(1));
fprintf('d=0.2mm, λ=520nm: 斜率 k2 = %.4f μm/mm\n', p2(1));
fprintf('d=0.5mm, λ=650nm: 斜率 k3 = %.4f μm/mm\n', p3(1));
fprintf('d=0.5mm, λ=520nm: 斜率 k4 = %.4f μm/mm\n', p4(1));
fprintf('==================================================\n\n');

% 根据公式 λ = k * d 计算波长
% k的单位是 μm/mm, d的单位是mm, 因此λ的单位是μm
d1 = 0.2;  % mm
d2 = 0.5;  % mm

lambda1 = p1(1) * d1;  % μm
lambda2 = p2(1) * d1;  % μm
lambda3 = p3(1) * d2;  % μm
lambda4 = p4(1) * d2;  % μm

fprintf('==================== 计算波长 ====================\n');
fprintf('根据公式 λ = k × d 计算:\n');
fprintf('d=0.2mm, λ(650nm激光器) = %.2f nm\n', lambda1 * 1000);
fprintf('d=0.2mm, λ(520nm激光器) = %.2f nm\n', lambda2 * 1000);
fprintf('d=0.5mm, λ(650nm激光器) = %.2f nm\n', lambda3 * 1000);
fprintf('d=0.5mm, λ(520nm激光器) = %.2f nm\n', lambda4 * 1000);
fprintf('==================================================\n');