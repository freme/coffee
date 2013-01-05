@game =
  running: false #game started or stopped/paused?
  init: ->
    if not gfx.init()
      alert "no canvas"
      return
  stop: ->
  start: ->
  reset: ->
  tick: ->
  update: ->
  render: ->

