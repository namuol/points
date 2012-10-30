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
          a href:'#/', class:'brand', 'Points System'
          div class:'nav-collapse collapse', ->
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

          div id:'logged_in', ->
            ul id:'nav_buttons', class:'nav', ->
              li id:'master_slave_dropdown', class:'dropdown', ->
              li -> a id:'yours_link', href:'#/yours', 'Yours'
              li -> a id:'theirs_link', href:'#/theirs', 'Theirs'

            div class:'pull-right', ->
              button id:'myself', class:'btn btn-info', ->
                i class:'icon-white icon-user'
                text '&nbsp;'
                span class:'username_display'
              text '&nbsp;'
              button
                id:'log-out'
                class:'btn btn-inverse'
                type:'submit'
              , 'Log Out'


    div id:'content', class:'container', ->
      div id:'main', class:'row content', ->
        h1 'Points.'
      
      div id:'user', class:'content', ->
        h3 ->
          text 'User: '
          span class:'user_username'

        div class:'content not_subscribed', ->
          br ''
          button id:'subscribe', class:'btn btn-success btn-xlarge', ->
            i class:'icon-hand-right icon-white'
            strong ' Add Master/Slave'
        div class:'content subscribed', ->
          text 'You are already subscribed to '
          span class:'user_username'

      div id:'current_user', class:'content', ->
        p ->
          text 'Give this url to your friend(s): '
          br ''
          div id:'my_url', class:'well well-small', ->
            a ''
          br ''
          

        form id:'update_myself', class:'form-horizontal', ->
          div class:'control-group', ->
            label class:'control-label', for:'my_username', 'Username'
            div class:'controls', ->
              input id:'my_username', class:'input-xlarge', type:'text', name:'my_username'

          div class:'control-group', ->
            label class:'control-label', for:'credit_singular', 'Your Currency Name'
            div class:'controls', ->
              input id:'credit_singular', class:'input-xlarge', type:'text', name:'credit_singular'
          div class:'control-group', ->
            label class:'control-label', for:'credit_plural', 'Your Currency Name (Plural)'
            div class:'controls', ->
              input id:'credit_plural', class:'input-xlarge', type:'text', name:'credit_plural'
          div class:'control-group', ->
            div class:'controls', ->
              button type:'submit', class:'btn btn-primary', ->
                strong 'Update'

      div id:'yours', class:'content', ->
        div class:'row', ->
          h4 ->
            span class:'master_slave_username'
            text ' has earned '
            span class:'master_slave_points'
            text ' '
            span class:'user_credit_plural'
            text '.'

        div class:'row', ->
          div class:'span6', ->
            legend ->
              text 'Chores to assign to '
              span class:'master_slave_username'
              span class:'pull-right', ->
                button id:'add-chore', class:'btn btn-primary', ->
                  i class:'icon-plus icon-white'
            ul id:'your_chores', class:'item_list'

          div class:'span6', ->
            legend ->
              text 'Chores performed by '
              span class:'master_slave_username'
            ul id:'your_chores_performed', class:'item_list'
      
        div class:'row', ->
          div class:'span6', ->
            legend ->
              text 'Rewards for '
              span class:'master_slave_username'
              text ' to claim'
              span class:'pull-right', ->
                button id:'add-reward', class:'btn btn-primary', ->
                  i class:'icon-plus icon-white'
            ul id:'your_rewards', class:'item_list'

          div class:'span6', ->
            legend ->
              text 'Rewards claimed by '
              span class:'master_slave_username'
            ul id:'your_rewards_claimed', class:'item_list'


      div id:'theirs', class:'content', ->
        div class:'row', ->
          h4 ->
            text 'You have earned '
            span class:'your_points'
            text ' '
            span class:'master_slave_credit_plural'
            text '.'

        div class:'row', ->
          div class:'span6', ->
            legend ->
              text 'Chores to perform for '
              span class:'master_slave_username'
            ul id:'their_chores', class:'item_list'

          div class:'span6', ->
            legend ->
              text 'Chores performed for '
              span class:'master_slave_username'
            ul id:'their_chores_performed', class:'item_list'

        div class:'row', ->
          div class:'span6', ->
            legend ->
              text 'Rewards to claim from '
              span class:'master_slave_username'
            ul id:'their_rewards', class:'item_list'

          div class:'span6', ->
            legend ->
              text 'Rewards claimed from '
              span class:'master_slave_username'
            ul id:'their_rewards_claimed', class:'item_list'


    script src:'//code.jquery.com/jquery.min.js'
    script src:'//www.parsecdn.com/js/parse-1.1.6.min.js'
    script src:'//cdnjs.cloudflare.com/ajax/libs/moment.js/1.7.2/moment.min.js'
    script src:'//cdnjs.cloudflare.com/ajax/libs/sammy.js/0.7.1/sammy.min.js'
    script src:'bootstrap/js/bootstrap.min.js'
    script src:'coffeecup.js'

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
      
      #=========================
      # BEGIN TEMPLATES


      chore_template = coffeecup.compile ->
        li 'data-chore-id':(''+@obj.id), ->
          button class:'btn btn-mini btn-danger destroy', ->
            i class:'icon-trash icon-white'
          text '&nbsp;'
          text @master_slave.get 'username'
          text ' may earn '
          span contenteditable:'true', 'data-attr':'value', ->
            text @obj.get 'value'
          text ' '
          text Parse.User.current().get('credit_plural') or 'points'
          text ' for '
          span contenteditable:'true', 'data-attr':'name', ->
            text @obj.get 'name'
          text '. '
          button class:'btn btn-mini btn-success award', ->
            i class:'icon-share-alt icon-white'
      
      chore_performed_template = coffeecup.compile ->
        li 'data-chore-id':(''+@obj.id), ->
          text '&nbsp;'
          text @master_slave.get 'username'
          text ' earned '
          text @obj.get 'value'
          text ' '
          text Parse.User.current().get('credit_plural') or 'points'
          text ' for '
          text @obj.get 'name'
          text ' '
          text moment(@obj.createdAt).fromNow()
          text '.'

      their_chore_performed_template = coffeecup.compile ->
        li 'data-chore-id':(''+@obj.id), ->
          text '&nbsp;'
          text 'You earned '
          text @obj.get 'value'
          text ' '
          text @master_slave.get('credit_plural') or 'points'
          text ' for '
          text @obj.get 'name'
          text ' '
          text moment(@obj.createdAt).fromNow()
          text '.'

      reward_template = coffeecup.compile ->
        li 'data-reward-id':(''+@obj.id), ->
          button class:'btn btn-mini btn-danger destroy', ->
            i class:'icon-trash icon-white'
          text '&nbsp;'
          text @master_slave.get 'username'
          text ' may '
          text '&nbsp;'
          span contenteditable:'true', 'data-attr':'name', ->
            text @obj.get 'name'
          text ' for '
          span contenteditable:'true', 'data-attr':'cost', ->
            text @obj.get 'cost'
          text Parse.User.current().get('credit_plural') or 'points'
          text '.'

      your_reward_claimed_template = coffeecup.compile ->
        li 'data-reward-id':(''+@obj.id), ->
          text '&nbsp;'
          text @master_slave.get 'username'
          text ' spent '
          text @obj.get 'cost'
          text ' '
          text Parse.User.current().get('credit_plural') or 'points'
          text ' to '
          text @obj.get 'name'
          text ' '
          text moment(@obj.createdAt).fromNow()
          text '.'

      their_reward_claimed_template = coffeecup.compile ->
        li 'data-reward-id':(''+@obj.id), ->
          text '&nbsp;'
          text 'You spent '
          text @obj.get 'cost'
          text ' '
          text @master_slave.get('credit_plural') or 'points'
          text ' to '
          text @obj.get 'name'
          text ' '
          text moment(@obj.createdAt).fromNow()
          text '.'

      their_chore_template = coffeecup.compile ->
        li 'data-chore-id':(''+@obj.id), ->
          text ' You may earn '
          text @obj.get 'value'
          text ' '
          text @master_slave.get('credit_plural') or 'points'
          text ' for '
          text @obj.get 'name'
          text '.'

      their_reward_template = coffeecup.compile ->
        li 'data-reward-id':(''+@obj.id), ->
          text ' You may '
          text @obj.get 'name'
          text ' for '
          text @obj.get 'cost'
          text ' '
          text @master_slave.get('credit_plural') or 'points'
          text '. '
          button class:'btn btn-mini btn-success claim', 'data-cost':''+@obj.get('cost'), ->
            i class:'icon-shopping-cart icon-white'

      master_slave_dropdown_template = coffeecup.compile ->
        a id:'master_slave_drop', href:'#', role:'button', class:'dropdown-toggle', 'data-toggle':'dropdown', ->
          text 'Master/Slave: '
          span class:'master_slave_username'
          text '&nbsp;'
          b class:'caret'
        ul class:'dropdown-menu', role:'menu', 'aria-labelledby':'master_slave_drop', ->
          if @subscriptions.length is 0
            li -> 'You must add some friends, first! Ask them for their URL!'
          for sub in @subscriptions
            user = sub.get 'master_slave'
            li -> a tabindex:-1, href:'#', 'data-username':user.get('username'), ->
              text user.get 'username'

      # END TEMPLATES
      #=========================

      $ ->
        Parse.initialize("9v1vYmz7cxzMEENGmhDp3Zx3c4sJiJCMmResDL4i", "RnLqBUN1npB97MzJQnEjfcrQuEX3yARMPVBmrA3s")

        Chore = Parse.Object.extend 'Chore'
        Reward = Parse.Object.extend 'Reward'
        ChorePerformed = Parse.Object.extend 'ChorePerformed'
        RewardClaimed = Parse.Object.extend 'RewardClaimed'
        Subscription = Parse.Object.extend 'Subscription'

        readOnly = undefined

        currentUserView = undefined

        subscriptions = {}
        currentSlave = undefined
        yourScore = 0
        slaveScore = 0
        acl = undefined

        isSubscribed  = (user, other, callback) ->
          q = new Parse.Query Subscription
          q.equalTo 'user', Parse.User.current()
          q.equalTo 'master_slave', other
          q.include 'master_slave'
          q.find
            success: (results) ->
              callback null, results.length > 0
            error: (error) ->
              callback error, false

        app = new Sammy ->
          @get '#/', ->
            $('.nav .active').removeClass 'active'
            $('.content').hide()
            $('#main').show()

          @get '#/user/:id', ->
            if not Parse.User.current()?
              alert 'You must be logged in to do that.'
              @redirect '#/'
              return
            $('.nav .active').removeClass 'active'
            $('.content').hide()
            $('#user').show()
            currentUserView = undefined

            if @params.id is Parse.User.current().id
              url = document.location.toString()
              $('#my_url a').attr('href',url).html(url)
              $('#my_username').val Parse.User.current().get('username')
              $('#credit_singular').val Parse.User.current().get('credit_singular')
              $('#credit_plural').val Parse.User.current().get('credit_plural')
              $('#current_user').show()
            else
              user_query = new Parse.Query Parse.User
              user_query.get @params.id,
                success: (user) ->
                  $('.user_username').html user.get('username')
                  isSubscribed Parse.User.current(), user, (error, subscribed) ->
                    if error?
                      alert error.message
                    else
                      if subscribed
                        $('.subscribed').show()
                      else
                        currentUserView = user
                        $('.not_subscribed').show()
                error: (user, error) ->
                  alert error.message

          yoursOrTheirs = ->
            $('.content').hide()
            if not Parse.User.current()?
              @redirect '#/'
              return
            if currentSlave? and (currentSlave.get('username') is @params.username)
              return

            user_query = new Parse.Query Parse.User
            user_query.equalTo 'username', @params.username
            user_query.find
              error: (user, error) ->
                alert error.message

              success: (result) =>
                user = result[0]
                if not user?
                  @redirect '#/'
                  return
                isSubscribed Parse.User.current(), user, (error, subscribed) =>
                  if error?
                    alert error.message
                  else
                    if not subscribed
                      @redirect '#/'
                      return
                    $('#yours_link').css('display','inline-block').attr 'href', '#/yours/' + @params.username
                    $('#theirs_link').css('display','inline-block').attr 'href', '#/theirs/' + @params.username
                    currentSlave = user
                    $('.master_slave_username').html @params.username
                    $('.user_credit_plural').html Parse.User.current().get('credit_plural') or 'points'
                    $('.master_slave_credit_plural').html currentSlave.get('credit_plural') or 'points'
                    acl = new Parse.ACL Parse.User.current()
                    acl.setPublicReadAccess false
                    acl.setPublicWriteAccess false
                    acl.setReadAccess currentSlave, true

                    populateChoresAndRewards currentSlave
                    $('.master_slave_points').html slaveScore or 'no'
                    $('.your_points').html yourScore or 'no'

          @get '#/yours/:username', ->
            yoursOrTheirs.call @
            $('.nav .active').removeClass 'active'
            $('.nav [href^="#/yours"]').parent().addClass 'active'
            $('#yours').show()

          @get '#/theirs/:username', ->
            yoursOrTheirs.call @
            $('.nav .active').removeClass 'active'
            $('.nav [href^="#/theirs"]').parent().addClass 'active'
            $('#theirs').show()
          
          addObj = (obj, master_slave, template) ->
            el = $(template(obj:obj,master_slave:master_slave))
            el.find('[contenteditable=true]').blur (e) ->
              obj.save $(@).data('attr'), $(@).text(),
                success: (result) ->
                  obj = result
                error: (error) ->
                  alert error.message

            el.find('button.destroy').click (e) ->
              obj.destroy()
              $(@).parent().remove()

            el.find('button.award').click (e) ->
              # We assume obj is a Chore
              performed = new ChorePerformed
              performed.set 'name', obj.get 'name'
              performed.set 'value', obj.get 'value'
              performed.set 'master', Parse.User.current()
              performed.set 'slave', currentSlave
              acl = new Parse.ACL Parse.User.current()
              acl.setPublicReadAccess false
              acl.setPublicWriteAccess false
              acl.setReadAccess currentSlave, true
              performed.setACL acl
              performed.save null,
                success: (performed) ->
                  performed = performed
                  addYourChorePerformed performed, currentSlave
                error: (performed, error) ->
                  alert error.message

            el.find('button.claim').click (e) ->
              # We assume obj is a Reward
              cost = parseFloat $(@).data 'cost'
              if cost > yourScore
                alert 'You cannot afford that!'
                return
              claimed = new RewardClaimed
              claimed.set 'name', obj.get 'name'
              claimed.set 'cost', obj.get 'cost'
              claimed.set 'master', currentSlave
              claimed.set 'slave', Parse.User.current()
              acl = new Parse.ACL Parse.User.current()
              acl.setPublicReadAccess false
              acl.setPublicWriteAccess false
              acl.setReadAccess currentSlave, true
              claimed.setACL acl
              claimed.save null,
                success: (claimed) ->
                  claimed = claimed
                  addTheirRewardClaimed claimed, currentSlave
                error: (claimed, error) ->
                  alert error.message


            return el

          updateClaimButtons = ->
            $('button.claim').each ->
              cost = parseFloat $(@).data 'cost'
              if (cost?) and (yourScore >= cost)
                $(@).attr 'disabled', false
              else
                $(@).attr 'disabled', 'disabled'

          addYourChore = (chore, master_slave) ->
            $('#your_chores').prepend addObj chore, master_slave, chore_template

          addYourChorePerformed = (chore, master_slave) ->
            slaveScore += (parseFloat(chore.get('value')) or 0)
            $('.master_slave_points').html slaveScore or 'no'
            $('#your_chores_performed').prepend addObj chore, master_slave, chore_performed_template

          addYourReward = (reward, master_slave) ->
            $('#your_rewards').prepend addObj reward, master_slave, reward_template

          addYourRewardClaimed = (reward, master_slave) ->
            slaveScore -= (parseFloat(reward.get('cost')) or 0)
            $('.master_slave_points').html slaveScore or 'no'
            $('#your_rewards_claimed').prepend addObj reward, master_slave, your_reward_claimed_template

          addTheirChore = (chore, master_slave) ->
            $('#their_chores').prepend addObj chore, master_slave, their_chore_template

          addTheirChorePerformed = (chore, master_slave) ->
            yourScore += (parseFloat(chore.get('value')) or 0)
            $('.your_points').html yourScore or 'no'
            $('#their_chores_performed').prepend addObj chore, master_slave, their_chore_performed_template
            updateClaimButtons()

          addTheirReward = (reward, master_slave) ->
            $('#their_rewards').prepend addObj reward, master_slave, their_reward_template

          addTheirRewardClaimed = (reward, master_slave) ->
            yourScore -= (parseFloat(reward.get('cost')) or 0)
            $('.your_points').html yourScore or 'no'
            $('#their_rewards_claimed').prepend addObj reward, master_slave, their_reward_claimed_template
            updateClaimButtons()

          populateChoresAndRewards = (master_slave) ->
            if $('body').data('populatedFor') is master_slave.get('username')
              return
            
            slaveScore = 0
            yourScore = 0

            $('body').data
              populatedFor: master_slave.get 'username'

            $('#your_chores').html 'Please Wait...'
            chore_query = new Parse.Query Chore
            chore_query.equalTo 'user', Parse.User.current()
            chore_query.equalTo 'slave', master_slave
            chore_query.ascending 'value'
            chore_query.find
              success: (chores) ->
                $('#your_chores').html ''
                for chore in chores
                  addYourChore chore, master_slave
              error: (error) ->
                alert error.message

            $('#their_chores').html 'Please Wait...'
            chore_query = new Parse.Query Chore
            chore_query.equalTo 'user', master_slave
            chore_query.equalTo 'slave', Parse.User.current()
            chore_query.ascending 'value'
            chore_query.find
              success: (chores) ->
                $('#their_chores').html ''
                for chore in chores
                  addTheirChore chore, master_slave
              error: (error) ->
                alert error.message

            $('#your_chores_performed').html 'Please Wait...'
            chore_query = new Parse.Query ChorePerformed
            chore_query.equalTo 'master', Parse.User.current()
            chore_query.equalTo 'slave', master_slave
            chore_query.ascending 'createdAt'
            chore_query.find
              success: (chores) ->
                $('#your_chores_performed').html ''
                for chore in chores
                  addYourChorePerformed chore, master_slave
              error: (error) ->
                alert error.message

            $('#their_chores_performed').html 'Please Wait...'
            chore_query = new Parse.Query ChorePerformed
            chore_query.equalTo 'master', master_slave
            chore_query.equalTo 'slave', Parse.User.current()
            chore_query.ascending 'createdAt'
            chore_query.find
              success: (chores) ->
                $('#their_chores_performed').html ''
                for chore in chores
                  addTheirChorePerformed chore, master_slave

              error: (error) ->
                alert error.message

            $('#your_rewards').html 'Please Wait...'
            reward_query = new Parse.Query Reward
            reward_query.equalTo 'user', Parse.User.current()
            reward_query.ascending 'cost'
            if master_slave?
              reward_query.equalTo 'slave', master_slave
            reward_query.find
              success: (rewards) ->
                $('#your_rewards').html ''
                for reward in rewards
                  addYourReward reward, master_slave
              error: (error) ->
                alert error.message

            $('#their_rewards').html 'Please Wait...'
            reward_query = new Parse.Query Reward
            reward_query.equalTo 'user', master_slave
            reward_query.equalTo 'slave', Parse.User.current()
            reward_query.ascending 'cost'
            reward_query.find
              success: (rewards) ->
                $('#their_rewards').html ''
                for reward in rewards
                  addTheirReward reward, master_slave

              error: (error) ->
                alert error.message

            $('#your_rewards_claimed').html 'Please Wait...'
            reward_query = new Parse.Query RewardClaimed
            reward_query.equalTo 'master', Parse.User.current()
            reward_query.equalTo 'slave', master_slave
            reward_query.ascending 'createdAt'
            reward_query.find
              success: (rewards) ->
                $('#your_rewards_claimed').html ''
                for reward in rewards
                  addYourRewardClaimed reward, master_slave
              error: (error) ->
                alert error.message

            $('#their_rewards_claimed').html 'Please Wait...'
            reward_query = new Parse.Query RewardClaimed
            reward_query.equalTo 'master', master_slave
            reward_query.equalTo 'slave', Parse.User.current()
            reward_query.ascending 'createdAt'
            reward_query.find
              success: (rewards) ->
                $('#their_rewards_claimed').html ''
                for reward in rewards
                  addTheirRewardClaimed reward, master_slave
              error: (error) ->
                alert error.message

          logged_in = (user) ->
            subscriptions = {}
            yourScore = 0
            $('.username_display').text user.get 'username'
            $('#not_logged_in').hide()
            $('#logged_in').show()

            $('#master_slave_dropdown').html 'Please Wait...'

            user_query = new Parse.Query Subscription
            user_query.equalTo 'user', Parse.User.current()
            user_query.include 'master_slave'
            user_query.find
              success: (results) ->
                subscriptions = {}
                for subscription in results
                  master_slave = subscription.get 'master_slave'
                  subscriptions[master_slave.get('username')] = master_slave

                $('#master_slave_dropdown').html master_slave_dropdown_template
                  subscriptions: results
                .show()
              error: (error) ->
                $('#master_slave_dropdown').html ''
                alert error.message

          $('#log-in').submit (e) ->
            e.preventDefault()

            name = $('#log-in-name').val()
            pass = $('#log-in-pass').val()
            Parse.User.logIn name, pass,
              success: (user) ->
                logged_in user
              error: (user, error) ->
                alert error.message

            $('#log-in-name').val ''
            $('#log-in-pass').val ''

            return false
          
          _newProfile =
            credit_singular: 'point'
            credit_plural: 'points'

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
                    logged_in user
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
            app.setLocation '#/'

          $('#add-chore').click ->
            chore = new Chore
            chore.set 'name', 'doing something awesome'
            chore.set 'value', '10'
            chore.set 'user', Parse.User.current()
            chore.set 'slave', currentSlave
            acl = new Parse.ACL Parse.User.current()
            acl.setPublicReadAccess false
            acl.setPublicWriteAccess false
            acl.setReadAccess currentSlave, true
            chore.setACL acl
            chore.save null,
              success: (chore) ->
                chore = chore
              error: (chore, error) ->
                alert error.message
            addYourChore chore, currentSlave

          $('#add-reward').click ->
            reward = new Reward
            reward.set 'name', 'get something'
            reward.set 'cost', '10'
            reward.set 'user', Parse.User.current()
            reward.set 'slave', currentSlave
            reward.setACL acl
            reward.save null,
              success: (reward) ->
                reward = reward
              error: (reward, error) ->
                alert error.message
            addYourReward reward, currentSlave

          $('#master_slave_dropdown a[data-username]').live 'click', (e) ->
            e.preventDefault()
            username = $(@).data('username')
            app.setLocation '#/yours/' + username
            return false

          $('[contenteditable=true]').live 'keydown', (e) ->
            if e.which is 13 # enter key
              $(@).blur()
              return false

          $('#subscribe').click (e) ->
            sub = new Subscription
            sub.set 'user', Parse.User.current()
            sub.set 'master_slave', currentUserView
            acl = new Parse.ACL Parse.User.current()
            acl.setPublicReadAccess false
            acl.setPublicWriteAccess false
            acl.setReadAccess currentUserView, true
            sub.setACL acl
            sub.save null,
              success: (reward) ->
                reward = reward
                window.location.reload()
              error: (reward, error) ->
                alert error.message

          $('#myself').click (e) ->
            app.setLocation '#/user/' + Parse.User.current().id
            return false
          $('#update_myself').submit (e) ->
            e.preventDefault()
            $('#update_myself input').blur()
            $('#update_myself button').button 'loading'
            Parse.User.current().set 'username', $('#my_username').val()
            Parse.User.current().set 'credit_singular', $('#credit_singular').val()
            Parse.User.current().set 'credit_plural', $('#credit_plural').val()
            return false if not Parse.User.current().dirty()

            Parse.User.current().save null,
              success: (user) ->
                $('#update_myself button').button 'reset'
                logged_in user
              error: (user, error) ->
                $('#update_myself button').button 'reset'
                alert error.message
            return false

          if Parse.User.current()
            logged_in Parse.User.current()
            readOnly = new Parse.ACL Parse.User.current()
            readOnly.setPublicReadAccess false
            readOnly.setPublicWriteAccess false

        app.run('#/')
