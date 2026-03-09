# 1. Update packages
sudo apt update && sudo apt upgrade -y

# 2. Install BIRD2
sudo apt install -y bird2

# 3. Install networking/debug tools
sudo apt install -y \
  traceroute \
  tcpdump \
  net-tools \
  dnsutils \
  iputils-ping \
  curl \
  awscli

# 4. Enable IP forwarding (persistent)
echo "net.ipv4.ip_forward = 1" | sudo tee /etc/sysctl.d/99-ip-forward.conf
sudo sysctl -p /etc/sysctl.d/99-ip-forward.conf

# 5. Enable BIRD2 to start on boot
sudo systemctl enable bird

# 6. Clean up before snapshot
sudo apt clean
sudo rm -rf /tmp/* /var/tmp/*
history -c

# 7. Create the AMI
aws ec2 create-image \
  --instance-id $(curl -s http://169.254.169.254/latest/meta-data/instance-id) \
  --name "bird-golden-ami-$(date +%Y%m%d)" \
  --no-reboot \
  --region ap-south-1
