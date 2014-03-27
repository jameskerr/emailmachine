role :app, %w{charles@chapmancso.com}
role :web, %w{charles@chapmancso.com}
role :db,  %w{charles@chapmancso.com}

before "bundler:install", :config_pg_gem