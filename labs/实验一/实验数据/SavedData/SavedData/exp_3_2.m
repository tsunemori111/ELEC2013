% 方法1：如果数据是表格(table)
% 提取角度和功率数据
if exist('VarName1', 'var') && exist('VarName2', 'var')
    angle = VarName1;
    power = VarName2;
else
    % 如果数据在表格中，假设表格名为您导入的数据表
    % 您可以通过 whos 命令查看工作区中的变量名
    vars = who;
    for i = 1:length(vars)
        if istable(eval(vars{i}))
            data_table = eval(vars{i});
            angle = data_table.VarName1;
            power = data_table.VarName2;
            break;
        end
    end
end

% 确保数据是数值类型
angle = double(angle);
power = double(power);

% 将角度转换为弧度
theta = deg2rad(angle);

% 绘制极坐标图
figure;
polarplot(theta, power, 'b-', 'LineWidth', 2);
hold on;
polarplot(theta, power, 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r');
title('功率变化图', 'FontSize', 14, 'FontWeight', 'bold');
grid on;

% 添加统计信息
fprintf('角度范围: %.0f° 到 %.0f°\n', min(angle), max(angle));
fprintf('功率范围: %.1f 到 %.1f\n', min(power), max(power));