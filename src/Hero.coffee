class Hero extends Phaser.Sprite
	constructor: (@game) ->

    super @game, 1920, 1500, 'player', 1 #x, y, frame
    @game.add.existing this
    @game.physics.enable this, Phaser.Physics.ARCADE

    @body.setSize 28, 28, 2, 4;
    @animations.add 'left', [12,13,14], 10, true
    @animations.add 'right', [24,25,26], 10, true
    @animations.add 'up', [36,37,38], 10, true
    @animations.add 'down', [0, 1, 2], 10, true

    @cursors = @game.input.keyboard.createCursorKeys()
    
  update: ->
    @body.velocity.set 0
    
    play = 'stop'

    if @cursors.left.isDown
      @body.velocity.x = - 100
      play = 'left'
    if @cursors.right.isDown
      @body.velocity.x = 100
      play = 'right'
    if @cursors.up.isDown
      @body.velocity.y = -100
      play = 'up'
    if @cursors.down.isDown
      @body.velocity.y = 100
      play = 'down'

    if play == 'stop'
      @animations.stop()
    else
      @play play

    null

    