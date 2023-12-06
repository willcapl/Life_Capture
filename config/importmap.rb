# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.1.2/app/assets/javascripts/rails-ujs.esm.js"
pin "typed.js", to: "https://ga.jspm.io/npm:typed.js@2.1.0/dist/typed.module.js"
pin "@shopify/draggable", to: "https://ga.jspm.io/npm:@shopify/draggable@1.1.3/build/esm/index.mjs"
