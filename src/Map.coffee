class Map
  constructor: (@game) ->
    @map = game.add.tilemap 'map', 32, 32
    @map.addTilesetImage 'tiles'
    @map.setCollisionBetween 54, 83
    
    @layer = @map.createLayer 0
    @layer.resizeWorld()
    @layer.debug = true;
    
    @player = new Hero @game
    @game.camera.follow @player

  update: ->
    @game.physics.arcade.collide @player, @layer
    @player.update()
  destroy: ->
    @player.destroy()
    @layer.destroy()
    @map.destroy()