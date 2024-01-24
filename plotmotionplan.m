m_state = size(x0, 1);

figure('Name', 'States');
for i = 1:m_state
    subplot(m_state, 1, i); plot(solution(1,:), solution(i + 2, :),'DisplayName', ['State ', mat2str(i)]);
    hold on
    legend;
end

m_input = size(U_C_bw, 1);
figure('Name', 'Inputs');
for i = 1:m_input
    subplot(m_input, 1, i); plot(solution(1,:), solution(i + 2 + m_state, :),'DisplayName', ['Input ', mat2str(i)]);
    hold on
    legend;
end
