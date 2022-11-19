close all
clear all

set(groot,'defaultAxesXGrid','on')
set(groot,'defaultAxesYGrid','on')


A=importdata("Outputs_Oct20_default_drivecycle_DCRDCR");
B=importdata("Outputs_Oct20_GMdrivecycle_DCRDCR");
C=importdata("Outputs_Oct20_GM_RC_RC");
D=importdata("Outputs_Oct20_default_RC_RC");
E=importdata("Outputs_Nov08_Default_DRC_DRC_P_div_4");
F=importdata("Outputs_Nov08_Default_DRC_DRC_Cell19");
% Out(1,:,:)=importdata("Outputs_Oct20_GMdrivecycle_DCRDCR");
% Out=[Out;importdata("utputs_Oct20_default_drivecycle_DCRDCR")];


% figure(1); plot(A.cycle_num,A.x100,"-b", 'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.x100_GM_DCR_DCR,"-r", 'LineWidth',2);
% plot(D.cycle_num, D.x100, "--b",'LineWidth',2)
% hold on; plot(C.cycle_num, C.x100, "--r",'LineWidth',2)
% title("x_{100}", 'FontSize',16); xlabel("Cycle Number")
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')

% figure(2); plot(A.cycle_num,A.y100,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.y100_GM_DCR_DCR,"-r", 'LineWidth',2);
% plot(D.cycle_num, D.y100,"--b", 'LineWidth',2)
% hold on; plot(C.cycle_num, C.y100, "--r", 'LineWidth',2)
% title("y_{100}", 'FontSize',16); xlabel("Cycle Number")
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')

figure(3); plot(A.cycle_num,A.Cap,"-b",  'LineWidth',2); hold on;
plot(B.cycle_num_GM_DCR_DCR, B.Cap_GM_DCR_DCR,"-r", 'LineWidth',2);
hold on; plot(D.cycle_num, D.Cap,"--b", 'LineWidth',2)
hold on; plot(C.cycle_num, C.Cap, "--r", 'LineWidth',2)
hold on; plot(E.cycle_num, E.Cap, "--g", 'LineWidth',2)
% hold on; plot(F.cycle_num, F.Cap, "-.k", 'LineWidth',2)

legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)',...
    'Kpy P/4 discharge instead of C/4', 'Kpy cell#19')
title("Capacity", 'FontSize',16); xlabel("Cycle Number"); ylabel("Ah")

% figure(4); plot(A.cycle_num,A.C_pos,"-b", 'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.C_pos_GM_DCR_DCR,"-r", 'LineWidth',2);
% hold on; plot(D.cycle_num, D.C_pos, "--b",'LineWidth',2)
% hold on; plot(C.cycle_num, C.C_pos, "--r", 'LineWidth',2)
% legend('KPy  DCR-DCR',  'OEM DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')
% title("C_{p}", 'FontSize',16); xlabel("Cycle Number")


% figure(5); plot(A.cycle_num,A.C_Neg,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.C_Neg_GM_DCR_DCR,"-r", 'LineWidth',2);
% hold on; plot(D.cycle_num, D.C_Neg, "--b",'LineWidth',2)
% hold on; plot(C.cycle_num, C.C_Neg, "--r", 'LineWidth',2)
% 
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')
% title("C_{n}", 'FontSize',16); xlabel("Cycle Number")

% figure(7); plot(A.cycle_num,A.x0,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.x0_GM_DCR_DCR, "-r",'LineWidth',2);
% hold on; plot(D.cycle_num, D.x0, "--b", 'LineWidth',2)
% hold on; plot(C.cycle_num, C.x0, "--r", 'LineWidth',2)
% title("x_{0}", 'FontSize',16); xlabel("Cycle Number")
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')
% 
% figure(8); plot(A.cycle_num,A.y0,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.y0_GM_DCR_DCR,"-r", 'LineWidth',2);
% hold on; plot(D.cycle_num, D.y0,"--b", 'LineWidth',2)
% hold on; plot(C.cycle_num, C.y0, "--r", 'LineWidth',2)
% title("y_{0}", 'FontSize',16); xlabel("Cycle Number")
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')


% figure(9); plot(A.cycle_num,A.LLI,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.LLI_GM_DCR_DCR, "-r",'LineWidth',2);
% hold on; plot(D.cycle_num, D.LLI,"--b", 'LineWidth',2)
% hold on; plot(C.cycle_num, C.LLI, "--r", 'LineWidth',2)
% title("LLi", 'FontSize',16); xlabel("Cycle Number")
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')

% figure(10); plot(A.cycle_num,A.LoC_SEI_summ,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.LoC_SEI_summ_GM_DCR_DCR,"-r", 'LineWidth',2);
% hold on; plot(D.cycle_num, D.LoC_SEI_summ,"--b", 'LineWidth',2)
% hold on; plot(C.cycle_num, C.LoC_SEI_summ, "--r", 'LineWidth',2)
% title("Loss of Capacity due to SEI", 'FontSize',16); xlabel("Cycle Number")
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')


% figure(11); plot(A.cycle_num,A.LAM_P,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.LAM_P_GM_DCR_DCR,"-r", 'LineWidth',2);
% hold on; plot(D.cycle_num, D.LAM_P, "--b",'LineWidth',2)
% hold on; plot(C.cycle_num, C.LAM_P, "--r", 'LineWidth',2)
% title("LAM in positive electrde %", 'FontSize',16); xlabel("Cycle Number")
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')

% figure(12); plot(A.cycle_num,A.LAM_N,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.LAM_N_GM_DCR_DCR,"-r", 'LineWidth',2);
% hold on; plot(D.cycle_num, D.LAM_N,"--b", 'LineWidth',2)
% hold on; plot(C.cycle_num, C.LAM_N, "--r", 'LineWidth',2)
% title("LAM in negative electrde %", 'FontSize',16); xlabel("Cycle Number")
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')


% figure(13); 
% hold on; plot(B.t_GM_DCR_DCR(B.t_GM_DCR_DCR<3600),B.I_GM_DCR_DCR(B.t_GM_DCR_DCR<3600),"-r",'LineWidth',2);
% plot(A.t(A.t<900),A.I(A.t<900),"--b",'LineWidth',2);
% % plot(C.t(C.t<3600), C.I(C.t<3600),"--",'LineWidth',1)
% title("US06 drive cycles")
% xlabel("Time (s)"); ylabel ("Current (A)")
% legend('OEM Drive Cycle',"Kollmeyer/PyBaMM Drive Cycle")

figure(14); plot(A.t(A.t<5e4)/3600,1-A.Q(A.t<5e4)/5,"-b",'LineWidth',2); hold on;
plot(B.t_GM_DCR_DCR(B.t_GM_DCR_DCR<5e4)/3600,1-B.Q_GM_DCR_DCR(B.t_GM_DCR_DCR<5e4)/5,"-r",'LineWidth',2);
plot(D.t(D.t<5e4)/3600,1-D.Q(D.t<5e4)/5,"--b",'LineWidth',2);
plot(C.t(C.t<5e4)/3600,1-C.Q(C.t<5e4)/5,"--r",'LineWidth',2);
hold on; plot(E.t(E.t<5e4)/3600,1-E.Q(E.t<5e4)/5,"--g",'LineWidth',2);
% hold on; plot(F.t(F.t<5e4)/3600,1-F.Q(F.t<5e4)/5,"-.k",'LineWidth',2);
title("SoC in the first cycle")
xlabel("Time (h)")
legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)',...
    'Kpy P/4 discharge instead of C/4', 'Kpy cell#19')

A.T_P_av=trapz((A.t(A.t<4.7e4)),abs(A.I(A.t<4.7e4)))/3600;
B.T_P_av=trapz(B.t_GM_DCR_DCR(B.t_GM_DCR_DCR<4.7e4),abs(B.I_GM_DCR_DCR(B.t_GM_DCR_DCR<4.7e4)))/3600;
C.T_P_av=trapz(C.t(C.t<4.7e4), abs(C.I(C.t<4.7e4)))/3600;
D.T_P_av=trapz(D.t((D.t<4.7e4)), abs(D.I(D.t<4.7e4)))/3600;
E.T_P_av=trapz(E.t((E.t<4.7e4)), abs(E.I(E.t<4.7e4)))/3600;
F.T_P_av=trapz(F.t((F.t<4.7e4)), abs(F.I(F.t<4.7e4)))/3600;


% figure(15);
%  plot(A.cycle_num*A.T_P_av,A.Cap,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR*B.T_P_av, B.Cap_GM_DCR_DCR,"-r", 'LineWidth',2);
% hold on; plot(D.cycle_num*D.T_P_av, D.Cap,"--b", 'LineWidth',2)
% hold on; plot(C.cycle_num*C.T_P_av, C.Cap, "--r", 'LineWidth',2)
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')
% title("Capacity vs. Charge Trouhput")
% xlabel("Exchanged capacity (Ah)"); ylabel("Capacity (Ah)")



% (A.Cap(end)-A.Cap(1))/double(A.cycle_num(end)-A.cycle_num(1))/A.Cap(1)*100
% (A.Cap(end)-A.Cap(end-1))/double(A.cycle_num(end)-A.cycle_num(end-1))/A.Cap(1)*100
% (B.Cap_GM_DCR_DCR(end)-B.Cap_GM_DCR_DCR(1))/double(B.cycle_num_GM_DCR_DCR(end)-B.cycle_num_GM_DCR_DCR(1))/B.Cap_GM_DCR_DCR(1)*100
% (B.Cap_GM_DCR_DCR(end)-B.Cap_GM_DCR_DCR(end-1))/double(B.cycle_num_GM_DCR_DCR(end)-B.cycle_num_GM_DCR_DCR(end-1))/B.Cap_GM_DCR_DCR(1)*100
% (C.Cap(end)-C.Cap(1))/double(C.cycle_num(end)-C.cycle_num(1))/C.Cap(1)*100
% (C.Cap(end)-C.Cap(end-1))/double(C.cycle_num(end)-C.cycle_num(end-1))/C.Cap(1)*100
% (D.Cap(end)-D.Cap(1))/double(D.cycle_num(end)-D.cycle_num(1))/D.Cap(1)*100
% (D.Cap(end)-D.Cap(end-1))/double(D.cycle_num(end)-D.cycle_num(end-1))/D.Cap(1)*100
% 
% 
% 
% (A.Cap(end)-A.Cap(1))/double(A.cycle_num(end)-A.cycle_num(1))/A.T_P_av/A.Cap(1)*100*1000
% (A.Cap(end)-A.Cap(end-1))/double(A.cycle_num(end)-A.cycle_num(end-1))/A.Cap(1)*100/A.T_P_av*1000
% (B.Cap_GM_DCR_DCR(end)-B.Cap_GM_DCR_DCR(1))/double(B.cycle_num_GM_DCR_DCR(end)-B.cycle_num_GM_DCR_DCR(1))/B.Cap_GM_DCR_DCR(1)*100/B.T_P_av*1000
% (B.Cap_GM_DCR_DCR(end)-B.Cap_GM_DCR_DCR(end-1))/double(B.cycle_num_GM_DCR_DCR(end)-B.cycle_num_GM_DCR_DCR(end-1))/B.Cap_GM_DCR_DCR(1)*100/B.T_P_av*1000
% (C.Cap(end)-C.Cap(1))/double(C.cycle_num(end)-C.cycle_num(1))/C.Cap(1)*100/C.T_P_av*1000
% (C.Cap(end)-C.Cap(end-1))/double(C.cycle_num(end)-C.cycle_num(end-1))/C.Cap(1)*100/C.T_P_av*1000
% (D.Cap(end)-D.Cap(1))/double(D.cycle_num(end)-D.cycle_num(1))/D.Cap(1)*100/D.T_P_av*1000
% (D.Cap(end)-D.Cap(end-1))/double(D.cycle_num(end)-D.cycle_num(end-1))/D.Cap(1)*100/D.T_P_av*1000
% 
% 
% 
% data=A;
% for i=1:length(data.cycle_num)
%     data.R(i)=max(data.ECM_whole_res((data.t<data.cycle_time(i)) ));
% end
%     data.R_unique=data.R(1);
%     data.unique_cycle=data.cycle_num(1);
% for j=1: length(data.R)
%     if data.R(j)~=data.R_unique(end)
% 
%     data.R_unique=[data.R_unique; data.R(j)];
%     data.unique_cycle=[data.unique_cycle; data.cycle_num(j)];
%     end
% end
% 
%% Summary of drive cycles 
KPy_thru=trapz((A.t(A.t<3600)),abs(A.I(A.t<3600)))/3600;
OEM_thru=trapz((C.t(C.t<3600)),abs(C.I(C.t<3600)))/3600;

KPy_chch=trapz((A.t(A.t<3600)),(A.I(A.t<3600)))/3600;
OEM_chch=trapz((C.t(C.t<3600)),(C.I(C.t<3600)))/3600;

diffKPy=diff(A.I(A.t<3600)); Time_KPy=diff(A.t(A.t<3600));
diffOEM=diff(C.I(C.t<3600)); Time_OEM=diff(C.t(C.t<3600));
der_KPy=diffKPy./Time_KPy;
der_OEM=diffOEM./Time_OEM;

%% Down sample 

curr_C=C.I(C.t<3600);
C_odd=curr_C(1,1:2:end);


%% Percentage capacity plot
% figure(16); plot(A.cycle_num,A.Cap/4.86*100,"-b",  'LineWidth',2); hold on;
% plot(B.cycle_num_GM_DCR_DCR, B.Cap_GM_DCR_DCR/4.86*100,"-r", 'LineWidth',2);
% hold on; plot(D.cycle_num, D.Cap/4.86*100,"--b", 'LineWidth',2)
% hold on; plot(C.cycle_num, C.Cap/4.86*100, "--r", 'LineWidth',2)
% legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)')
% title("Capacity", 'FontSize',16); xlabel("Cycle Number"); ylabel("Percentage %")


figure(17);
 plot(A.cycle_num*A.T_P_av,A.Cap/4.86*100,"-b",  'LineWidth',2); hold on;
plot(B.cycle_num_GM_DCR_DCR*B.T_P_av, B.Cap_GM_DCR_DCR/4.86*100,"-r", 'LineWidth',2);
hold on; plot(D.cycle_num*D.T_P_av, D.Cap/4.86*100,"--b", 'LineWidth',2)
hold on; plot(C.cycle_num*C.T_P_av, C.Cap/4.86*100, "--r", 'LineWidth',2)
plot(E.cycle_num*E.T_P_av,E.Cap/4.86*100,"--g",  'LineWidth',2); hold on;
% plot(F.cycle_num*F.T_P_av,F.Cap/4.86*100,"-.k",  'LineWidth',2); hold on;


legend('KPy  DCR-DCR', 'OEM  DCR-DCR', 'KPy  RC-RC (No V2G)', 'OEM  RC-RC (No V2G)',...
    'Kpy P/4 discharge instead of C/4', 'Kpy cell#19')
title("Capacity vs. Charge Trouhput")
xlabel("Exchanged capacity (Ah)"); ylabel("Percentage %")

%% max rest time
%{
curr_A=A.I(A.t<3600);
curr_C=C.I(C.t<3600);


last_max=[]
max_t=0;
for i=1: length(curr_A)
    if abs(curr_A(i))<0.05
        max_t=max_t+1;
    else
        last_max=[last_max; max_t];
        max_t=0;
    end
end
max(last_max)

last_max=[]
max_t=0;
for i=1: length(curr_C)
    if abs(curr_C(i))<0.05
        max_t=max_t+1;
    else
        last_max=[last_max; max_t];
        max_t=0;
    end
end
max(last_max)
%}