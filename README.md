# wp_brute_force_blocker
A simple bash script that can be used as a cron to null route brute force attacks against your wordpress login page

1. clone the repo into /usr/local/bin
2.create a cronjob to run every 5 minutes
  * `*/5 * * * * /usr/local/bin/wpblocker.sh`

to validate it is working you can check your system messages file you'll see an entry like
`May  4 09:31:43 myserver.local root: Adding Null Route for 139.195.56.31`