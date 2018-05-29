insert into radcheck(Created, Modified, UserName, Attribute, Value, Op, is_active) values
  ('now', 'now', 'fredf','Cleartext-Password','wilma',':=', true),
  ('now', 'now', 'barney','Cleartext-Password','betty',':=', true),
  ('now', 'now', 'dialrouter','Cleartext-Password','dialup',':=', true);

insert into radreply (Created, Modified, UserName, Attribute, Value, Op) values
  ('now', 'now', 'barney','Framed-IP-Address','1.2.3.4',':='),
  ('now', 'now', 'dialrouter','Framed-IP-Address','2.3.4.1',':='),
  ('now', 'now', 'dialrouter','Framed-IP-Netmask','255.255.255.255',':='),
  ('now', 'now', 'dialrouter','Framed-Routing','Broadcast-Listen',':='),
  ('now', 'now', 'dialrouter','Framed-Route','2.3.4.0 255.255.255.248',':='),
  ('now', 'now', 'dialrouter','Idle-Timeout','900',':=');

insert into radgroupreply (Created, Modified, GroupName, Attribute, Value, Op) values
  ('now', 'now', 'dynamic','Framed-Compression','Van-Jacobsen-TCP-IP',':='),
  ('now', 'now', 'dynamic','Framed-Protocol','PPP',':='),
  ('now', 'now', 'dynamic','Service-Type','Framed-User',':='),
  ('now', 'now', 'dynamic','Framed-MTU','1500',':='),
  ('now', 'now', 'static','Framed-Protocol','PPP',':='),
  ('now', 'now', 'static','Service-Type','Framed-User',':='),
  ('now', 'now', 'static','Framed-Compression','Van-Jacobsen-TCP-IP',':='),
  ('now', 'now', 'netdial','Service-Type','Framed-User',':='),
  ('now', 'now', 'netdial','Framed-Protocol','PPP',':=');
