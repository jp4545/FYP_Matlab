clear
source_dir = uigetdir([]); 
d = dir([source_dir, '/*.csv']);
n=length(d(not([d.isdir])));
sinr_arr = []
no = 2
for i = 1:n
    distt = [];
    str1 = i;
    str2 = ".csv";
    str = str1+str2;
    datatable = readtable(str, 'ReadVariableNames', false);
    numRows = height(datatable);
    nn = numRows - 1
    disp(numRows)
    %aaa = csvread(str,0,0,[0,0,0,2])
    str3 = "dist.csv";
    strr = str1+str3;
    wban = check_wban(str,nn,0,strr,str1);
    disp("hello")
   %plot_function(str1);
end
function wban1 = check_wban(str,nn,i,strr,str1)
      if i < nn
        for k = i:nn
            values = csvread(str,k,0,[k,0,k,2]);
            disp(values)
            if values(1) > 0
                if values(2) > 30
                    if values(3) > -70
                        d = -11.8-values(3)/10*2;
                        d1 = 10*d;
                        dlmwrite(strr,d1,'delimiter',',','-append');
                        sinr_val = -11.8*d/((d*-11.8)+2)
                        str_sinr = "sinr.csv";
                        str_sinr1 = str1+str_sinr;
                        dlmwrite(str_sinr1,sinr_val,'delimiter',',','-append');
                    else
                        check_wban(str,nn,k+1,strr,str1);
                    end
                else
                    check_wban(str,nn,k+1,strr,str1);
                end
            else
                 check_wban(str,nn,k+1,strr,str1);
            end
        end
    end
    wban1 = 0
end
% function p = plot_function(str1)
%     dist("hii")
%     str_dist = "dist.csv";
%     strr_dist = str1+str_dist;
%     str_sinr = "sinr.csv";
%     strr_sinr = str1+str_sinr;
%     x = csvread(str_dist);
%     y = csvread(str_sinr);
%     plot(x,y); 
%     p = 0
% end
            