# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( bower_components/bootstrap/dist/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( bower_components/metisMenu/dist/metisMenu.min.css )
Rails.application.config.assets.precompile += %w( dist/css/timeline.css )
Rails.application.config.assets.precompile += %w( dist/css/sb-admin-2.css )
Rails.application.config.assets.precompile += %w( bower_components/morrisjs/morris.css )
Rails.application.config.assets.precompile += %w( bower_components/font-awesome/css/font-awesome.min.css )

#frontend
Rails.application.config.assets.precompile += %w( front_end/shop-homepage.css )
Rails.application.config.assets.precompile += %w( front_end/custom.css )
Rails.application.config.assets.precompile += %w( front_end/shop-item.css )

#js
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( bower_components/bootstrap/dist/js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( bower_components/metisMenu/dist/metisMenu.min.js )

Rails.application.config.assets.precompile += %w( dist/js/sb-admin-2.js )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
