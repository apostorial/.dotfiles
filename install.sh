echo "Installing base packages..."
sudo pacman -Syu --noconfirm --needed git base-devel

if ! command -v paru &> /dev/null; then
    echo "Installing paru AUR helper..."
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru || exit
    makepkg -si --noconfirm
    cd - || exit
fi

echo "Installing packages from packages.txt..."
paru -S --needed --noconfirm - < packages.txt

