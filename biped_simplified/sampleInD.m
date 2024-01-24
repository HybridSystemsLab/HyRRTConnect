function sample = sampleInD(N)
%SAMPLEIND Summary of this function goes here
%   Detailed explanation goes here
while(1)
    sample_1 = 2*pi*(rand() - 0.5);
    sample_2 = 2*pi*(rand() - 0.5);
    sample_3 = 2*pi*(rand() - 0.5);
    sample_4 = 8 * (rand() - 0.5);
    sample_5 = 8 * (rand() - 0.5);
    sample_6 = 2 * (rand() - 0.5);
    sample = [sample_1; sample_2; sample_3; sample_4; sample_5; sample_6];
    if (D(sample))
        break;
    end
end
end

