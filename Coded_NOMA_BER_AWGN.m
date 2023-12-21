clc; clear variables; close all;
N = 10^6;               %Number of monte carlo simulations
SNR = 0:20;         %SNR range in dB
snr = db2pow(SNR);
%Generate random data bits for transmission
x1 = randi([0 1],1,N);  %Data bits of user 1
x2 = randi([0 1],1,N);  %Data bits of user 2
x3 = randi([0 1],1,N);
x11=encoder1(x1);
x22=encoder2(x2,x3);
x33=encoder3(x3,x2);
Eb=1;
%Do BPSK modulation of data
xmod1 = 2*x11 - 1;
xmod2 = 2*x22 - 1;
xmod3 = 2*x33 - 1;
%Set power weights for users
a1 = 0.6; a2 = 0.3; a3=1-a2-a1;  %if 1-a1-a2=0 this is typical 2 users.
%Do superposition coding
x = sqrt(a1)*xmod1 + sqrt(a2)*xmod2 + sqrt(a3)*xmod3;
% x=([sqrt(a1) sqrt(a2) sqrt(a3)]*[xmod1; xmod2; xmod3]);
ber1 = zeros(1,length(SNR));
ber2 = zeros(1,length(SNR));
ber3 = zeros(1,length(SNR));
ber11 = zeros(1,length(SNR));
ber22 = zeros(1,length(SNR));
ber33 = zeros(1,length(SNR));
R=1/4;
for u = 1:length(SNR)
    sigma=sqrt((1/(2*R*snr(u))));
    n1=sigma*(randn(1,4*N));
    n2=sigma*(randn(1,4*N));
    n3=sigma*(randn(1,4*N));
    y1=x+n1;
    y2=x+n2;
    y3=x+n3;
    x1_hat=decoded1(y1,N);
    x2_hat=decoded2(y2,N);
    x3_hat=decoded3(y3,N);
    ber1(u) = biterr(x1,x1_hat)/N;
    ber2(u) = biterr(x2,x2_hat)/N;
    ber3(u) = biterr(x3,x3_hat)/N;
    A=sqrt(a2)+sqrt(a3);
    ber11(u) =qfunc(sqrt(8*snr(u)*R*(a1)));
    ber22(u) =qfunc(sqrt(4*snr(u)*R*A^2));
    ber33(u) =qfunc(sqrt(4*snr(u)*R*A^2));
end
semilogy(SNR, ber1,'b-','linewidth', 2); hold on;
semilogy(SNR, ber11,'ob','linewidth', 2);
semilogy(SNR, ber2,'r-','linewidth', 2); 
semilogy(SNR, ber22,'or','linewidth', 2);
semilogy(SNR, ber3,'k-','linewidth', 2);
semilogy(SNR, ber33,'ok','linewidth', 2); grid on;
legend('a_1 = 0.8 Simulation','a_1 = 0.8 Theoretical','a_2 = 0.15 Simulation','a_2 = 0.15 Theoretical','a_3 = 0.05 Simulation','a_3 = 0.05 Theoretical');
axis([0 max(SNR) 1e-6 1])
xlabel('SNR =Eb/N0(dB)');
ylabel('BER');

