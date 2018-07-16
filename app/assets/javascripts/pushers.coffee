# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

pusher_reset = ->
    # Disconnect and remove all pusher instance
    # to avoide multiple execution.
    if Pusher
        $.each(Pusher.instances, (index, instance) ->
            instance.disconnect()
        )
        Pusher.instances = []
        console.log 'pusher_reset fired.'


ready = ->

    # Pusher notification
    # Pusher['private-1'].trigger() in controller
    current_user_id = $('#current_user_id').attr('data-value')
    api_key = $('#pusher_api_key').attr('data-value')

    if Pusher && current_user_id
        pusher  = new Pusher(api_key, { cluster: 'eu' })
        channel = pusher.subscribe('private-' + current_user_id)

        channel.bind('new_message', (data) ->
            console.log 'fire'
            # Will be executed when the method in controller called.
            if !$('.notify-wrap').length
                $('body').prepend('<div class="notify-wrap"></div>')
            msg = data.sender + ' さんからリクエストを受信しました。'
            msgDiv = '<div class="notify">' +
                                    '<span class="got-it"><i class="fa fa-times-circle"></i></span>' +
                                    '<a href="' + data.link + '">' + msg + '</a>' +
                                '</div>'
            $(msgDiv).prependTo('.notify-wrap').animate({ right: 0 }, 350)
            ### if you want to hide it after some seconds

           setTimeout( ->
                $('#notify').fadeOut()
            , 10000)
            ###
        )
    $('body').on 'click', '.got-it', (e) ->
        e.preventDefault()
        $(this).closest('.notify').remove()

# For turbolinks
$(document).ready(ready)
$(document).on 'page:load', ready
$(document).on 'page:receive', pusher_reset
