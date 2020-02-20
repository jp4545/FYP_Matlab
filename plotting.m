x = csvread('1.csv');
y = csvread('1sinr.csv');
z = csvread('1dist.csv');
t = csvread('time.csv');
x_lqi = x(:,2);
x_rssi = x(:,3);
y_sinr = y(:,1);
z_dist = z(:,1);
t_time = t(:,1);
figure(1)
plot(t_time,x_lqi)
xlabel('Time in seconds')
ylabel('LQI in dbm')
figure(2)
plot(t_time,x_rssi)
xlabel('Time in seconds')
ylabel('RSSI in dbm')
figure(3)
plot(y_sinr,z_dist)
xlabel('SINR in dbm')
ylabel('Distance in m')
