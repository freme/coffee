class Entity
  speed: 4
  dir: "LEFT" #Entity faces left
  constructor: (@x, @y) ->
  update: ->
  render: (gfx) -> gfx.ctx.fillText "?", @x, @y

