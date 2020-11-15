Vagrant.configure(2) do |config|
  config.vm.provision "shell", inline: <<-SHELL
    pip install --upgrade pip
    pip install "pywinrm>=0.3.0"
  SHELL
end
