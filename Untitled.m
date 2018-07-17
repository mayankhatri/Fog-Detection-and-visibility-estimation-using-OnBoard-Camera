
csvwrite('Output.csv',1);
s="feature";
labels=[];
for m = 1:16129
    labels=[labels,strcat(s, num2str(m))];
end
fid = fopen('Output.csv','wt');
if fid>0
     for k=1:16129
         fprintf(fid,'%s,%f\n',labels(k));
     end
     fclose(fid);
end