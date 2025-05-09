{
  config,
  lib,
  pkgs,
  ...
}:
{
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
        memtest86 = {
          enable = true;
        };
        edk2-uefi-shell = {
          enable = true;
        };
        editor = false;
      };
    };
    plymouth = {
      enable = true;
      theme = "tribar";
    };

    kernelParams = [
      "ro"
      "realloc"
      "rcutree.kthread_prio=99"
      "workqueue.power_efficient=0"
      "pci=pcie_bus_perf"
      "amd_pstate=active"
      "preempt=full"
      "threadirqs"
      "slab_nomerge"
      "randomize_kstack_offset=on"
      "init_on_alloc=1"
      "init_on_free=1"
      "page_alloc.shuffle=1"
      "pti=on"
      "vsyscall=none"
      "oops=panic"
      "module.sig_enforce=1"
      "mce=1"
      "audit_backlog_limit=8192"
      "quiet"
      "splash"
      "loglevel=0"
    ];
    kernel = {
      sysctl = {
        "vm.dirty_ratio" = 10;
        "vm.dirty_background_ratio" = 10;
        "vm.vfs_cache_pressure" = 25;
        "net.core.default_qdisc" = "cake";
        "net.ipv4.tcp_congestion_control" = "bbr";
        "vm.page-cluster" = 0;
        "vm.watermark_boost_factor" = 0;
        "vm.watermark_scale_factor" = 125;
        "vm.swappiness" = 200;
        "vm.max_map_count" = 2147483642;
        "vm.hugetlb_optimize_vmemmap" = 1;
        "vm.nr_hugepages" = 1024;
        "net.core.netdev_max_backlog" = 32768;
        "net.core.somaxconn" = 16384;
        "net.core.rmem_default" = 1048576;
        "net.core.rmem_max" = 16777216;
        "net.core.wmem_default" = 1048576;
        "net.core.wmem_max" = 16777216;
        "net.core.optmem_max" = 65536;
        "net.ipv4.tcp_rmem" = "4096 1048576 2097152";
        "net.ipv4.tcp_wmem" = "4096 65536 16777216";
        "net.ipv4.udp_rmem_min" = 16384;
        "net.ipv4.udp_wmem_min" = 16384;
        "net.ipv4.tcp_fastopen" = 3;
        "net.ipv4.tcp_max_syn_backlog" = 32768;
        "net.ipv4.tcp_max_tw_buckets" = 2000000;
        "net.ipv4.tcp_fin_timeout" = 10;
        "net.ipv4.tcp_slow_start_after_idle" = 0;
        "net.ipv4.tcp_keepalive_time" = 60;
        "net.ipv4.tcp_keepalive_intvl" = 10;
        "net.ipv4.tcp_keepalive_probes" = 6;
        "net.ipv4.tcp_mtu_probing" = 1;
        "net.ipv4.ip_local_port_range" = "30000 65535";
        "dev.tty.ldisc_autoload" = 0;
        "fs.protected_fifos" = 2;
        "fs.protected_hardlinks" = 1;
        "fs.protected_regular" = 2;
        "fs.protected_symlinks" = 1;
        "kernel.dmesg_restrict" = 1;
        "kernel.kexec_load_disabled" = 1;
        "kernel.kptr_restrict" = 2;
        "kernel.printk" = "3 3 3 3";
        "kernel.sysrq" = 0;
        "net.core.bpf_jit_harden" = 2;
        "net.ipv4.conf.all.accept_redirects" = 0;
        "net.ipv4.conf.all.accept_source_route" = 0;
        "net.ipv4.conf.all.rp_filter" = 1;
        "net.ipv4.conf.all.secure_redirects" = 0;
        "net.ipv4.conf.all.send_redirects" = 0;
        "net.ipv4.conf.default.accept_redirects" = 0;
        "net.ipv4.conf.default.accept_source_route" = 0;
        "net.ipv4.conf.default.rp_filter" = 1;
        "net.ipv4.conf.default.secure_redirects" = 0;
        "net.ipv4.conf.default.send_redirects" = 0;
        "net.ipv4.icmp_echo_ignore_all" = 1;
        "net.ipv4.tcp_dsack" = 1;
        "net.ipv4.tcp_fack" = 1;
        "net.ipv4.tcp_rfc1337" = 1;
        "net.ipv4.tcp_sack" = 1;
        "net.ipv4.tcp_syncookies" = 1;
        "net.ipv4.tcp_timestamps" = 1;
        "net.ipv6.conf.all.accept_ra" = 0;
        "net.ipv6.conf.all.accept_redirects" = 0;
        "net.ipv6.conf.all.accept_source_route" = 0;
        "net.ipv6.conf.all.use_tempaddr" = 2;
        "net.ipv6.conf.default.accept_ra" = 0;
        "net.ipv6.conf.default.accept_redirects" = 0;
        "net.ipv6.conf.default.accept_source_route" = 0;
        "vm.mmap_rnd_bits" = 32;
        "vm.mmap_rnd_compat_bits" = 16;
        "kernel.sched_bore" = 1;
        "kernel.sched_burst_fork_atavistic" = 3;
        "kernel.sched_burst_smoothness_long" = 1;
        "kernel.sched_burst_smoothness_short" = 1;
        "kernel.sched_burst_exclude_kthreads" = 0;
        "kernel.sched_rt_runtime_us" = -1;
      };
    };
    kernelPackages = pkgs.linuxPackages_cachyos;
    runSize = "100%";
    devSize = "100%";
    devShmSize = "100%";
    tmp = {
      useTmpfs = true;
      tmpfsSize = "100%";
      cleanOnBoot = true;
    };

    initrd = {
      systemd = {
        enable = true;
        dbus = {
          enable = true;
        };
        tpm2 = {
          enable = true;
        };
      };
      services = {
        resolved = {
          enable = true;
        };
      };
    };
  };
}
