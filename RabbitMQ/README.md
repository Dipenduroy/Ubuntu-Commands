# Learn RabbitMQ
Useful Configuration for RabbitMQ

Setup Worker Daemon service on server startup
-------------------------------------------------

Reference: https://blog.frd.mn/how-to-set-up-proper-startstop-services-ubuntu-debian-mac-windows/

Configure below parameters in attached worker-daemon startup script.

PHP path in APPBIN variable.

Domain Name, Worker Script Path and num of workers parameter in APPARGS

If needed change user or group to run the service . Default: www-data

Increase File open limit in Ubuntu :
-------------------------------------------------
Add below code to add 2000 file open limit in /etc/security/limits.conf

```
* - nofile 2000
```

Logout and Login to take effect.

Setup Default File Descriptors limit for RabbitMQ
-------------------------------------------------
Setup rabbitmq-env.conf on system specifically path

Add below code : 

For Development : 4096

For Production : at least 65536 file descriptors for user rabbitmq

```
# I am a complete /etc/rabbitmq/rabbitmq-env.conf file.
# Comment lines start with a hash character.
# This is a /bin/sh script file - use ordinary envt var syntax
ulimit -S -n 4096
NODENAME=Nodename
```

Add Rabbitmq Config File in /etc/rabbitmq/rabbitmq.config
-------------------------------------------------
Below Code suggests :

disk_free_limit : Min 30 GB Disk Space needed, it will alert warning if not available

vm_memory_high_watermark : 0.4 assigns 40% of RAM Available to rabbitmq

vm_memory_high_watermark_paging_ratio, 0.75 : The configuration starts paging at 30% of memory used, and blocks publishers at 40%.

```
[
 {rabbit, [
  {tcp_listeners, [5672]},
  {disk_free_limit, "30GB"},
  {vm_memory_high_watermark_paging_ratio, 0.75},
  {vm_memory_high_watermark, 0.4} 
 ] 
 }
].
```

Setup all rabbitmq messages ttl for all queues in milli seconds.
-------------------------------------------------
40000 implies 40 secs

```
sudo rabbitmqctl set_policy TTL ".*" '{"message-ttl":40000}' --apply-to queues
```

Setup Memory usage of rabbitmq : 0.5 depicts 50% of RAM available
-------------------------------------------------
Command:

```
sudo rabbitmqctl set_vm_memory_high_watermark 0.5
```

