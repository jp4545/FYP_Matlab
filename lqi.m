str = "time.csv"
a = 1
b = 0
time = 0.005
for i = 1:2416    
    dlmwrite(str,time,'delimiter',',','-append');
    time = time + 0.005;    
end
