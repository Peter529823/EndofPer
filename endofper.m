function [y,ind]=endofper(dates,per)
%picks out the last day of each period from the list of dates
%   period either 'm' (month) or 'y' (year)
%   dates in format 'yyyymmdd' 
%   assume last date is end of period

if strcmp(per,'m')
    eopdays=unique(floor(dates/100)*100);
elseif strcmp(per,'y')
    eopdays=unique(floor(dates/10000)*10000);
end
T=numel(eopdays);
ind=zeros(T-1,1);
for t=1:T-1
    ind(t)=find(dates<=eopdays(t+1),1,'last');
end

try
    ind=[ind,numel(dates)];
catch
   ind=[ind;numel(dates)]; 
end

y=dates(ind);

end

R=diff(SP)