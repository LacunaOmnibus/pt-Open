alter table ships add column combat int default 0;
update ships set combat=2000 where type='snark';
update ships set combat=200 where type='scanner';
update ships set combat=2500 where type='observatory_seeker';
update ships set combat=3500 where type='security_ministry_seeker';
update ships set combat=3000 where type='spaceport_seeker';
update ships set combat=6000 where type='drone';
update ships set combat=4000 where type='fighter';
update ships set combat=500 where type='scow';
update ships set speed=2000 where type='fighter' and speed < 2000;
