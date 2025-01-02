# Activate ZSH as default shell

- Must be done after running flake in Ubuntu

```
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)
```

## Notes
- Setting fonts is not necessary because you are using the Windows Host fonts
