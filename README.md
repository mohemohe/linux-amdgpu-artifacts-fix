# linux-amdgpu-artifacts-fix

Fix screen artifacts and frequency problem without lock power_dpm to keeps low power consumption.

## why?

Arch wiki says,

> A workaround is saving `high` or `low` in `/sys/class/drm/card0/device/power_dpm_force_performance_level` .
> https://wiki.archlinux.org/index.php/AMDGPU#Screen_artifacts_and_frequency_problem

However, locks `power_dpm` means trade of power or performance.  
This problem is caused by the inability of the memory speed to keep up with the screen update, so simply lock the memory clock is sufficient.

This script sets mclk to the highest level to prevent screen artifacts.  
Since the power consumption is dominated by sclk, so low power consumption can be maintained.

## require

- bash
- [rocm-smi](https://github.com/RadeonOpenCompute/ROC-smi)

## install

```sh
make install
```

## uninstall

```sh
make uninstall
```