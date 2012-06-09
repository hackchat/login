root = "/home/deployer/apps/login/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.login.sock"
listen 7004
worker_processes 2
timeout 30