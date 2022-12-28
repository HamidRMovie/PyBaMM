%DFN 
load('F:\Git Hub rep\PyBaMM\gmproj\misc\DFN_Cell01_halfcycle_1_5C.mat')
% x=0:1/19:1;
% for i=[2,12,21,31,41,51]
%     figure(1); hold on;
% plot(x,c_n_e(:,i))
% end
C_r_ave=sum(C_r)/20;
plot(t, C_r_ave)
C_x_ave=sum(C_x)/20;
hold on; plot(t, C_x_ave)