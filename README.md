# terraform command

    - tf init
    - tf plan
    - tf aply
    - tf destroy

# key generate command

    - ssh-keygen -f mykey

# wordpress command

    - ssh -i mykey ec2-user@<public ip>

    - sudo yum update -y

### Appach

    - sudo yum -y install httpd
    - sudo systemctl start httpd.service

    - sudo systemctl status httpd.service
    - ps -axu | grep httpd

    - sudo systemctl enable httpd.service
    - sudo systemctl is-enabled httpd.service

### mysql

    - sudo yum -y install mysql
    - mysql -h <aws rds end point> -u root -p
    - CREATE DATABASE tf_aws DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
    - show databases;
    - CREATE USER 'tf_aws'@'%' IDENTIFIED BY 'password';
    - GRANT ALL ON tf_aws.* TO 'tf_aws'@'%';
    - FLUSH PRIVILEGES;
    - SELECT user , host FROM mysql.user;
    - exit;

### wordpress

    - sudo amazon-linux-extras install -y php7.2
    - sudo yum install -y php php-mbstring
    - cd ~
    - wget https://ja.wordpress.org/latest-ja.tar.gz
    - ls
    - tar xzvf latest-ja.tar.gz
    - cd wordpress
    - sudo cp -r * /var/www/html/
    - sudo chown apache:apache /var/www/html/ -R
    - sudo systemctl status httpd.service
    - sudo systemctl restart httpd.service
