function [pks_eod,locs_eod,pks_ttl,locs_ttl]=eod_ttl_data_v2(eod,time,ttl)




%[pks_eod,locs_eod]=findpeaks(-eod,'MINPEAKHEIGHT',.4,'MINPEAKDISTANCE',150);
[pks_ttl,locs_ttl]=findpeaks(ttl,'MINPEAKHEIGHT',.4,'MINPEAKDISTANCE',220);
[pks_eod,locs_eod]=findpeaks(eod,'MINPEAKHEIGHT',.4,'MINPEAKDISTANCE',150);

end 