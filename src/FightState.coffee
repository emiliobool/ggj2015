class FightState extends Phaser.State
	constructor: (@game) ->
    null
  create: ->
    console.log 'here'
    @fightScene = new FightScene @game
    @fightMenu = new FightMenu @game
  update: ->
    @fightMenu.update()
