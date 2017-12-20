wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
apt-get update && sudo apt-get install metricbeat
update-rc.d metricbeat defaults 95 10