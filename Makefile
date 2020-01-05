.PHONY: all install uninstall

all:
	@echo "make [install|uninstall]"

install:
	cp -rf amdgpu-fix.service /etc/systemd/system/
	mkdir -p /opt/amdgpu-fix
	cp -f amdgpu-fix /opt/amdgpu-fix/
	chmod +x /opt/amdgpu-fix/amdgpu-fix
	systemctl daemon-reload
	systemctl enable --now amdgpu-fix.service
	@echo
	@echo "amdgpu-fix installed successfully."

uninstall:
	systemctl disable --now amdgpu-fix.service | true
	rm -f /etc/systemd/system/amdgpu-fix.service
	rm -rf /opt/amdgpu-fix
	@echo
	@echo "amdgpu-fix uninstalled successfully."