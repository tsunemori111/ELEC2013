% clc;
% close all;
% 
% %数据初始化
% x = [75.8, 78.8, 80.6, 72.6, 63.5, 59.5, 57.1];
% y = [62.6, 51.3, 33.4, 10.6, 12.2, 14.2, 9.6];
% 
% figure;
% p1 = polyfit(x, y, 1);
% y_fit = polyval(p1, x);
% plot(x,y,'b0', 'MarkerSize', 8, 'LineWidth', 1.5);
% hold on;
% plot(x,y_fit,'b-', 'MarkerSize', 8, 'LineWidth', 1.5);
% grid on;
% xlabel('0光程点的条纹可见度','FontSize',12);
% ylabel('局部条纹可见度', 'FontSize', 12);
% title('光源单色性对干涉条纹可见度的影响');
% legend('实验数据', '拟合曲线', 'Location','northest');

clc;
close all;

% 数据初始化
x = [75.8, 78.8, 80.6, 72.6, 63.5, 59.5, 57.1];  % 0光程点的条纹可见度
y = [62.6, 51.3, 33.4, 10.6, 12.2, 14.2, 9.6];   % 局部条纹可见度

% 创建图形
figure('Position', [100, 100, 800, 600]);

% 线性拟合
p1 = polyfit(x, y, 1);
y_fit = polyval(p1, x);

% 绘制数据点和拟合曲线
plot(x, y, 'bo', 'MarkerSize', 8, 'LineWidth', 1.5, 'MarkerFaceColor', 'b');  % 修正：'b0' -> 'bo'
hold on;
plot(x, y_fit, 'r-', 'LineWidth', 2);  % 拟合曲线用红色以便区分
grid on;

% 设置坐标轴标签和标题
xlabel('0光程点的条纹可见度 (%)', 'FontSize', 12);
ylabel('局部条纹可见度 (%)', 'FontSize', 12);
title('光源单色性对干涉条纹可见度的影响', 'FontSize', 14, 'FontWeight', 'bold');

% 图例
legend('实验数据', '拟合曲线', 'Location', 'northeast');  % 修正：'northest' -> 'northeast'

% 添加拟合方程和相关系数
R2 = 1 - sum((y - y_fit).^2) / sum((y - mean(y)).^2);  % 计算R²
equation_text = sprintf('拟合方程: y = %.4fx + %.4f', p1(1), p1(2));
R2_text = sprintf('R² = %.4f', R2);
text(60, 55, equation_text, 'FontSize', 20, 'BackgroundColor', 'white');
text(60, 50, R2_text, 'FontSize', 20, 'BackgroundColor', 'white');

% 输出拟合结果
fprintf('\n==================== 拟合结果 ====================\n');
fprintf('拟合方程: y = %.4fx + %.4f\n', p1(1), p1(2));
fprintf('斜率: k = %.4f\n', p1(1));
fprintf('截距: b = %.4f\n', p1(2));
fprintf('决定系数: R² = %.4f\n', R2);
fprintf('==================================================\n\n');

% 分析结果
if p1(1) > 0
    fprintf('结论: 0光程点的条纹可见度与局部条纹可见度呈正相关关系。\n');
    fprintf('      这说明光源的相干长度越长(单色性越好),干涉条纹的可见度越高。\n');
else
    fprintf('结论: 0光程点的条纹可见度与局部条纹可见度呈负相关关系。\n');
end