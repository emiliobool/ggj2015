class Fight
	constructor: (@game) ->
    @fightScene = new FightScene @game
    @fightMenu = new FightMenu @game
    
  update: ->

