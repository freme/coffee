@game =
  running: false #game started or stopped/paused?
  init: ->
    if not gfx.init()
      alert "no canvas"
      return
    # callback magic
    gfx.load -> game.reset()
  stop: -> @running = false
  start: -> @running = true
  reset: ->
    keys.reset()
    @start()
    @tick()
  tick: ->
    return if not @running
    gfx.clear()
    @update()
    @render()
    setTimeout (-> game.tick()), 33 # 1000ms/30fps roughly equals 33
    # requestAnimationFrame -> game.tick()
  update: ->
  render: ->

