CREATE USER 'faqdev_dev_env_admin'@'%' IDENTIFIED BY 'OEhAlrwokUbTNGB2';

GRANT ALL PRIVILEGES ON *.* TO 'faqdev_dev_env_admin'@'%' IDENTIFIED BY 'OEhAlrwokUbTNGB2' WITH GRANT OPTION;

FLUSH PRIVILEGES;
