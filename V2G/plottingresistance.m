%Plotting resistance


E=importdata("Outputs_Oct23_default_DRC_DRC");
F=importdata("Outputs_Oct23_GM_DRC_DRC");
G=importdata("Outputs_Oct23_GM_RC_RC");
H=importdata("Outputs_Oct23_default_RC_RC");


%Finding resitance
data=H;
for i=1:length(data.cycle_num)
    data.R(i)=max(data.ECM_whole_res((data.t<data.cycle_time(i)) ));
end
    data.R_unique=data.R(1);
    data.unique_cycle=data.cycle_num(1);
for j=1: length(data.R)
    if data.R(j)~=data.R_unique(end)

    data.R_unique=[data.R_unique; data.R(j)];
    data.unique_cycle=[data.unique_cycle; data.cycle_num(j)];
    end
end

hold on; plot(data.unique_cycle, data.R_unique);

legend('default Drive Cycle DCR-DCR', 'GM Drive Cycle DCR-DCR', 'GM Drive Cycle RC-RC (No V2G)', 'default Drive Cycle RC-RC (No V2G)')
