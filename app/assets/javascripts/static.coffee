# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



Pusher.log = (message) ->
  if window.console and window.console.log
    window.console.log message
  return

pusher = new Pusher('1732a75d193ce5c83ca3')
channel = pusher.subscribe('io')
channel.bind 'incoming', (data) ->
  console.log data.data

  template = """
<div class="columns small-12 medium-6 medium-centered card text-center  animated zoomInRight">
  <h5>
    <i class="fa fa-github"></i>
    Github
  </h5>
  <h3 class="name">#{data.data.actor.login}</h3>
  <h5>
    did a #{data.data.type} on
    <br>
    <br>
    <code>#{data.data.repo.name}</code>
  </h5>
</div>
"""
  $("#feed").prepend(template)
