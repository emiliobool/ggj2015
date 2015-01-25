class FightScene
  constructor: (@game) ->
    @group = @game.add.group()

    @sprite_bg =  @group.create 0, 0, 'fightbg'
    @dragon  = @group.create 80, 0, 'fightboss'
    @hero  = @group.create 400, 70, 'player'
    @hero2  = @group.create 430, 110, 'player'
    @hero3  = @group.create 460, 150, 'player'

  killBoss: ->
    @filter = @game.add.filter 'Fire', @game.width, @game.height, 0.5
    @filter.alpha = 0.5;
    @sprite_bg.filters = [@filter];
    
    tween = @game.add.tween(@dragon).to( { alpha: 0 }, 6000, "Power0").start()
    tween.onComplete.add () =>
      @sprite_bg.filters = []
      @onBossKilled()

  fadeOut: (callback) ->
    
    tween = @game.add.tween(@group).to( { alpha: 0 }, 6000, "Power0").start()
    tween.onComplete.add () ->
      callback()

  update: ->
    if @filter
      @filter.alpha -= 0.01
      @filter.update()

    
    