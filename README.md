# Creative Rails4+ Flash Object Example

## Setup
Review database.yml and run `bin/setup`, ignore the failure warning.  
Run the webserver and navigate to root, click buttons.  

## Guidelines, Key Principles

### Flash Content Managament
##### 1. Application must define a sensible default I18n locale in application.rb

```rb
config.i18n.default_locale = "en"
```

##### 2. Flash message content is always localized

```rb
config.i18n.load_path += Dir["#{Rails.root}/config/locales/**/*.yml"]
```

```yml
# in /config/locales/flash/en.yml
en:
  flash:
    some:
      namespace:
        notice: "Yay, test notice!"
```

Provide localization for at least the default locale.  

### Flash Keys
Flash messages use the two default keys `:notice` and `:alert`.

#### Notice
:notice type flashes signal success, normal, expected operation.  
Use green, light blue colors.  

#### Alert
:alert type flashes signal error, failure, unexpected operation and demand user attention.  
Use red, dark orange colors.  


### Flash Lifecycle
Common use-case is to set flashes in view-less actions that redirect somewhere.  

```rb
# in some :create or :update action
flash[:notice] = I18n.t("flash.some.namespace.notice")
flash[:alert] = I18n.t("flash.some.namespace.alert")
redirect_to action_with_view_path
```

Note that flash contents are marked for cleanup automatically once `render` is called.  
This means that flash messages are correctly persisted over redirects, as can be seen in this app's example.   

### Flash MEssage Displaying
The template that ends up being rendered must have a catch-all flash message processor.  
This is probably best achieved via a partial that is included in all templates (via layout?)

```slim
- flash.keys.each do |flash_key|
  / this is mock
  h3
    = "class=#{flash_key} value=#{flash[flash_key]}"   
```

The flash messages ought to be displayed "on top of" all other elements, provide a closing "x" button and automatically disappear in 10s.

Consider [this example](https://agilewarrior.files.wordpress.com/2014/04/rails-flash.png?w=500) for appeal.  

##
