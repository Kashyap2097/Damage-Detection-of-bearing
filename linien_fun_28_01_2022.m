%Geometrical Data of the bearing:

n_WK=13; %Number of rolling elements
D_W=3.7; %Diameter of rolling elements in mm
D_T=26.15; %Part circle diameter in mm
alpha_B=0; %Operating contact angle in degree
f_n=50; %Rotational frequency

%LOAD SIGNAL 1:
signal_1='signal1';
load(signal_1);
fs_1=data.fs;
dt=1/fs_1;
D_1=data.datensatz;
time=0:dt:160000*dt;
figure(1);
plot(time,D_1,'g');
xlabel("Time");
ylabel("Signal_1 amplitude");
legend("Signal_1")
title("Signal 1 in time domain");

%finding variance,roomt mean square,mean,kurtosis,peak2rms,peak2peak,quantile of signal 1:
S1.variance=var(data.datensatz);
S1.rootmeansquare=rms(data.datensatz);
S1.mean=mean(data.datensatz);
S1.kurtosis=kurtosis(data.datensatz)-3;
S1.p2r=peak2rms(data.datensatz);
S1.p2p=peak2peak(data.datensatz);
S1.q50=quantile(data.datensatz,[0.5]);
S1.q95=quantile(data.datensatz,[0.9]);


%Cage rotational frequency with fix outer ring:
f_K_outer_1=0.5*f_n*(1-(D_W/D_T)*cos(alpha_B));
%Cage rotational frequency with fix inner ring:
f_K_inner_1=0.5*f_n*(1+(D_W/D_T)*cos(alpha_B));
%Rollover frequency of an irregularity on the outer ring:
f_A_outer_1=0.5*f_n*n_WK*(1-(D_W/D_T)*cos(alpha_B));
%Rollover frequency of an irregularity on the inner ring:
f_A_inner_1=0.5*f_n*n_WK*(1+(D_W/D_T)*cos(alpha_B));
%Rolling element rotation frequency or rolling elment spin frequency:
f_WA_1=0.5*f_n*(D_T/D_W)*(1-(D_W/D_T)*cos(alpha_B)^2);
%Rollover frequency of a rolling element irregularity on both tracks:
f_W_1=2*f_WA_1;


%LOAD SIGNAL2:
signal_2='signal2';
load(signal_2);
D_2=data.datensatz;
fs_2=data.fs;
figure(2);
plot(time,D_2,'r');
xlabel("Time");
ylabel("Signal_2 amplitude");
legend("Signal_2")
title("Signal 2 in time domain");

%finding variance,roomt mean square,mean,kurtosis,peak2rms,peak2peak,quantile of signal 2:
S2.variance=var(data.datensatz);
S2.rootmeansquare=rms(data.datensatz);
S2.mean=mean(data.datensatz);
S2.kurtosis=kurtosis(data.datensatz)-3;
S2.p2r=peak2rms(data.datensatz);
S2.p2p=peak2peak(data.datensatz);
S2.q50=quantile(data.datensatz,[0.5]);
S2.q95=quantile(data.datensatz,[0.9]);

%Cage rotational frequency with fix outer ring:
f_K_outer_2=0.5*f_n*(1-(D_W/D_T)*cos(alpha_B));
%Cage rotational frequency with fix inner ring:
f_K_inner_2=0.5*f_n*(1+(D_W/D_T)*cos(alpha_B));
%Rollover frequency of an irregularity on the outer ring:
f_A_outer_2=0.5*f_n*n_WK*(1-(D_W/D_T)*cos(alpha_B));
%Rollover frequency of an irregularity on the inner ring:
f_A_inner_2=0.5*f_n*n_WK*(1+(D_W/D_T)*cos(alpha_B));
%Rolling element rotation frequency or rolling elment spin frequency:
f_WA_2=0.5*f_n*(D_T/D_W)*(1-(D_W/D_T)*cos(alpha_B)^2);
%Rollover frequency of a rolling element irregularity on both tracks:
f_W_2=2*f_WA_2;


%LOAD signal 3:
signal_3='signal3';
load(signal_3);
D_3=data.datensatz;
fs_3=data.fs;
figure(3);
plot(time,D_3,'b');
xlabel("Time");
ylabel("Signal_3 amplitude");
legend("Signal_3")
title("Signal 3 in time domain");

%finding variance,roomt mean square,mean,kurtosis,peak2rms,peak2peak,quantile of signal 3:
S3.variance=var(data.datensatz);
S3.rootmeansquare=rms(data.datensatz);
S3.mean=mean(data.datensatz);
S3.kurtosis=kurtosis(data.datensatz)-3;
S3.p2r=peak2rms(data.datensatz);
S3.p2p=peak2peak(data.datensatz);
S3.q50=quantile(data.datensatz,[0.5]);
S3.q95=quantile(data.datensatz,[0.9]);

%Cage rotational frequency with fix outer ring:
f_K_outer_3=0.5*f_n*(1-(D_W/D_T)*cos(alpha_B));
%Cage rotational frequency with fix inner ring:
f_K_inner_3=0.5*f_n*(1+(D_W/D_T)*cos(alpha_B));
%Rollover frequency of an irregularity on the outer ring:
f_A_outer_3=0.5*f_n*n_WK*(1-(D_W/D_T)*cos(alpha_B));
%Rollover frequency of an irregularity on the inner ring:
f_A_inner_3=0.5*f_n*n_WK*(1+(D_W/D_T)*cos(alpha_B));
%Rolling element rotation frequency or rolling elment spin frequency:
f_WA_3=0.5*f_n*(D_T/D_W)*(1-(D_W/D_T)*cos(alpha_B)^2);
%Rollover frequency of a rolling element irregularity on both tracks:
f_W_3=2*f_WA_3;



%FIGURE TO PLOT PDF:
figure(4);
nclasses=10000;
[pf_D1,X_D1]=ksdensity(D_1,'npoints',nclasses);
plot(X_D1,pf_D1,'-g','LineWidth',1);
title("Pdf of signal 1,signal 2,signal 3");
ylabel("Probability");
xlabel("Datapoints of signal");
hold on;
[pf_D2,X_D2]=ksdensity(D_2,'npoints',nclasses);
plot(X_D2,pf_D2,'-r','LineWidth',1);
hold on;
[pf_D3,X_D3]=ksdensity(D_3,'npoints',nclasses);
plot(X_D3,pf_D3,'-b','LineWidth',1);
legend("Signal_1","Signal_2","Signal_3");
hold off;

%FIGURE TO PLOT cdf:
figure(5);
cdf_1=cdfplot(D_1);
set(cdf_1,'Color','g');
hold on;
cdf_2=cdfplot(D_2);
set(cdf_2,'Color','r');
hold on;
cdf_3=cdfplot(D_3);
set(cdf_3,'Color','b');
legend("Signal_1","Signal_2","Signal_3");
hold off;

%FREQUENCY DOMAIN:
%FOR SIGNAL 1:
m=length(D_1);
fft_1=fft(D_1,m)*(2/m);
abs_1=abs(fft_1);
freq_1=0:(1/time(end)):fs_1/2-(1/time(end));
figure(6);
xlim([0 3000]);
ylim([0 2]);
plot(freq_1,abs_1(1:length(freq_1)),'g');

%t_f_1=fft(D_1);
%m_1=length(t_f_1);
%freq_1=(-m_1/2:(m_1/2-1))*fs_1/(m_1-1);
%plot(freq_1,fftshift(abs(t_f_1)),'g');

xlabel("Frequency of sample");
ylabel("Amplitude of spectrum");
legend("Signal_1")
title("Signal 1 in frequency domain");

%FOR SIGNAL 2:
m=length(D_2);
fft_2=fft(D_2,m)*(2/m);
abs_2=abs(fft_2);
freq_2=0:(1/time(end)):fs_2/2-(1/time(end));
figure(7);
plot(freq_2,abs_2(1:length(freq_2)),'r');

%t_f_2=fft(D_2);
%m_2=length(t_f_2);
%freq_2=(-m_2/2:(m_2/2-1))*fs_1/(m_2-1);
%plot(freq_2,fftshift(abs(t_f_2)),'r');

xlabel("Frequency of sample");
ylabel("Amplitude of spectrum");
legend("Signal_2")
title("Signal 2 in frequency domain");

%FOR SIGNAL 3:
m=length(D_3);
fft_3=fft(D_3,m)*(2/m);
abs_3=abs(fft_3);
freq_3=0:(1/time(end)):fs_3/2-(1/time(end));
figure(8);
plot(freq_3,abs_3(1:length(freq_3)),'b');

%t_f_3=fft(D_3);
%m_3=length(t_f_3);
%freq_3=(-m_3/2:(m_3/2-1))*fs_1/(m_3-1);
%plot(freq_3,fftshift(abs(t_f_3)),'b');

xlabel("Frequency of sample");
ylabel("Amplitude of spectrum");
legend("Signal_3")
title("Signal 3 in frequency domain");


%PSD PLOT
%For Signal 1:
nfft_1=2^nextpow2(length(D_1));
Pxx_1=abs(fft(D_1,nfft_1)).^2/length(D_1)/fs_1;
Hpsd_1=dspdata.psd(Pxx_1(1:length(Pxx_1)/2),'Fs',fs_1);
figure(9);
plot(Hpsd_1);


%For Signal 2:
nfft_2=2^nextpow2(length(D_2));
Pxx_2=abs(fft(D_2,nfft_2)).^2/length(D_2)/fs_2;
Hpsd_2=dspdata.psd(Pxx_2(1:length(Pxx_2)/2),'Fs',fs_2);
figure(10);
plot(Hpsd_2);


%For Signal 3:
nfft_3=2^nextpow2(length(D_3));
Pxx_3=abs(fft(D_3,nfft_3)).^2/length(D_3)/fs_3;
Hpsd_3=dspdata.psd(Pxx_3(1:length(Pxx_3)/2),'Fs',fs_3);
figure(11);
plot(Hpsd_3);

%POWERSPECTRUM:
%For Signal_1:
time_1=(0:dt:160000*dt)';
OriginalSignal_1=timetable(seconds(time_1),D_1);
figure(12);
pspectrum(OriginalSignal_1);

%For Signal_2:
OriginalSignal_2=timetable(seconds(time_1),D_2);
figure(13);
pspectrum(OriginalSignal_2);

%For Signal_3:
OriginalSignal_3=timetable(seconds(time_1),D_3);
figure(14);
pspectrum(OriginalSignal_3);


%Envelope Spectrum
%For Signal1:
%for plotting F_K_outer:
[es_1,F_1]=envspectrum(D_1,fs_1);
figure(15);
plot(F_1,es_1);
xlim([0 86]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_1 vs F_K_outer ");
hold on
num_harmonics_1=4;
nx_fko_1= f_K_outer_1*(1:1:num_harmonics_1);
plot(repmat(nx_fko_1,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_K_inner:
figure(16);
plot(F_1,es_1);
xlim([0 110]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_1 vs F_K_inner");
hold on
num_harmonics_1=4;
nx_fki_1= f_K_inner_1*(1:1:num_harmonics_1);
plot(repmat(nx_fki_1,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_A_outer:
figure(17);
plot(F_1,es_1);
xlim([0 1100]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_1 vs F_A_outer");
hold on
num_harmonics_1=4;
nx_fao_1= f_A_outer_1*(1:1:num_harmonics_1);
plot(repmat(nx_fao_1,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_A_inner:
figure(18);
plot(F_1,es_1);
xlim([0 1100]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_1 vs F_A_inner");
hold on
num_harmonics_1=4;
nx_fai_1= f_A_inner_1*(1:1:num_harmonics_1);
plot(repmat(nx_fai_1,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_WA:
figure(19);
plot(F_1,es_1);
xlim([0 610]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_1 vs F_WA");
hold on
num_harmonics_1=4;
nx_fwa_1= f_WA_1*(1:1:num_harmonics_1);
plot(repmat(nx_fwa_1,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_W:
figure(20);
plot(F_1,es_1);
xlim([0 1200]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_1 vs F_W");
hold on
num_harmonics_1=4;
nx_fw_1= f_W_1*(1:1:num_harmonics_1);
plot(repmat(nx_fw_1,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%For Signal2:
%for plotting F_K_outer:
[es_2,F_2]=envspectrum(D_2,fs_2);
figure(21);
plot(F_2,es_2);
xlim([0 90]);
ylim([0 0.3]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_2 vs F_K_outer");
hold on
num_harmonics_1=4;
nx_fko_2= f_K_outer_2*(1:1:num_harmonics_1);
plot(repmat(nx_fko_2,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_K_inner:
figure(22);
plot(F_2,es_2);
xlim([0 120]);
ylim([0 0.3]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_2 vs F_K_inner");
hold on
num_harmonics_1=4;
nx_fki_2= f_K_inner_2*(1:1:num_harmonics_1);
plot(repmat(nx_fki_2,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_A_outer:
figure(23);
plot(F_2,es_2);
xlim([0 1100]);
ylim([0 0.3]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_2 vs F_A_outer");
hold on
num_harmonics_1=4;
nx_fao_2= f_A_outer_2*(1:1:num_harmonics_1);
plot(repmat(nx_fao_2,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_A_inner:
figure(24);
plot(F_2,es_2);
xlim([0 1125]);
ylim([0 0.3]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_2 vs F_A_inner");
hold on
num_harmonics_1=4;
nx_fai_2= f_A_inner_2*(1:1:num_harmonics_1);
plot(repmat(nx_fai_2,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_WA:
figure(25);
plot(F_2,es_2);
xlim([0 620]);
ylim([0 0.3]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_2 vs F_WA");
hold on
num_harmonics_1=4;
nx_fwa_2= f_WA_2*(1:1:num_harmonics_1);
plot(repmat(nx_fwa_2,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_W:
figure(26);
plot(F_2,es_2);
xlim([0 1000]);
ylim([0 0.3]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_2 vs F_W");
hold on
num_harmonics_1=4;
nx_fw_2= f_W_2*(1:1:num_harmonics_1);
plot(repmat(nx_fw_2,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%For Signal 3:
[es_3,F_3]=envspectrum(D_3,fs_3);
figure(27);
plot(F_3,es_3);
xlim([0 85]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_3 vs F_K_outer ");
hold on
num_harmonics_1=4;
nx_fko_3= f_K_outer_3*(1:1:num_harmonics_1);
plot(repmat(nx_fko_3,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_K_inner:
figure(28);
plot(F_3,es_3);
xlim([0 120]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_3 vs F_K_inner");
hold on
num_harmonics_1=4;
nx_fki_3= f_K_inner_3*(1:1:num_harmonics_1);
plot(repmat(nx_fki_3,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_A_outer:
figure(29);
plot(F_3,es_3);
xlim([0 500]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_3 vs F_A_outer");
hold on
num_harmonics_1=4;
nx_fao_3= f_A_outer_3*(1:1:num_harmonics_1);
plot(repmat(nx_fao_3,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_A_inner:
figure(30);
plot(F_3,es_3);
xlim([0 500]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_3 vs F_A_inner");
hold on
num_harmonics_1=4;
nx_fai_3= f_A_inner_3*(1:1:num_harmonics_1);
plot(repmat(nx_fai_3,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_WA:
figure(31);
plot(F_3,es_3);
xlim([0 500]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_3 vs F_WA");
hold on
num_harmonics_1=4;
nx_fwa_3= f_WA_3*(1:1:num_harmonics_1);
plot(repmat(nx_fwa_3,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

%for plotting F_W:
figure(32);
plot(F_3,es_3);
xlim([0 500]);
ylim([0 0.1]);
xlabel("Frequency[KHz]");
ylabel("Peak Amplitude");
title("Envelope Spectrum of Signal_3 vs F_W");
hold on
num_harmonics_1=4;
nx_fw_3= f_W_3*(1:1:num_harmonics_1);
plot(repmat(nx_fw_3,2,1),ylim,'LineWidth',1,'Color',[0.5 0 0]);

