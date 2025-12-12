{...}: {
	# ==============================================================================
	# OPTIMIZED SYSCTL CONFIGURATION - 32GB RAM SYSTEM
	# Target: Music Production (Sub-3ms latency) + Gaming (144Hz+)
	# ==============================================================================

	boot.kernel.sysctl = {
		# ==============================================================================
		# KERNEL: Scheduler & Realtime - UPDATED FOR THROUGHPUT
		# ==============================================================================

		# Unlimited realtime scheduling (CRITICAL for audio)
		"kernel.sched_rt_runtime_us" = -1;

		# Timer migration - IMPROVED: Allow migration during idle
		"kernel.timer_migration" = 1;

		# Process accounting: balance between monitoring and overhead
		"kernel.acct" = "10 1 10";

		# Message queue limits (adequate for most workloads)
		"kernel.msgmax" = 65536;
		"kernel.msgmnb" = 65536;
		"kernel.msgmni" = 32768;

		# ==============================================================================
		# KERNEL: Security Hardening
		# ==============================================================================

		"kernel.dmesg_restrict" = 1;
		"kernel.kptr_restrict" = 2;
		"kernel.kexec_load_disabled" = 1;
		"kernel.printk" = "3 3 3 3";
		"kernel.sysrq" = 0;
		"kernel.perf_event_paranoid" = 3;
		"kernel.unprivileged_bpf_disabled" = 1;
		"kernel.bpf_stats_enabled" = 0;
		"kernel.core_uses_pid" = 1;
		"kernel.core_pattern" = "|/bin/false";
		"kernel.yama.ptrace_scope" = 1;

		# ==============================================================================
		# MEMORY: Virtual Memory Subsystem - 32GB OPTIMIZED
		# ==============================================================================

		"vm.mmap_rnd_bits" = 32;
		"vm.mmap_rnd_compat_bits" = 16;

		# Dirty page writeback tuning - IMPROVED FOR THROUGHPUT
		"vm.dirty_ratio" = 15;
		"vm.dirty_background_ratio" = 8;
		"vm.dirty_expire_centisecs" = 3000;
		"vm.dirty_writeback_centisecs" = 1000;

		# Cache pressure - slightly more aggressive reclaim for throughput
		"vm.vfs_cache_pressure" = 75;

		# Swap behavior - more flexible for bursty workloads
		"vm.swappiness" = 10;
		"vm.page-cluster" = 3;

		# Memory reclaim - IMPROVED
		"vm.min_free_kbytes" = 262144;
		"vm.watermark_scale_factor" = 150;
		"vm.watermark_boost_factor" = 50;

		# Memory overcommit - allow more aggressive overcommit
		"vm.overcommit_memory" = 0;
		"vm.overcommit_ratio" = 75;

		# Transparent Hugepage - IMPROVED FOR THROUGHPUT
		"vm.defrag_mode" = 1; # Note: Ensure your kernel supports this specific parameter

		# Memory compaction - IMPROVED
		"vm.compaction_proactiveness" = 50;
		"vm.compact_unevictable_allowed" = 1;

		# NUMA zone reclaim
		"vm.zone_reclaim_mode" = 0;

		# Memory statistics - IMPROVED
		"vm.stat_interval" = 30;

		# Working set protection
		"vm.workingset_protection" = 1;

		# Maximum memory map areas
		"vm.max_map_count" = 2147483642;

		# Hugetlb optimization
		"vm.hugetlb_optimize_vmemmap" = 1;

		# OOM killer behavior
		"vm.oom_kill_allocating_task" = 0;
		"vm.panic_on_oom" = 0;
		"vm.oom_dump_tasks" = 1;

		# Laptop mode
		"vm.laptop_mode" = 0;

		# Extfrag threshold - IMPROVED
		"vm.extfrag_threshold" = 750;

		# ==============================================================================
		# FILESYSTEM
		# ==============================================================================

		"fs.dentry-negative" = 1;
		"fs.protected_fifos" = 2;
		"fs.protected_hardlinks" = 1;
		"fs.protected_regular" = 2;
		"fs.protected_symlinks" = 1;

		# Inotify limits (CRITICAL for DAWs with large sample libraries)
		"fs.inotify.max_user_watches" = 524288;
		"fs.inotify.max_user_instances" = 512;
		"fs.inotify.max_queued_events" = 32768;

		# File descriptor limits - INCREASED FOR THROUGHPUT
		"fs.file-max" = 4194304;
		"fs.nr_open" = 2097152;

		# AIO limits - INCREASED FOR ASYNC I/O
		"fs.aio-max-nr" = 2097152;

		# Pipe limits - INCREASED
		"fs.pipe-max-size" = 2097152;
		"fs.pipe-user-pages-soft" = 32768;
		"fs.pipe-user-pages-hard" = 65536;

		# SUID core dump security
		"fs.suid_dumpable" = 0;

		# Leases and directory notification
		"fs.leases-enable" = 1;
		"fs.dir-notify-enable" = 1;

		# ==============================================================================
		# NETWORK: Core Buffer Configuration - BALANCED FOR THROUGHPUT
		# ==============================================================================

		# Socket buffer sizes - BALANCED (throughput WITHOUT bloat)
		"net.core.rmem_default" = 8388608;
		"net.core.rmem_max" = 16777216;
		"net.core.wmem_default" = 8388608;
		"net.core.wmem_max" = 16777216;
		"net.core.optmem_max" = 65536;

		# Backlog queues - IMPROVED
		"net.core.netdev_max_backlog" = 16384;
		"net.core.netdev_budget" = 600;
		"net.core.netdev_budget_usecs" = 8000;

		# Listen backlog
		"net.core.somaxconn" = 4096;

		# Queueing discipline: CAKE
		# Ensure the 'sch_cake' kernel module is available
		"net.core.default_qdisc" = "cake";

		# BPF JIT
		"net.core.bpf_jit_enable" = 1;
		"net.core.bpf_jit_harden" = 2;
		"net.core.bpf_jit_kallsyms" = 0;

		# Flow steering - IMPROVED
		"net.core.rps_sock_flow_entries" = 65536;

		# ==============================================================================
		# NETWORK: IPv4 TCP/UDP - THROUGHPUT OPTIMIZED
		# ==============================================================================

		# TCP buffer auto-tuning - IMPROVED FOR THROUGHPUT
		"net.ipv4.tcp_rmem" = "4096 262144 16777216";
		"net.ipv4.tcp_wmem" = "4096 262144 16777216";

		# UDP buffer sizes
		"net.ipv4.udp_rmem_min" = 8192;
		"net.ipv4.udp_wmem_min" = 8192;

		# TCP memory limits - GENEROUS BUT NOT EXCESSIVE
		"net.ipv4.tcp_mem" = "131072 655360 1310720";

		# TCP performance - THROUGHPUT FOCUSED
		"net.ipv4.tcp_fastopen" = 3;
		"net.ipv4.tcp_slow_start_after_idle" = 0;
		"net.ipv4.tcp_mtu_probing" = 1;
		"net.ipv4.tcp_timestamps" = 1;
		"net.ipv4.tcp_sack" = 1;
		"net.ipv4.tcp_fack" = 1;
		"net.ipv4.tcp_dsack" = 1;
		"net.ipv4.tcp_ecn" = 1;
		"net.ipv4.tcp_early_retrans" = 4;
		"net.ipv4.tcp_rfc1337" = 1;
		"net.ipv4.tcp_window_scaling" = 1;

		# Congestion control: BBR
		# Ensure 'tcp_bbr' module is loaded
		"net.ipv4.tcp_congestion_control" = "bbr";
		"net.ipv4.tcp_notsent_lowat" = 16384;

		# Connection handling - IMPROVED
		"net.ipv4.tcp_max_syn_backlog" = 65536;
		"net.ipv4.tcp_max_tw_buckets" = 4000000;
		"net.ipv4.tcp_fin_timeout" = 10;
		"net.ipv4.tcp_syncookies" = 1;

		# TCP keepalive
		"net.ipv4.tcp_keepalive_time" = 60;
		"net.ipv4.tcp_keepalive_intvl" = 10;
		"net.ipv4.tcp_keepalive_probes" = 6;

		# Local port range
		"net.ipv4.ip_local_port_range" = "16384 65535";

		# ICMP rate limiting
		"net.ipv4.icmp_ratelimit" = 100;
		"net.ipv4.icmp_ratemask" = 6168;

		# TCP reordering tolerance
		"net.ipv4.tcp_reordering" = 3;

		# TCP retries - BALANCED
		"net.ipv4.tcp_syn_retries" = 3;
		"net.ipv4.tcp_synack_retries" = 3;
		"net.ipv4.tcp_orphan_retries" = 2;

		# TCP memory pressure - IMPROVED
		"net.ipv4.tcp_moderate_rcvbuf" = 1;
		"net.ipv4.tcp_no_metrics_save" = 0;

		# MTU discovery
		"net.ipv4.tcp_base_mss" = 1024;
		"net.ipv4.tcp_mtu_probe_floor" = 48;

		# ==============================================================================
		# NETWORK: IPv4 Security Hardening
		# ==============================================================================

		"net.ipv4.conf.all.accept_source_route" = 0;
		"net.ipv4.conf.default.accept_source_route" = 0;
		"net.ipv4.conf.all.rp_filter" = 1;
		"net.ipv4.conf.default.rp_filter" = 1;
		"net.ipv4.conf.all.accept_redirects" = 0;
		"net.ipv4.conf.default.accept_redirects" = 0;
		"net.ipv4.conf.all.secure_redirects" = 0;
		"net.ipv4.conf.default.secure_redirects" = 0;
		"net.ipv4.conf.all.send_redirects" = 0;
		"net.ipv4.conf.default.send_redirects" = 0;
		"net.ipv4.icmp_echo_ignore_broadcasts" = 1;
		"net.ipv4.icmp_ignore_bogus_error_responses" = 1;
		"net.ipv4.conf.all.log_martians" = 0;
		"net.ipv4.conf.default.log_martians" = 0;
		"net.ipv4.icmp_errors_use_inbound_ifaddr" = 0;
		"net.ipv4.ip_forward" = 0;
		"net.ipv4.conf.all.forwarding" = 0;
		"net.ipv4.conf.default.forwarding" = 0;

		# ==============================================================================
		# NETWORK: IPv6 Configuration
		# ==============================================================================

		"net.ipv6.ip6frag_high_thresh" = 4194304;
		"net.ipv6.ip6frag_low_thresh" = 3145728;
		"net.ipv6.conf.all.accept_ra" = 1;
		"net.ipv6.conf.default.accept_ra" = 1;
		"net.ipv6.conf.all.accept_ra_defrtr" = 1;
		"net.ipv6.conf.default.accept_ra_defrtr" = 1;
		"net.ipv6.conf.all.accept_ra_pinfo" = 1;
		"net.ipv6.conf.default.accept_ra_pinfo" = 1;
		"net.ipv6.conf.all.accept_ra_rtr_pref" = 1;
		"net.ipv6.conf.default.accept_ra_rtr_pref" = 1;
		"net.ipv6.conf.all.autoconf" = 1;
		"net.ipv6.conf.default.autoconf" = 1;
		"net.ipv6.conf.all.accept_redirects" = 0;
		"net.ipv6.conf.default.accept_redirects" = 0;
		"net.ipv6.conf.all.accept_source_route" = 0;
		"net.ipv6.conf.default.accept_source_route" = 0;
		"net.ipv6.conf.all.forwarding" = 0;
		"net.ipv6.conf.default.forwarding" = 0;
		"net.ipv6.conf.all.mtu" = 1500;
		"net.ipv6.conf.default.mtu" = 1500;
		"net.ipv6.conf.all.use_tempaddr" = 2;
		"net.ipv6.conf.default.use_tempaddr" = 2;
		"net.ipv6.conf.all.dad_transmits" = 1;
		"net.ipv6.conf.default.dad_transmits" = 1;
		"net.ipv6.conf.all.router_solicitations" = 3;
		"net.ipv6.conf.default.router_solicitations" = 3;
		"net.ipv6.conf.all.router_solicitation_delay" = 1;
		"net.ipv6.conf.default.router_solicitation_delay" = 1;
		"net.ipv6.conf.all.router_solicitation_interval" = 4;
		"net.ipv6.conf.default.router_solicitation_interval" = 4;
		"net.ipv6.neigh.default.gc_thresh1" = 256;
		"net.ipv6.neigh.default.gc_thresh2" = 1024;
		"net.ipv6.neigh.default.gc_thresh3" = 2048;
		"net.ipv6.route.max_size" = 32768;

		# ==============================================================================
		# DEVICE SECURITY
		# ==============================================================================

		"dev.tty.ldisc_autoload" = 0;
	};

	# Make sure necessary modules are loaded for specific sysctl settings
	boot.kernelModules = ["tcp_bbr" "sch_cake"];
}
