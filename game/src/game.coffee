game =
  init: ->
    if not gfx.init()
      alert "Could not set up game canvas!"
      return # abort
    #clear canvas
    gfx.clear()

    # this is were all the magic happens
    gfx.load ->
      c = gfx.ctx #context alias
      
      #helper function to create random number
      rand = (max) -> Math.floor Math.random() * max

      test = () -> #simple test writing banner
        c.fillStyle = "orange"
        c.fillRect 10, 10, 300, 80
        c.strokeStyle = "#3f3f3f"
        c.strokeRect 10, 10, 300, 80
        c.fillStyle = "#202020"
        c.font = "14pt monospace"
        c.fillText "Professor Digman-Runner", 30, 55

      scaletest = () -> #scale Professor
        gfx.drawSprite(0, 0, 50, 50)
        gfx.drawSprite(0, 0, 74, 50, 1, 1, 2)

      fillMap = () -> # fill canvas with stone sprites
        for y in [0..19]
          for x in [0..23]
            col = rand 7
            row = rand 3
            #gfx.drawSprite col, row, x*24, y*24
            gfx.drawSprite 4, row, x*24, y*24
      
      makeANinja = () ->
        x: rand gfx.w
        y: rand gfx.h

      drawANinja = (n) -> gfx.drawSprite 0, 1, n.x, n.y
      
      #parenthesis for list comprehension needed
      ninjas = (makeANinja() for [0..20])
      leftninjas = (n for n in ninjas when n.x < gfx.w/2)

      #drawANinja n for n in leftninjas

      level1 = """
      .............
      ...........*.
      ....@#@@@@#@.
      .....#....#..
      .....#....#..
      ..*..#...@@@.
      ..@@@@@...#..
      ...#......#..
      ...#......#..
      ...#......#..
      .OOOOOOOOOOOO
      """

      makeLevel = (ascii) ->
        # tile2symbol map
        tiles =
          "@": [4,1] #dirt
          "O": [4,0] #rock
          "#": [5,0] #ladder
          "*": [5,1] #special
        #split multiline ascii
        asciiMap = (row.split "" for row in ascii.split "\n")
        #map the characters to their tiles
        (for row in asciiMap
          for col in row
            tiles[col])

      #create level from ascii map
      level = makeLevel level1
      #console.log "level: #{ level }"

      #draw the level
      for row, y in level
        for tile, x in row
          continue if not tile #makeLebel returned null for unknown chars
          xPos = x * gfx.tileW
          yPos = y * gfx.tileH
          gfx.drawSprite tile[0], tile[1], xPos, yPos



game.init()
