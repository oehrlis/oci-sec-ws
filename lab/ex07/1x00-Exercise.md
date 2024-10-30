---
title: "WAF"
permalink: /lab/sz-waf/
excerpt: "Web Application Firewall"
---
<!-- markdownlint-disable MD024 -->
<!-- markdownlint-disable MD025 -->
<!-- markdownlint-disable MD033 -->
<!-- markdownlint-disable MD041 -->

# Web Application Firewall (WAF)

## Environments {.unlisted .unnumbered}

If not explicitly stated, the exercises are usually performed on the following
environment:

- **Compartment:** OCI-SEC-WS-LAB-nn
- **Region:** Germany Central (Frankfurt)
- **OCI Console URL:**
  <a href="https://console.eu-frankfurt-1.oraclecloud.com" target="_blank" rel="noopener">
  OCI Console Frankfurt - Login</a>

Verify in OCI console you selected the correct region and for Security Zone you are
in your compartment. New resources like recipes, object storage buckets etc.,
are always created on your compartment.


## Exercise 07 - Setup WAF for XSS Detection

### Exercise Goals {.unlisted .unnumbered}

We install a Load Balancer and WAF do detect XSS.

### Tasks {.unlisted .unnumbered}

- Setup Cloud Shell for private Network
- Install http Server on Compute Instances
- Setup Public Load Balancer
- Setup Web Application Firewall

## Solution

Login as User XYZ in OCI console. Ensure you have select the proper compartment in from the
dropdown list on left side.

### Setup Cloud Shell for private Network

In _Compute_ -> _Instances_, note down the two private IP adresses of the compute instances. As example 10.0.0.75 and 10.0.0.76.

![>> step_1](../../images/screenshot-loadbalancer-setup_1.jpg)

On top of OCI Console, verify region is Germany Central (Frankfurt), open a Cloud Shell.

![>> step_2](../../images/screenshot-loadbalancer-setup_2.jpg)

When prompted for network, use private network.

![>> step 3](../../images/screenshot-loadbalancer-setup_3.jpg)

Create a new private network definition:
- Name: set a name according your compartment, as example cloud-shell-private-network-definition
- VCN: set VCN from your compartment
- Subent: use subnet which contains the term _lab_, as example 
- Checkbox: enable _Use as active network_

Click on _Create_.

![>> step_4](../../images/screenshot-loadbalancer-setup_4.jpg)

Close the private netzwork definition list and be patient, your Cloud Shell is connected to the network. You can verify on top of the
Cloud Shell when connected properly.

![>> step_5](../../images/screenshot-loadbalancer-setup_5.jpg)

In Cloud Shell, create a new direcory and download Private SSH Key.

```
mkdir ssh
cd ssh
wget <URL provided by trainer>
ln -s <filename> id_rsa
chmod 600 id_rsa
```

### Install http Server on Compute Instances

Login in first compute instance webserver as user opc. Use the private key from above to connect.

```
--login as user opc
ssh opc@10.0.0.75
```

 ```
--http / php package installation
$ sudo dnf install httpd php -y
--start apache and php module
$ sudo apachectl start
$ sudo systemctl start php-fpm
--enable for server restart
$ sudo systemctl enable httpd
$ sudo systemctl enable php-fpm
--verify apache is running on port 80
$ sudo netstat -tulnp | grep http
--enable firewall
$ sudo firewall-cmd --permanent --zone=public --add-service=http
$ sudo firewall-cmd --reload
```

Create HTML Index Page and XSS PHP Page in /var/www/html

```
--create index.php file
$ sudo vi /var/www/html/index.php

<?php
echo "OCI Hostname: " . gethostname();
?>
```

```
--create xss demo file
$ sudo vi /var/www/html/xss_demo.php

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <title>XSS Demo</title>
</head>
<body>
   <h1>XSS Demo Page</h1>
   <form action="" method="get">
       <label for="name">Enter your name:</label>
       <input type="text" id="name" name="name">
       <input type="submit" value="Submit">
   </form> 
   <?php
   if (isset($_GET['name'])) {
       $name = $_GET['name'];
       // This directly outputs user input without sanitization, making it vulnerable to XSS
       echo "<p>Hello, $name</p>";
   }
   ?>
</body>
</html>
```
Test runing webserver. This command returns the hostname.
```
curl http://localhost
```

Repeat the steps for second webserver.


### Setup Public Load Balancer

Create a Public Load Balancer in Public Subnet with the two webservers as backend, attention: health check must set to http (as https as per default). 
Verify that backend checks run to green (ok) after a while.

_Networking_ -> _Load Balancer_ -> _Create Load Balancer_

![>> step_6](../../images/screenshot-loadbalancer-setup_6.jpg)

Add details:
- set name
- let visibility type as PUBLIC

![>> step_7](../../images/screenshot-loadbalancer-setup_7.jpg)

Scroll down and set:
- Virtual Cloud network
- Your public subnet

![>> step_8](../../images/screenshot-loadbalancer-setup_8.jpg)

_Next_.

Choose backends: 
- select backend servers and add ylouzr compute instances

Select your two webserver and add them to the list. Let port as is. Do ot change other settings.

![>> step_9](../../images/screenshot-loadbalancer-setup_9.jpg)

_Next_.

Configure listtener:
- Change type of traffic to HTTP. Do not change other settings.

![>> step_10](../../images/screenshot-loadbalancer-setup_10.jpg)

_Next_.

Manage Logging:
- Do not change settings.

![>> step_11](../../images/screenshot-loadbalancer-setup_11.jpg)

_Next_.

Review and create:
- verify settings
![>> step_12](../../images/screenshot-loadbalancer-setup_12.jpg)


_Submit_.

The load balancer is created, wait until completed. Now you can see the load balancer public IP in overview in
section Load balancer information. The overall health changes to ok.

![>> step_13](../../images/screenshot-loadbalancer-setup_13.jpg)

Verify reachability in a new web browser window - URL: http://<your public load balancer ip>. Whenever the browser is refreshed, the webserver changes
from webserver01 to webserver02 and vice versa.

![>> step_14](../../images/screenshot-loadbalancer-setup_14.jpg)

Same when using xss_demo.php as target URL: http://<your public load balancer ip>/xss_demo-php.

![>> step_15](../../images/screenshot-loadbalancer-setup_15.jpg)