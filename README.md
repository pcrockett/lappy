# Pre-automation notes

In the arch installer I installed the Desktop / Qtile profile.

```bash
mkdir ~/.config/beekrpad/bin
cd ~/.config/beekrpad/bin
wget https://github.com/pcrockett/blarg/raw/main/blarg
chmod +x blarg
```

Then I started hacking out this repository with `nano`, then `helix` / `hx`.

Then set git basic settings:

```bash
git config --global init.defaultBranch main
git config --global user.email contact@philcrockett.com
git config --global user.name "Phil Crockett"
```

... and now everything else can be tracked via this repository. Just run `make`.
