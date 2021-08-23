#!/bin/bash
sudo sed -i "s/denied/granted/g" /etc/apache2/sites-available/000-default.conf
sudo systemctl restart apache2
