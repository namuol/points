doctype 5
html ->
  head ->
    meta charset:'utf-8'
    link rel:'stylesheet', href:'bootstrap/css/bootstrap.min.css'
    link rel:'stylesheet', href:'style.css'
    link rel:'stylesheet', href:'bootstrap/css/bootstrap-responsive.min.css'

  body ->
    div class:'navbar navbar-inverse navbar-fixed-top', ->
      div class:'navbar-inner', ->
        div class:'container', ->
          a class:'btn btn-navbar', 'data-toggle':'collapse', 'data-target':'.nav-collapse', ->
            span class:'icon-bar'
            span class:'icon-bar'
            span class:'icon-bar'
          a class:'brand', 'Leendapoints System'
          div class:'nav-collapse collapse', ->
            ul id:'nav_buttons', class:'nav', ->
              li -> a href:'#home', 'Home'
              li -> a href:'#about', 'About'
              li -> a href:'#contact', 'Contact'

          div id:'not_logged_in', ->
            ul id:'log-in-nav', class:'nav pull-right', ->
              li class:'dropdown', ->
                a href:'#',
                  role:'button',
                  class:'dropdown-toggle',
                  'data-toggle':'dropdown'
                , ->
                  text 'Log In '
                  b class:'caret', ''

                div class:'dropdown-menu', role:'menu', ->
                  form id:'log-in', ->
                    div class:'control-group', ->
                      div class:'controls', ->
                        div class:'input-prepend', ->
                          span class:'add-on', ->
                            i class:'icon-user'
                          input
                            id:'log-in-name'
                            type:'text'
                            placeholder:'Username'

                      div class:'controls', ->
                        div class:'input-prepend', ->
                          span class:'add-on', ->
                            i class:'icon-lock'
                          input
                            id:'log-in-pass'
                            type:'password'
                            placeholder:'Password'

                    a class:'forgot-password pull-left', href:'#', 'Forgot password?'
                    button class:'btn pull-right', 'Log In'

            ul id:'sign-up-nav', class:'nav pull-right', ->
              li class:'dropdown', ->
                a href:'#',
                  role:'button',
                  class:'dropdown-toggle',
                  'data-toggle':'dropdown'
                , ->
                  text 'Sign Up '
                  b class:'caret', ''

                div class:'dropdown-menu', role:'menu', ->
                  form id:'sign-up', ->
                    div class:'control-group', ->
                      div class:'controls', ->
                        div class:'input-prepend', ->
                          span class:'add-on', ->
                            i class:'icon-envelope'
                          input
                            id:'sign-up-email'
                            type:'email'
                            placeholder:'Email'

                      div class:'controls', ->
                        div class:'input-prepend', ->
                          span class:'add-on', ->
                            i class:'icon-envelope'
                          input
                            id:'sign-up-name'
                            type:'text'
                            placeholder:'Desired Username'

                      div class:'controls', ->
                        div class:'input-prepend', ->
                          span class:'add-on', ->
                            i class:'icon-lock'
                          input
                            id:'sign-up-pass'
                            type:'password'
                            placeholder:'Password'
                    button class:'btn pull-right', 'Sign Up'

          div id:'logged_in', class:'pull-right', ->
            button id:'myself', class:'btn btn-info', ->
              i class:'icon-white icon-user'
              text '&nbsp;'
              span id:'username_display'
            text '&nbsp;'
            button
              id:'log-out'
              class:'btn btn-inverse'
              type:'submit'
            , 'Log Out'


    div id:'content', class:'container', ->
      div id:'album_search_modal', class:'modal hide', ->
        div class:'modal-header', ->
          button
            type:'button'
            class:'close'
            'data-dismiss':'modal'
            'aria-hidden':'true'
          , -> text '&times'

          h3 'Add an Album\'s Tracks'

        div class:'modal-body', ->
          form class:'form-horizontal', ->
            div class:'control-group', ->
              label class:'control-label', for:'creator', 'Artist'
              div class:'controls', ->
                input class:'input-xlarge', type:'text', name:'creator'
            div class:'control-group', ->
              label class:'control-label', for:'title', 'Album Title'
              div class:'controls', ->
                input class:'input-xlarge', type:'text', name:'album'
            div class:'control-group', ->
              div class:'controls', ->
                button id:'song_modal_search', type:'submit', class:'btn btn-primary', ->
                  strong 'Search'

            div class:'album_modal_search_results'

    script src:'jquery-1.7.2.min.js'
    script src:'bootstrap/js/bootstrap.min.js'
    script type:'text/javascript', src:'//www.parsecdn.com/js/parse-1.1.6.min.js'

    coffeescript ->
      ###           ###
      #               #
      #  ,d88b.d88b,  #
      #  888hello888  #
      #  `Y8888888Y'  #
      #    `Y888Y'    #
      #      `Y'      #
      #               #
      ###           ###

      $ ->
        Parse.initialize("9v1vYmz7cxzMEENGmhDp3Zx3c4sJiJCMmResDL4i", "RnLqBUN1npB97MzJQnEjfcrQuEX3yARMPVBmrA3s")

        Chore = Parse.Object.extend 'Chore'
        Reward = Parse.Object.extend 'Reward'

        if Parse.User.current()
          $('#username_display').text Parse.User.current().get 'username'
          $('#not_logged_in').hide()
          $('#logged_in').show()

        $('#log-in').submit (e) ->
          e.preventDefault()

          name = $('#log-in-name').val()
          pass = $('#log-in-pass').val()
          Parse.User.logIn name, pass,
            success: (user) ->
              $('#username_display').text user.get 'username'
              $('#not_logged_in').hide()
              $('#logged_in').show()
            error: (user, error) ->
              alert error.message

          $('#log-in-name').val ''
          $('#log-in-pass').val ''

          return false
        
        _newProfile = {}
        $('#sign-up').submit (e) ->
          e.preventDefault()

          name = $('#sign-up-name').val()
          pass = $('#sign-up-pass').val()
          email = $('#sign-up-email').val()

          user = new Parse.User
          user.set 'username', name
          user.set 'password', pass
          user.set 'email', email
          for own key,val of _newProfile
            user.set key, val

          user.signUp null,
            success: (user) ->
              Parse.User.logIn name, pass,
                success: (user) ->
                  $('#username_display').text user.username
                  $('#not_logged_in').hide()
                  $('#logged_in').show()
                error: (user, error) ->
                  alert error.message
            error: (user, error) ->
              alert error.message

          $('#sign-up-name').val ''
          $('#sign-up-pass').val ''
          $('#new_profile_email').val ''
          return false
        
        $('#log-out').click ->
          Parse.User.logOut()
          $('#logged_in').hide()
          $('#not_logged_in').show()
