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
    @player.anchor.set 0.5
    @game.camera.follow @player

    @layer.alpha = 0
    @player.alpha = 0

    @theEnd = @game.add.text 0, 0, 'The End', { font: '60px VT323', fill: '#FFFFFF', align: 'center'}
    @theEnd.y = @game.height /2
    @theEnd.x = @game.width / 2
    @theEnd.fixedToCamera = true
    @theEnd.alpha = 0.5
    @theEnd.anchor.set 0.5

    @fadeIn()

  update: ->
    @game.physics.arcade.collide @player, @layer
    @player.update()
  fadedIn: ->

  fadeIn: ->
    tween = @game.add.tween(@layer).to( { alpha: 1 }, 2500, "Power0").start()
    tween.onComplete.add () =>
      @fadedIn()
    @game.add.tween(@player).to( { alpha: 1 }, 2500, "Power0").start()
   
  shutdown: ->
    @player.destroy()
    @layer.destroy()
    @map.destroy()