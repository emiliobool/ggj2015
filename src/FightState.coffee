class FightState extends Phaser.State
	constructor: (@game) ->
    null
  create: ->
    @fightScene = new FightScene @game
    @fightMenu = new FightMenu @game
    @fightMenu.onProceed = () =>
      @fightScene.killBoss()
    @fightScene.onBossKilled = () =>
      @fadeOut()
  fadeOut: ->
    @fightMenu.fadeOut()
    @fightScene.fadeOut () =>
      @game.time.events.add Phaser.Timer.SECOND * 10, () =>
        @game.state.start 'mapState'
      

  update: ->
    if @fightMenu 
      @fightMenu.update()
    if @fightScene
      @fightScene.update()
