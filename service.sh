#!/system/bin/sh
# Grant full read/write/execute permissions to CPU governor files
sleep 10
# Apply settings
# Set Conservative
echo "conservative" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo "conservative" > /sys/devices/system/cpu/cpufreq/policy6/scaling_governor
echo "conservative" > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
#
echo "60" > "/sys/devices/system/cpu/cpufreq/policy0/conservative/down_threshold"
echo "90" > "/sys/devices/system/cpu/cpufreq/policy0/conservative/up_threshold"
echo "8000" > "/sys/devices/system/cpu/cpufreq/policy0/conservative/sampling_rate"
echo "90" > "/sys/devices/system/cpu/cpufreq/policy0/conservative/freq_step"
echo "60" > "/sys/devices/system/cpu/cpufreq/policy6/conservative/down_threshold"
echo "90" > "/sys/devices/system/cpu/cpufreq/policy6/conservative/up_threshold"
echo "8000" > "/sys/devices/system/cpu/cpufreq/policy6/conservative/sampling_rate"
echo "90" > "/sys/devices/system/cpu/cpufreq/policy6/conservative/freq_step"
echo "60" > "/sys/devices/system/cpu/cpufreq/policy4/conservative/down_threshold"
echo "90" > "/sys/devices/system/cpu/cpufreq/policy4/conservative/up_threshold"
echo "8000" > "/sys/devices/system/cpu/cpufreq/policy4/conservative/sampling_rate"
echo "90" > "/sys/devices/system/cpu/cpufreq/policy4/conservative/freq_step"

# Disable kernel panic reboot
echo "0" > /proc/sys/kernel/panic
echo "0" > /proc/sys/kernel/panic_on_oops
echo "0" > /proc/sys/kernel/panic_on_warn
echo "0" > /proc/sys/kernel/panic_on_rcu_stall
echo "0" > /sys/module/kernel/parameters/panic
echo "0" > /sys/module/kernel/parameters/panic_on_warn
echo "0" > /sys/module/kernel/parameters/pause_on_oops
echo "0" > /sys/module/kernel/panic_on_rcu_stall
# Disable Qualcomm's watchdog (for Snapdragon devices)
chmod "777" /sys/module/msm_watchdog/parameters/pet_enable
echo "0" > /sys/module/msm_watchdog/parameters/pet_enable
chmod "444" /sys/module/msm_watchdog/parameters/pet_enable
chmod "777" /sys/module/msm_watchdog/parameters/enable
echo 0 > /sys/module/msm_watchdog/parameters/enable
chmod "444" /sys/module/msm_watchdog/parameters/enable

#VM
echo "10" > /proc/sys/vm/dirty_background_ratio
echo "20" > /proc/sys/vm/dirty_ratio
echo "70" > /proc/sys/vm/vfs_cache_pressure
echo "3000" > /proc/sys/vm/dirty_expire_centisecs
echo "500" > /proc/sys/vm/dirty_writeback_centisecs
echo "0" > /proc/sys/vm/oom_dump_tasks
echo "8" > /proc/sys/vm/page-cluster
echo "20" > /proc/sys/vm/stat_interval
echo "70" > /proc/sys/vm/swappiness
#RamDump
echo "0" > /sys/module/subsystem_restart/parameters/enable_ramdumps
echo "0" > /sys/module/subsystem_restart/parameters/enable_mini_ramdumps
# Remove log files
rm -rf /data/log/*
rm -rf /data/system/dropbox/*
rm -rf /data/tombstones/*
rm -rf /data/misc/logd/*
rm -rf /mnt/sdcard/Android/data/com.android.logger/*
#color
sleep 20
service call SurfaceFlinger 1022 f 1.3
#