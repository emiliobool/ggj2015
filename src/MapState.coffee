class MapState extends Phaser.State
  constructor: ->
    
  create: ->
    @map = @game.add.tilemap 'map', 32, 32
    @map.addTilesetImage 'tiles'
    #@map.setCollisionBetween 54, 83
    
    @layer = @map.createLayer 0
    @layer.resizeWorld()
    @layer.debug = true;
    
    @player = new Hero @game
    @game.camera.follow @player

    @map.alpha = 0
    @player.alpha = 0

    @fadeIn()

  update: ->
    @game.physics.arcade.collide @player, @layer
    @player.update()
  fadedIn: ->

  fadeIn: ->
    tween = @game.add.tween(@map).to( { alpha: 1 }, 2500, "Power0").start()
    tween.onComplete.add () =>
      @fadedIn()
    @game.add.tween(@player).to( { alpha: 1 }, 2500, "Power0").start()
   
  shutdown: ->
    @player.destroy()
    @layer.destroy()
    @map.destroy()