insert into radcheck(UserName, Attribute, Value, Op) values
  ('fredf','Cleartext-Password','wilma',':='),
  ('barney','Cleartext-Password','betty',':='),
  ('dialrouter','Cleartext-Password','dialup',':=');

insert into radreply (UserName, Attribute, Value, Op) values
  ('barney','Framed-IP-Address','1.2.3.4',':='),
  ('dialrouter','Framed-IP-Address','2.3.4.1',':='),
  ('dialrouter','Framed-IP-Netmask','255.255.255.255',':='),
  ('dialrouter','Framed-Routing','Broadcast-Listen',':='),
  ('dialrouter','Framed-Route','2.3.4.0 255.255.255.248',':='),
  ('dialrouter','Idle-Timeout','900',':=');

insert into radgroupreply (GroupName, Attribute, Value, Op) values
  ('dynamic','Framed-Compression','Van-Jacobsen-TCP-IP',':='),
  ('dynamic','Framed-Protocol','PPP',':='),
  ('dynamic','Service-Type','Framed-User',':='),
  ('dynamic','Framed-MTU','1500',':='),
  ('static','Framed-Protocol','PPP',':='),
  ('static','Service-Type','Framed-User',':='),
  ('static','Framed-Compression','Van-Jacobsen-TCP-IP',':='),
  ('netdial','Service-Type','Framed-User',':='),
  ('netdial','Framed-Protocol','PPP',':=');
