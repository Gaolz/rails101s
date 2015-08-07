environment "production"
basedir = "/home/glz/rails101s/shared/tmp"
#basedir = "/Users/aoner/adsock/tmp/pids"
bind "unix://#{basedir}/puma.sock"
pidfile "#{basedir}/puma.pid"
state_path "#{basedir}/puma.state"
daemonize true
workers 1
threads 8,16
preload_app!
