class FightScene
  constructor: (@game) ->
    @group = @game.add.group()

    @sprite_bg =  @group.create 0, 0, 'fightbg'
    @dragon  = @group.create 80, 0, 'fightboss'
    @hero  = @group.create 400, 70, 'player'
    @hero2  = @group.create 430, 110, 'player'
    @hero3  = @group.create 460, 150, 'player'

    @music = @game.add.audio 'boss_battle'
    @music.onDecoded.add @startMusic, this

  startMusic: ->
    @music.volume = 0.7
    @music.fadeIn(3000)

  killBoss: ->

    @music.stop()
    
    @filter = @game.add.filter 'Fire', @game.width, @game.height, 0.5
    @filter.alpha = 0.5;
    @sprite_bg.filters = [@filter];

    
    boss_death = @game.add.audio 'boss_death'
    boss_death.play()

    special_sprite = @game.add.sprite 10, 10, 'special', 1
    
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

    
    