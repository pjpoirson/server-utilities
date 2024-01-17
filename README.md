## DEBIAN MEMO

## *System*

 - **Disk Usage**

	`du -hs /home/*`
	`df -h`

 - **RAM monitoring**

	https://github.com/BitOne/php-meminfo
	
 - **Search a string in multiple files**

	`find . -name "*.log" | xargs grep -nRi "root"`
	
 - **Delete shell history line**

	`history | tail -n 10`
	`history -d xxx`

 - **System installation date**

	`ls -lct /etc | tail -1 | awk '{print $6, $7, $8}'`

	`lsb_release -a`
	`tail -f -n 100 /var/log/nginx/error.log`
 
 - **Recursively chmod only files**

	`find . -type f -exec chmod 644 {} \;`
	
 - **List TCP ports that are being listened on, and the name of each listener’s daemon and its PID**

	`netstat -plnt`

## *Php*

	service php7.4-fpm restart
	service php7.4-fpm status

## *mysql*

	systemctl restart mariadb
	
	mysql -e "show variables like 'pid_file'"
	+---------------+------------------------+
	| Variable_name | Value                  |
	+---------------+------------------------+
	| pid_file      | /run/mysqld/mysqld.pid |
	+---------------+------------------------+
	
	mysql -e "show variables like 'log_error'"
	+---------------+--------------------------+
	| Variable_name | Value                    |
	+---------------+--------------------------+
	| log_error     | /var/log/mysql/error.log |
	+---------------+--------------------------+
	
	mysql -e "show variables like 'max_allowed_packet'"
	+--------------------+----------+
	| Variable_name      | Value    |
	+--------------------+----------+
	| max_allowed_packet | 67108864 |
	+--------------------+----------+

 - **Certbot challenges**

	`certbot certonly --standalone -d my-domain.com`
	`certbot certonly --manual --preferred-challenges dns -d my-domain.com`
	`certbot certonly --manual --expand --preferred-challenges dns -d my-domain.com`
	`certbot certonly --webroot --webroot-path /home/prodUD/www/ -d my-domain.com`
	`certbot-auto certonly --manual --manual-public-ip-logging-ok --manual-auth-hook "/etc/letsencrypt/lexicon-ovh.sh create" --manual-cleanup-hook "/etc/letsencrypt/lexicon-ovh.sh delete" --preferred-challenges dns -d my-domain.com`

## Vi
 - **Search replace**

	`:g/str_Search/s//str_Replace/g`

## Email
 - **list email**
	
	`mailq`

 - **delete all emails**
	
	`postsuper -d ALL`
	`postqueue -f`
	
 - **find an email with complex ID**

	`cat /var/log/mail.log.1 | grep "IrKhhvilgRYJyI8JbSbAyn8PAftverkXSbla8YRM@luxeol.com"
	Feb 20 10:05:37 s02 postfix/cleanup[14016]: 4CCDE197F: message-id=<IrKhhvilgRYJyI8JbSbAyn8PAftverkXSbla8YRM@luxeol.com>`
 
 - **read an email by ID**

	`postcat -q F10EB4254`


