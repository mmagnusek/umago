# Pin npm packages by running ./bin/importmap

pin "application"
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@hotwired/turbo-rails", to: "turbo.min.js"

pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true
pin "jquery", to: 'https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js'
pin "bxslider", to: 'https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js'
pin "fancybox", to: 'https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js'
