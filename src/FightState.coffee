class FightState extends Phaser.State
	constructor: (@game) ->
    null
  create: ->
    @fightScene = new FightScene @game
    #@game.time.events.add(Phaser.Timer.SECOND * 3, @createFightMenu, this);
    @createFightMenu()
  createFightMenu: ->
    @fightMenu = new FightMenu @game
  update: ->
    if @fightMenu 
      @fightMenu.update()
