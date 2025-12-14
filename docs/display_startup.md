# Display startup (Option B — minimal X session via systemd + xinit)

This project includes a small systemd unit and a `xinit` template to run the Kivy UI on a Pi with a connected display without installing a full desktop environment.

Files added for Option B:

- `deploy/dashzero-x.service` — systemd unit that runs `xinit /home/jarren/.xinitrc -- :0` as user `jarren`.
- `deploy/xinitrc.template` — a minimal `~/.xinitrc` template that starts `openbox` and the project's `scripts/start_kivy.sh`.
- `scripts/start_kivy.sh` — wrapper script that ensures a Python venv is present, installs requirements if necessary, and runs `main.py`.

Install & enable steps (on the Pi):

```bash
# 1) Install minimal X and openbox
sudo apt update
sudo apt install -y xserver-xorg xinit openbox

# 2) Copy the template to your home and make executable
cp deploy/xinitrc.template ~/.xinitrc
chmod +x ~/.xinitrc

# 3) Reload systemd and enable/start the service
sudo systemctl daemon-reload
sudo systemctl enable --now dashzero-x.service
sudo journalctl -u dashzero-x.service -f
```

Troubleshooting:
- If `xinit` is missing, ensure you installed `xinit` and `xserver-xorg`.
- If the service fails to start, check `sudo journalctl -u dashzero-x.service -n 200 --no-pager` and `systemctl status dashzero-x.service`.

If you'd rather use autologin and a desktop autostart, see Option A in the project README.
