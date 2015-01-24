class Game
  constructor: ->
    @game = new Phaser.Game 800, 600, Phaser.CANVAS, 'game', {preload: @preload, create: @create, update: @update, render: @render}
    @layer = null
    @player = null
    @cursors
  
  preload: ->
    @game.load.tilemap 'map', 'assets/tilemaps/csv/catastrophi_level2.csv', null, Phaser.Tilemap.CSV
    @game.load.image 'tiles', 'assets/tilemaps/tiles/catastrophi_tiles_16.png'
    @game.load.spritesheet 'player', 'assets/sprites/spaceman.png', 16, 16

    null
  
  create: ->
    @map = @game.add.tilemap 'map', 16, 16
    @map.addTilesetImage 'tiles'
    
    @layer = @map.createLayer 0
    @layer.resizeWorld()
    @map.setCollisionBetween 54, 83

    @player = @game.add.sprite 48, 48, 'player', 1
    @player.animations.add 'left', [8,9], 10, true
    @player.animations.add 'right', [1,2], 10, true
    @player.animations.add 'up', [11,12,13], 10, true
    @player.animations.add 'down', [4,5,6], 10, true

    @game.physics.enable @player, Phaser.Physics.ARCADE

    @player.body.setSize 10, 14, 2, 1;

    @game.camera.follow @player;

    @cursors = @game.input.keyboard.createCursorKeys();

    null

  update: ->
    @game.physics.arcade.collide @player, @layer

    @player.body.velocity.set 0

    if @cursors.left.isDown
      @player.body.velocity.x = -100
      @player.play 'left'

    else if @cursors.right.isDown
      @player.body.velocity.x = 100
      @player.play 'right'

    else if @cursors.up.isDown
      @player.body.velocity.y = -100
      @player.play 'up' 
    
    else if @cursors.down.isDown
      @player.body.velocity.y = 100
      @player.play 'down'
    
    else
      @player.animations.stop();
    
    null

  render: ->

new Game