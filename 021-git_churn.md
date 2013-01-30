# Get churn counts for Git repository

I've found this gem - `git-churn` - while browsing Gary Bernhardt's dot files:
https://github.com/garybernhardt/dotfiles/blob/master/bin/git-churn

The script can show you the churn counts for an entire Git repo or specific files/directories in it.

As an example, I ran `git-churn` against the Linux kernel to get the top 10 most modified files:

```sh
$ cd linux/
$ git describe
v3.8-rc5-218-ga56e160
$ git churn | tail -n10
746     arch/x86/kvm/x86.c
779     net/core/dev.c
804     drivers/net/tg3.c
807     drivers/net/wireless/iwlwifi/iwl-agn.c
848     arch/arm/Kconfig
871     include/linux/sched.h
898     drivers/gpu/drm/i915/intel_display.c
1068    sound/pci/hda/patch_realtek.c
1359    kernel/sched.c
2142    MAINTAINERS
```

Last but not least, in case you prefer Git aliases (like I do):
https://github.com/mlafeldt/dotfiles/commit/4fbca97cd1f4241cb477f3ec56e7712905aef85f

_Published on [Coderwall](https://coderwall.com/p/xxx) on 2013-01-30_
