class FightScene
  constructor: (@game) ->
    @group = @game.add.group()

    @sprite_bg =  @group.create 0, 0, 'fightbg'
    @dragon  = @group.create 80, 0, 'fightboss'
    @hero  = @group.create 400, 70, 'player'
    @hero.frame = 15
    @hero2  = @group.create 430, 110, 'player'
    @hero2.frame = 13
    @hero3  = @group.create 460, 150, 'player'
    @hero3.frame = 18
    @music = @game.add.audio 'boss_battle'
    @music.onDecoded.add @startMusic, this

  startMusic: ->
    @music.volume = 0.7
    @music.play('',0,1,true)

  killBoss: ->

    @music.stop()

    @filter = @game.add.filter 'Fire', @game.width, @game.height, 0.5
    @filter.alpha = 0.5;
    @sprite_bg.filters = [@filter];

    
    boss_death = @game.add.audio 'boss_death'
    boss_death.play()
    # @animations.add 'left', [12,13,14], 10, true
    #special_sprite = @game.add.sprite 10, 10, 'special', 1
    #special_sprite.add
    
    tween = @game.add.tween(@dragon).to( { alpha: 0 }, 6000, "Power0").start()
    tween.onComplete.add () =>
      #@sprite_bg.filters = []
      @sprite_bg.destroy()
      @onBossKilled()

  fadeOut: (callback) ->
    
    tween = @game.add.tween(@group).to( { alpha: 0 }, 6000, "Power0").start()
    tween.onComplete.add () ->
      callback()

  update: ->
    if @filter
      @filter.update()

    
    